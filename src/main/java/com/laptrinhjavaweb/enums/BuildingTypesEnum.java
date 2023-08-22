package com.laptrinhjavaweb.enums;

public enum BuildingTypesEnum {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");

    public final String typeValue;

    BuildingTypesEnum (String typeValue){
        this.typeValue = typeValue;
    }
    public String getTypeValue(){
        return typeValue;
    }
}
