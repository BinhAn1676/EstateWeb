package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.response.TransactionDTO;
import com.laptrinhjavaweb.repository.entity.TransactionEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;

    public TransactionDTO convertToDTO(TransactionEntity transactionEntity){
        TransactionDTO transactionDTO = new TransactionDTO();
        transactionDTO.setNote(transactionEntity.getNote());
        transactionDTO.setCode(transactionEntity.getCode());
        transactionDTO.setCustomerId(transactionEntity.getCustomer().getId());
        transactionDTO.setId(transactionEntity.getId());
        transactionDTO.setStaffId(transactionEntity.getStaffId());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = dateFormat.format(transactionEntity.getCreatedDate());
        transactionDTO.setDate(date);
        return transactionDTO;
    }
}
