package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.TransactionConverter;
import com.laptrinhjavaweb.dto.request.TransactionRequest;
import com.laptrinhjavaweb.dto.response.TransactionDTO;
import com.laptrinhjavaweb.enums.TransactionEnum;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.TransactionRepository;
import com.laptrinhjavaweb.repository.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.entity.TransactionEntity;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TransactionService implements ITransactionService {
    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private TransactionConverter transactionConverter;

    @Override
    public List<TransactionDTO> getTransactionsByTypeAndId(String transactionValue,Long customerId) {
        List<TransactionEntity> transactionEntities = transactionRepository.findByCodeAndCustomer_Id(transactionValue,customerId);
        List<TransactionDTO> transactionDTOS = new ArrayList<>();
        for (TransactionEntity item :transactionEntities) {
            TransactionDTO transactionDTO = transactionConverter.convertToDTO(item);
            transactionDTOS.add(transactionDTO);
        }
        return transactionDTOS;
    }

    @Override
    @Transactional
    public void save(TransactionRequest transactionData, Long customerId) {
        TransactionEntity transactionEntity = new TransactionEntity();
        transactionEntity.setCustomer(customerRepository.findById(customerId).get());
        transactionEntity.setStaffId(SecurityUtils.getPrincipal().getId());
        transactionEntity.setNote(transactionData.getNote());
        TransactionEnum transactionEnum = TransactionEnum.getTypeCode(transactionData.getType());
        transactionEntity.setCode(transactionEnum.name());
        transactionRepository.save(transactionEntity);
    }
}
