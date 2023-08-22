package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.dto.request.DeleteBuildingRequest;
import com.laptrinhjavaweb.dto.response.BuildingResponseDTO;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.exception.BuildingNotFoundException;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.entity.RentAreaEntity;
import com.laptrinhjavaweb.repository.entity.UserEntity;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.utils.CastingUtils;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import javassist.NotFoundException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;


    /*@Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;*/

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private UserRepository userRepository;



    @Override
    public List<BuildingResponseDTO> findAll() {
        List<BuildingResponseDTO> results = new ArrayList<>();
        List<BuildingEntity> entities = buildingRepository.findAll();
        for(BuildingEntity item : entities){
            BuildingResponseDTO buildingResponseDTO=buildingConverter.convertToBuildingResponse(item);
            results.add(buildingResponseDTO);
        }
        return results;
    }

    @Override
    @Transactional
    public void save(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        //update image
        Long buildingId = buildingDTO.getId();
        if (buildingId != null) { // update
            Optional<BuildingEntity> foundBuilding = buildingRepository.findById(buildingId);
            buildingEntity.setImage(foundBuilding.get().getImage());
        }
        saveThumbnail(buildingDTO, buildingEntity);
       /* //save rentArea
        List<Integer> values = Arrays.stream(buildingDTO.getRentArea().split(","))
                .map(this::parseIntWithFallback)
                .filter(num -> num != null)
                .collect(Collectors.toList());
        List<RentAreaEntity> rentAreas = values.stream()
                .map(value -> {
                    RentAreaEntity rentArea = new RentAreaEntity();
                    rentArea.setBuilding(buildingEntity);
                    rentArea.setValue(value);
                    return rentArea;
                })
                .collect(Collectors.toList());
        buildingEntity.setRentAreas(rentAreas);*/
        buildingRepository.save(buildingEntity);
    }


    @Override
    public Map<String, String> getDistrictMap() {
        Map<String,String> districtsMap = new HashMap<>();
        for(DistrictsEnum item : DistrictsEnum.values()){
            districtsMap.put(item.toString(),item.getDistrictValue());
        }
        return districtsMap;
    }

    @Override
    public Map<String, String> getBuildingTypeMap() {
        Map<String,String> buildingTypesMap = new HashMap<>();
        for(BuildingTypesEnum item : BuildingTypesEnum.values()){
            buildingTypesMap.put(item.toString(),item.getTypeValue());
        }
        return buildingTypesMap;
    }

    @Override
    public List<BuildingResponseDTO> findBuilding(BuildingRequest buildingRequest,Pageable pageable) {
        List<String> roles = SecurityUtils.getAuthorities();
        if(roles.contains(SystemConstant.USER_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            buildingRequest.setStaffId(staffId);
        }


        List<BuildingEntity> entities = buildingRepository.findBuilding(buildingRequest,pageable);
        List<BuildingResponseDTO> results = new ArrayList<>();
        for(BuildingEntity item : entities){
            BuildingResponseDTO buildingResponseDTO=buildingConverter.convertToBuildingResponse(item);
            results.add(buildingResponseDTO);
        }
        return results;
    }

    @Override
    public BuildingDTO findById(Long id) {
        Optional<BuildingEntity> entity = buildingRepository.findById(id);
        BuildingEntity buildingEntity = entity.get();
        BuildingDTO buildingDTO= buildingConverter.convertToDto(buildingEntity);
        return buildingDTO;
    }

    @Override
    @Transactional
    public void deleteBuilding(DeleteBuildingRequest deleteBuildingRequest) {
        List<Long> ids = deleteBuildingRequest.getBuildingIds();
        if(ids.size()>0){
            Long count = buildingRepository.countByIdIn(ids);
            if(count != ids.size()){
                throw new BuildingNotFoundException(SystemConstant.BUILDING_NOT_FOUND);
            }
        }
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public List<BuildingResponseDTO> getAllBuildings(Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.getAllBuildings(pageable);
        List<BuildingResponseDTO> results = new ArrayList<>();
        for (BuildingEntity userEntity : buildingEntities) {
            BuildingResponseDTO buildingResponseDTO = buildingConverter.convertToBuildingResponse(userEntity);
            results.add(buildingResponseDTO);
        }
        return results;
    }

    @Override
    public int countTotalItems(BuildingRequest buildingRequest) {
        List<String> roles = SecurityUtils.getAuthorities();
        if(roles.contains(SystemConstant.USER_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            buildingRequest.setStaffId(staffId);
        }
        return buildingRepository.countTotalItem(buildingRequest);
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            UploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }

}
