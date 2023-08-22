package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.repository.entity.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    /*@Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;*/

    public UserDTO convertToDto (UserEntity entity){
        UserDTO result = modelMapper.map(entity, UserDTO.class);
        return result;
    }

    public UserEntity convertToEntity (UserDTO dto){
        UserEntity result = modelMapper.map(dto, UserEntity.class);
        return result;
    }

    public List<StaffResponseDTO> convertToResponse(List<UserEntity> userEntities, Long buildingId){
        //List<UserEntity> usersAssigned = userRepository.findByBuildings_Id(buildingId);
        List<StaffResponseDTO> result = new ArrayList<>();
        for (UserEntity item: userEntities ) {
            StaffResponseDTO staff = new StaffResponseDTO();
            staff.setFullName(item.getFullName());
            staff.setStaffId(item.getId());
            /*if(usersAssigned.contains(item)){
                staff.setChecked("checked");
            }*/
            if(buildingRepository.existsByIdAndStaffs_Id(buildingId,item.getId())){
                staff.setChecked("checked");
            }
            result.add(staff);
        }

        return result;
    }
}
