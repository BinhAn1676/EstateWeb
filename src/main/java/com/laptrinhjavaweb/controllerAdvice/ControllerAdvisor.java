package com.laptrinhjavaweb.controllerAdvice;

import com.laptrinhjavaweb.exception.BuildingNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ControllerAdvisor {

    @ExceptionHandler(BuildingNotFoundException.class)
    public ResponseEntity<String> handleBuildingNotFoundException(BuildingNotFoundException ex){
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(ex.getMessage());
    }
}
