package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.response.BuildingResponseDTO;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.entity.RentAreaEntity;
import com.laptrinhjavaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO convertToDto (BuildingEntity entity){
        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
        //type
        String[] types = entity.getType().split(",");
        result.setBuildingTypes(Arrays.asList(types));
        //rentArea
        /*List<RentAreaEntity> rentAreas = entity.getRentAreas();
        List<String> rentArea = new ArrayList<>();
        for(RentAreaEntity item : rentAreas){
            rentArea.add(item.getValue().toString());
        }
        result.setRentArea(String.join(",",rentArea));*/
        result.setRentArea(
                entity.getRentAreas()
                        .stream()
                        .map(RentAreaEntity -> {
                            if (RentAreaEntity.getValue() != null) {
                                return RentAreaEntity.getValue().toString();
                            } else {
                                return "";
                            }
                        })
                        .collect(Collectors.joining(","))
        );
        return result;
    }

    public BuildingEntity convertToEntity (BuildingDTO dto){
        BuildingEntity result = modelMapper.map(dto, BuildingEntity.class);
        //type
        String type = dto.getBuildingTypes().stream().map(item -> item).collect(Collectors.joining(","));
        result.setType(type);
        //rentarea
        if(!StringUtils.isNullOrEmpty(dto.getRentArea())){
            List<Integer> values = Arrays.stream(dto.getRentArea().split(","))
                    .map(this::parseIntWithFallback)
                    .filter(num -> num != null)
                    .collect(Collectors.toList());
            List<RentAreaEntity> rentAreas = values.stream()
                    .map(value -> {
                        RentAreaEntity rentArea = new RentAreaEntity();
                        rentArea.setBuilding(result);
                        rentArea.setValue(value);
                        return rentArea;
                    })
                    .collect(Collectors.toList());
            result.setRentAreas(rentAreas);
        }
        return result;
    }
    private Integer parseIntWithFallback(String str) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return null;
        }
    }
    public BuildingResponseDTO convertToBuildingResponse(BuildingEntity entity){
        BuildingResponseDTO result = modelMapper.map(entity,BuildingResponseDTO.class);
        if(!entity.getDistrict().equalsIgnoreCase("-1")){
            DistrictsEnum districtsEnum = DistrictsEnum.valueOf(entity.getDistrict());
            result.setAddress(entity.getStreet() + " " + entity.getWard() + " " + districtsEnum.getDistrictValue());
        }else{
            result.setAddress(entity.getStreet() + " " + entity.getWard());
        }
        return result;
    }
}
