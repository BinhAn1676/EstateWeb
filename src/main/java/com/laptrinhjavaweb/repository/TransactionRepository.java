package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.entity.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TransactionRepository extends JpaRepository<TransactionEntity,Long> {
    List<TransactionEntity> findByCodeAndCustomer_Id(String code,Long id);
}
