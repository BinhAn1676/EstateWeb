package com.laptrinhjavaweb.dto.request;

import java.util.List;

public class DeleteCustomerRequest {
    private List<Long> customerIds;

    public List<Long> getCustomerIds() {
        return customerIds;
    }

    public void setCustomerIds(List<Long> customerIds) {
        this.customerIds = customerIds;
    }
}
