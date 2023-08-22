package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.request.TransactionRequest;
import com.laptrinhjavaweb.dto.response.TransactionDTO;

import java.util.List;
import java.util.Map;

public interface ITransactionService {
    List<TransactionDTO> getTransactionsByTypeAndId(String transactionValue,Long customerId);

    void save(TransactionRequest transactionData, Long customerId);
}
