package com.laptrinhjavaweb.exception;

public class BuildingNotFoundException extends RuntimeException{
    public BuildingNotFoundException(String errorMessage){
        super(errorMessage);
    }
}
