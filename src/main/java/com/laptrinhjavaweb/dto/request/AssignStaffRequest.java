package com.laptrinhjavaweb.dto.request;

import java.util.List;

public class AssignStaffRequest {
    private Long buildingId;
    private Long[] staffs;

    public Long getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Long buildingId) {
        this.buildingId = buildingId;
    }

    /*public List<Long> getStaffs() {
        return staffs;
    }

    public void setStaffs(Long[] staffs) {
        this.staffs = staffs;
    }*/

    public Long[] getStaffs() {
        return staffs;
    }

    public void setStaffs(Long[] staffs) {
        this.staffs = staffs;
    }
}
