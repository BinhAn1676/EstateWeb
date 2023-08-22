package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.custom.CustomerRepositoryCustom;
import com.laptrinhjavaweb.repository.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<CustomerEntity,Long>, CustomerRepositoryCustom {
    boolean existsByIdAndUsers_Id(Long customerId,Long staffId);
    Long countByIdIn(List<Long> ids);
    void deleteByIdIn(List<Long> ids);
}
