package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.request.TransactionRequest;
import com.laptrinhjavaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController(value="transactionAPIOfAdmin")
@RequestMapping("/api/transaction")
public class TransactionAPI {

    @Autowired
    private ITransactionService transactionService;


    @PostMapping
    public ResponseEntity<Void>  addTransaction(@RequestBody TransactionRequest transactionData,
                                                @RequestParam(value = "customer_id",required = false)Long customerId){
        if(transactionData.getNote().equalsIgnoreCase("")){
            return ResponseEntity.noContent().build();
        }
        transactionService.save(transactionData,customerId);
        return ResponseEntity.noContent().build();
    }
}
