package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.dto.request.CustomerRequest;
import com.laptrinhjavaweb.repository.custom.CustomerRepositoryCustom;
import com.laptrinhjavaweb.repository.entity.CustomerEntity;
import com.laptrinhjavaweb.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<CustomerEntity> findCustomer(CustomerRequest customerRequest, Pageable pageable) {
        String sql = createQuery(customerRequest, pageable);
        Query query = entityManager.createNativeQuery(sql, CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItem(CustomerRequest customerRequest) {
        String sql = createCountQuery(customerRequest);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }

    private String createCountQuery(CustomerRequest customerRequest) {
        StringBuilder finalQuery = new StringBuilder("select count(distinct customer.id) from customer \n");
        StringBuilder whereQuery = new StringBuilder();
        StringBuilder joinQuery = new StringBuilder();
        buildQuery(customerRequest, whereQuery, joinQuery);
        finalQuery.append(joinQuery).append(SystemConstant.ONE_EQUAL_ONE).append(whereQuery)
                .append(" group by customer.id")
        ;
        return finalQuery.toString();
    }

    private String createQuery(CustomerRequest customerRequest, Pageable pageable) {
        StringBuilder finalQuery = new StringBuilder("select * from customer \n");
        StringBuilder whereQuery = new StringBuilder();
        StringBuilder joinQuery = new StringBuilder();
        buildQuery(customerRequest, whereQuery, joinQuery);
        finalQuery.append(joinQuery).append(SystemConstant.ONE_EQUAL_ONE).append(whereQuery)
                .append(" group by customer.id").append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        ;
        return finalQuery.toString();

    }

    private void buildQuery(CustomerRequest customerRequest, StringBuilder whereQuery, StringBuilder joinQuery) {
        try {
            Field[] fields = CustomerRequest.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = field.getName();
                Object objectValue = field.get(customerRequest);
                if (!fieldName.equals("staffId")) {
                    if (!StringUtils.isNullOrEmpty(objectValue)) {
                        if (field.getType().getName().equals("java.lang.String")) {
                            whereQuery.append(" and customer." + fieldName.toLowerCase() + " like '%" + objectValue + "%' ");
                        } else if (field.getType().getName().equals("java.lang.Integer") ||
                                field.getType().getName().equals("java.lang.Long")) {
                            whereQuery.append(" and customer." + fieldName.toLowerCase() + " = " + objectValue + "");
                        }
                    }
                }
                if (fieldName.equals("staffId")) {
                    if (!StringUtils.isNullOrEmpty(objectValue) && Integer.parseInt(objectValue.toString()) != -1) {
                        joinQuery.append(
                                "\n" + "inner join assignmentcustomer on customer.id = assignmentcustomer.customerid\n" + "\n");
                        whereQuery.append(" and assignmentcustomer.staffid = " + objectValue + " ");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
