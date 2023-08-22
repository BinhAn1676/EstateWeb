package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.dto.request.CustomerRequest;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.entity.CustomerEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findCustomer(CustomerRequest customerRequest, Pageable pageable);
    int countTotalItem(CustomerRequest customerRequest);
}
