package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.CustomerRequest;
import com.laptrinhjavaweb.dto.request.DeleteCustomerRequest;
import com.laptrinhjavaweb.dto.response.CustomerResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICustomerService {
    List<CustomerResponseDTO> findCustomer(CustomerRequest customerRequest, Pageable pageable);

    int countTotalItems(CustomerRequest customerRequest);

    CustomerDTO findById(Long customerId);

    List<StaffResponseDTO> loadStaffForCustomer(Long customerId);

    void save(CustomerDTO customerDTO);

    void delete(DeleteCustomerRequest deleteCustomerRequest);
}
