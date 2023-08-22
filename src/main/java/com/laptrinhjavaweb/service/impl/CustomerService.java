package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerRequest;
import com.laptrinhjavaweb.dto.request.DeleteCustomerRequest;
import com.laptrinhjavaweb.dto.response.BuildingResponseDTO;
import com.laptrinhjavaweb.dto.response.CustomerResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.exception.CustomerNotFoundException;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.entity.UserEntity;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<CustomerResponseDTO> findCustomer(CustomerRequest customerRequest, Pageable pageable) {
        List<String> roles = SecurityUtils.getAuthorities();
        if(roles.contains(SystemConstant.USER_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerRequest.setStaffId(staffId);
        }
        List<CustomerEntity> entities = customerRepository.findCustomer(customerRequest,pageable);
        List<CustomerResponseDTO> results = new ArrayList<>();
        for(CustomerEntity item : entities){
            CustomerResponseDTO customerResponseDTO=customerConverter.convertToCustomerResponse(item);
            results.add(customerResponseDTO);
        }
        return results;
    }

    @Override
    public int countTotalItems(CustomerRequest customerRequest) {
        List<String> roles = SecurityUtils.getAuthorities();
        if(roles.contains(SystemConstant.USER_ROLE)){
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerRequest.setStaffId(staffId);
        }
        return customerRepository.countTotalItem(customerRequest);
    }

    @Override
    public CustomerDTO findById(Long customerId) {
        Optional<CustomerEntity> entity = customerRepository.findById(customerId);
        CustomerEntity customerEntity = entity.get();
        CustomerDTO customerDTO= customerConverter.convertToDto(customerEntity);
        return customerDTO;
    }

    @Override
    public List<StaffResponseDTO> loadStaffForCustomer(Long customerId) {
        List<UserEntity> users = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<StaffResponseDTO> staffs = customerConverter.convertToResponse(users,customerId);
        return staffs;
    }

    @Override
    @Transactional
    public void save(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.convertToEntity(customerDTO);
        customerRepository.save(customerEntity);
    }

    @Override
    @Transactional
    public void delete(DeleteCustomerRequest deleteCustomerRequest) {
        List<Long> ids = deleteCustomerRequest.getCustomerIds();
        if(ids.size()>0){
            Long count = customerRepository.countByIdIn(ids);
            if(count != ids.size()){
                throw new CustomerNotFoundException(SystemConstant.CUSTOMER_NOT_FOUND);
            }
        }
        customerRepository.deleteByIdIn(ids);
    }
}
