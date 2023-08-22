package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoryCustom {
    void deleteByIdIn(List<Long> ids);
    Long countByIdIn(List<Long> ids);
    boolean existsByIdAndStaffs_Id(Long buildingId,Long staffId);
}
