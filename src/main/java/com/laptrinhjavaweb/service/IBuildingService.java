package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.dto.request.DeleteBuildingRequest;
import com.laptrinhjavaweb.dto.response.BuildingResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingResponseDTO> findAll();
    void save(BuildingDTO buildingDTO);
    Map<String,String> getDistrictMap();
    Map<String,String> getBuildingTypeMap();
    List<BuildingResponseDTO> findBuilding(BuildingRequest buildingRequest,Pageable pageable);
    BuildingDTO findById(Long id);
    void deleteBuilding(DeleteBuildingRequest deleteBuildingRequest);

    List<BuildingResponseDTO> getAllBuildings(Pageable pageable);
    int countTotalItems(BuildingRequest buildingRequest);
}
