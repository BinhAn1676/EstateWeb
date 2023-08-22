package com.laptrinhjavaweb.dto.request;

import java.util.List;

public class DeleteBuildingRequest {
    private List<Long> buildingIds;

    public List<Long> getBuildingIds() {
        return buildingIds;
    }

    public void setBuildingIds(List<Long> buildingIds) {
        this.buildingIds = buildingIds;
    }
}
