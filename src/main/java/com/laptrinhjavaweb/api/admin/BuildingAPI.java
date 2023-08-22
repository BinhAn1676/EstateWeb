package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.DeleteBuildingRequest;
import com.laptrinhjavaweb.dto.response.ResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController(value="buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private IUserService userService;

    @PostMapping
    public BuildingDTO createBuilding(@RequestBody BuildingDTO newBuilding){
        buildingService.save(newBuilding);
        return newBuilding;
    }
    @PutMapping("/{buildingid}")
    public BuildingDTO updateBuilding(@RequestBody BuildingDTO newBuilding,@PathVariable("buildingid") Long buildingId){
        buildingService.save(newBuilding);
        return newBuilding;
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteBuilding(@RequestBody DeleteBuildingRequest deleteBuilding){
        if(deleteBuilding.getBuildingIds().size()>0){
            buildingService.deleteBuilding(deleteBuilding);
        }
        return ResponseEntity.noContent().build();
    }



}
