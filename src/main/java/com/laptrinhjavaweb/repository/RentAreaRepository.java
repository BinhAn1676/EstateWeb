package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    void deleteByBuilding_Id(Long id);
}
