package com.laptrinhjavaweb.dto.request;

import com.laptrinhjavaweb.dto.AbstractDTO;

import java.util.List;

public class BuildingRequest extends AbstractDTO {
    private String name;
    //private String[] buildingTypes;
    private List<String> buildingTypes;
    private String street;
    private String ward;
    private Integer floorArea;
    private Integer numberOfBasement;
    private Long staffId;
    private String district;

    private String direction;
    private String rank;
    private String rentAreaFrom;
    private String rentAreaTo;
    private String managerName;
    private String managerPhone;
    private String rentFrom;
    private String rentTo;


    public List<String> getBuildingTypes() {
        return buildingTypes;
    }

    public void setBuildingTypes(List<String> buildingTypes) {
        this.buildingTypes = buildingTypes;
    }

    public String getRentFrom() {
        return rentFrom;
    }

    public void setRentFrom(String rentFrom) {
        this.rentFrom = rentFrom;
    }

    public String getRentTo() {
        return rentTo;
    }

    public void setRentTo(String rentTo) {
        this.rentTo = rentTo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(Integer numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    /*public String[] getBuildingTypes() {
        return buildingTypes;
    }

    public void setBuildingTypes(String[] buildingTypes) {
        this.buildingTypes = buildingTypes;
    }*/

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getRentAreaFrom() {
        return rentAreaFrom;
    }

    public void setRentAreaFrom(String rentAreaFrom) {
        this.rentAreaFrom = rentAreaFrom;
    }

    public String getRentAreaTo() {
        return rentAreaTo;
    }

    public void setRentAreaTo(String rentAreaTo) {
        this.rentAreaTo = rentAreaTo;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }
}
