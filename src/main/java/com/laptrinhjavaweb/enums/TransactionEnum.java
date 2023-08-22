package com.laptrinhjavaweb.enums;

import java.util.Arrays;

public enum TransactionEnum {
    QUA_TRINH_CSKH("Quá trình chăm sóc khách hàng"),
    DAN_DI_XEM("Dẫn đi xem");

    public final String transactionValue;
    TransactionEnum(String transactionValue){
        this.transactionValue = transactionValue;
    }

    public String getTransactionValue() {
        return transactionValue;
    }

    public static TransactionEnum getTypeCode(String type) {
        return Arrays.stream(values())
                .filter(transaction -> transaction.getTransactionValue().equals(type))
                .findFirst()
                .orElse(null);
    }
}
