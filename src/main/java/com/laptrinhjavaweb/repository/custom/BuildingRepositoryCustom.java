package com.laptrinhjavaweb.repository.custom;

import java.util.List;
import java.util.Map;

import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import org.springframework.data.domain.Pageable;

public interface BuildingRepositoryCustom {
	List<BuildingEntity> findBuilding(BuildingRequest buildingRequest,Pageable pageable);
	List<BuildingEntity> getAllBuildings(Pageable pageable);
	int countTotalItem(BuildingRequest buildingRequest);
}
