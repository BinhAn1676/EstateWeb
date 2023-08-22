package com.laptrinhjavaweb.dto.request;

public class TransactionRequest {
    private String type;
    private String note;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
