package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.response.CustomerResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.entity.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    public CustomerResponseDTO convertToCustomerResponse(CustomerEntity entity){
        CustomerResponseDTO result = modelMapper.map(entity,CustomerResponseDTO.class);
        result.setStaffName(String.join(",",
                entity.getUsers()
                        .stream()
                        .map(UserEntity::getFullName)
                        .collect(Collectors.toList())
        ));
        ;
        if(entity.getUsers().size()!=0){
            result.setStatus("Dang Xu Ly");
        }else{
            result.setStatus("Chua Xu Ly");
        }
        return result;
    }

    public CustomerDTO convertToDto(CustomerEntity customerEntity) {
        CustomerDTO customerDTO = modelMapper.map(customerEntity,CustomerDTO.class);
        return customerDTO;
    }


    public List<StaffResponseDTO> convertToResponse(List<UserEntity> users, Long customerId) {
        List<StaffResponseDTO> result = new ArrayList<>();
        for (UserEntity item: users ) {
            StaffResponseDTO staff = new StaffResponseDTO();
            staff.setFullName(item.getFullName());
            staff.setStaffId(item.getId());
            if(customerRepository.existsByIdAndUsers_Id(customerId,item.getId())){
                staff.setChecked("checked");
            }
            result.add(staff);
        }

        return result;
    }

    public CustomerEntity convertToEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO,CustomerEntity.class);
        return customerEntity;
    }
}
