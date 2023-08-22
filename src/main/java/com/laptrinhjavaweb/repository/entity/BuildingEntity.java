package com.laptrinhjavaweb.repository.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "building")
public class BuildingEntity extends BaseEntity {
    @Column(name="name")
    private String name;

    @Column(name="numberofbasement")
    private Integer numberOfBasement;

    @Column(name = "ward")
    private String ward;

    @Column(name = "street")
    private String street;

    /*@ManyToMany(mappedBy = "buildings", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserEntity> users = new ArrayList<>();*/
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> staffs = new ArrayList<>();
    /*@OneToMany(mappedBy = "buildings",fetch = FetchType.LAZY)
    private List<AssignmentBuildingEntity> assignmentBuildingEntities = new ArrayList<>();*/

    @OneToMany(mappedBy = "building",fetch =FetchType.LAZY, cascade = CascadeType.ALL,orphanRemoval = true)
    private List<RentAreaEntity> rentAreas = new ArrayList<>();

    @Column(name = "structure")
    private String structure;

    @Column(name = "floorarea")
    private Integer floorArea;

    @Column(name = "district")
    private String district;

    @Column(name = "direction")
    private String direction;

    @Column(name = "managername")
    private String managerName;

    @Column(name = "managerphone")
    private String managerPhone;

    @Column(name = "level")
    private String level;

    @Column(name = "rentprice")
    private Integer rentPrice;

    @Column(name = "rentpricedescription")
    private String rentPriceDescription;

    @Column(name = "servicefee")
    private String serviceFee;

    @Column(name = "type")
    private String type;

    @Column(name = "carfee")
    private String carFee;

    @Column(name = "motofee")
    private String motoFee;

    @Column(name = "overtimefee")
    private String overtimeFee;

    @Column(name = "waterfee")
    private String waterFee;

    @Column(name = "electricityfee")
    private String electricityFee;

    @Column(name = "deposit")
    private String deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTIme;

    @Column(name = "brokeragefee")
    private BigDecimal brokeRageFee;

    @Column(name = "note")
    private String note;

    @Column(name = "linkofbuilding")
    private String linkOfBuilding;

    @Column(name = "map")
    private String map;

    @Column(name = "image")
    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    /*public List<AssignmentBuildingEntity> getAssignmentBuildingEntities() {
        return assignmentBuildingEntities;
    }

    public void setAssignmentBuildingEntities(List<AssignmentBuildingEntity> assignmentBuildingEntities) {
        this.assignmentBuildingEntities = assignmentBuildingEntities;
    }*/


    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getStreet() {
        return street;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public List<RentAreaEntity> getRentAreas() {
        return rentAreas;
    }

    public void setRentAreas(List<RentAreaEntity> rentAreas) {
        this.rentAreas = rentAreas;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Integer getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getRentPriceDescription() {
        return rentPriceDescription;
    }

    public void setRentPriceDescription(String rentPriceDescription) {
        this.rentPriceDescription = rentPriceDescription;
    }

    public String getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }

    public String getCarFee() {
        return carFee;
    }

    public void setCarFee(String carFee) {
        this.carFee = carFee;
    }

    public String getMotoFee() {
        return motoFee;
    }

    public void setMotoFee(String motoFee) {
        this.motoFee = motoFee;
    }

    public String getOvertimeFee() {
        return overtimeFee;
    }

    public void setOvertimeFee(String overtimeFee) {
        this.overtimeFee = overtimeFee;
    }

    public String getWaterFee() {
        return waterFee;
    }

    public void setWaterFee(String waterFee) {
        this.waterFee = waterFee;
    }

    public String getElectricityFee() {
        return electricityFee;
    }

    public void setElectricityFee(String electricityFee) {
        this.electricityFee = electricityFee;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getRentTime() {
        return rentTime;
    }

    public void setRentTime(String rentTime) {
        this.rentTime = rentTime;
    }

    public String getDecorationTIme() {
        return decorationTIme;
    }

    public void setDecorationTIme(String decorationTIme) {
        this.decorationTIme = decorationTIme;
    }

    public BigDecimal getBrokeRageFee() {
        return brokeRageFee;
    }

    public void setBrokeRageFee(BigDecimal brokeRageFee) {
        this.brokeRageFee = brokeRageFee;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getLinkOfBuilding() {
        return linkOfBuilding;
    }

    public void setLinkOfBuilding(String linkOfBuilding) {
        this.linkOfBuilding = linkOfBuilding;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    /*public List<UserEntity> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<UserEntity> staffs) {
        this.staffs = staffs;
    }*/

    public List<UserEntity> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<UserEntity> staffs) {
        this.staffs = staffs;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(Integer numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }
}
