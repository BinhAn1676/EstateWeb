package com.laptrinhjavaweb.exception;

public class CustomerNotFoundException extends RuntimeException{
    public CustomerNotFoundException(String errorMessage){
        super(errorMessage);
    }
}
