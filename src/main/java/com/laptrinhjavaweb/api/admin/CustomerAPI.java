package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.AssignCustomerRequest;
import com.laptrinhjavaweb.dto.request.AssignStaffRequest;
import com.laptrinhjavaweb.dto.request.DeleteCustomerRequest;
import com.laptrinhjavaweb.dto.response.ResponseDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value="customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private IUserService userService;

    @GetMapping("/staffs")
    public ResponseDTO loadStaffForCustomer(@RequestParam(value = "customer_id",required = false) Long customerId){
        ResponseDTO result = new ResponseDTO();
        if(customerId!=null){
            List<StaffResponseDTO> staffs = customerService.loadStaffForCustomer(customerId);
            result.setMessage("success");
            result.setData(staffs);
        }else{
            //load staff
        }
        return result;
    }
    @PostMapping("/staffs/assignment")
    public void assignStaff(@RequestBody AssignCustomerRequest assignStaff){
        userService.assignCustomer(assignStaff);
    }


    @PostMapping
    public CustomerDTO createCustomer(@RequestBody CustomerDTO customerDTO){
        customerService.save(customerDTO);
        return customerDTO;
    }
    @PutMapping("/{customerid}")
    public CustomerDTO updateCustomer(@RequestBody CustomerDTO customerDTO,@PathVariable("customerid") Long customerId){
        customerService.save(customerDTO);
        return customerDTO;
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteCustomer(@RequestBody DeleteCustomerRequest deleteCustomerRequest){
        if(deleteCustomerRequest.getCustomerIds().size()!=0){
            customerService.delete(deleteCustomerRequest);
        }
        return ResponseEntity.noContent().build();
    }


}
