package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.request.BuildingRequest;
import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.repository.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.entity.UserEntity;
import com.laptrinhjavaweb.utils.CastingUtils;
import com.laptrinhjavaweb.utils.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;



    @Override
    public List<BuildingEntity> getAllBuildings(Pageable pageable) {

        StringBuilder sql = new StringBuilder(buildQueryFilter())
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        System.out.println("Final query: " + sql.toString());

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItem(BuildingRequest buildingRequest) {
        String sql = createCountQuery(buildingRequest);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }

    private String createCountQuery(BuildingRequest buildingRequest) {
        StringBuilder finalQuery = new StringBuilder("select count(distinct building.id) from building \n");
        StringBuilder whereQuery = new StringBuilder();
        StringBuilder joinQuery = new StringBuilder();
        buildQueryUsingBuilder(buildingRequest, whereQuery, joinQuery);
        finalQuery.append(joinQuery).append(SystemConstant.ONE_EQUAL_ONE).append(whereQuery)
                .append(" group by building.id")
        ;
        return finalQuery.toString();
    }

    private String buildQueryFilter() {
        String sql = "SELECT * FROM building ";
        return sql;
    }


    @Override
    public List<BuildingEntity> findBuilding(BuildingRequest buildingRequest, Pageable pageable) {
        String sql = createQuery(buildingRequest, pageable);
        Query query = entityManager.createNativeQuery(sql, BuildingEntity.class);
        //temp = query.getResultList();
        return query.getResultList();
    }


    private String createQuery(BuildingRequest buildingRequest, Pageable pageable) {
        StringBuilder finalQuery = new StringBuilder("select * from building \n");
        StringBuilder whereQuery = new StringBuilder();
        StringBuilder joinQuery = new StringBuilder();
        buildQueryUsingBuilder(buildingRequest, whereQuery, joinQuery);
        finalQuery.append(joinQuery).append(SystemConstant.ONE_EQUAL_ONE).append(whereQuery)
                .append(" group by building.id").append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        ;
        return finalQuery.toString();
    }

    private void buildQueryUsingBuilder(BuildingRequest buildingRequest, StringBuilder whereQuery,
                                        StringBuilder joinQuery) {
        int temp = 0;
        //StringBuilder sql= new StringBuilder();
        try {
            Field[] fields = BuildingRequest.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = field.getName();
                Object objectValue = field.get(buildingRequest);
                if (!fieldName.equals("buildingTypes") && !fieldName.startsWith("rentArea")
                        //&& !fieldName.equals("district")
                        && !fieldName.equals("rentFrom")
                        && !fieldName.equals("rentTo")
                        && !fieldName.equals("staffId")) {
                    //Object objectValue = field.get(builder);
                    if (!StringUtils.isNullOrEmpty(objectValue)) {
                        if (field.getType().getName().equals("java.lang.String")) {
                            whereQuery.append(" and building." + fieldName.toLowerCase() + " like '%" + objectValue + "%' ");
                        } else if (field.getType().getName().equals("java.lang.Integer") ||
                                field.getType().getName().equals("java.lang.Long")) {
                            whereQuery.append(" and building." + fieldName.toLowerCase() + " = " + objectValue + "");
                        }
                    }
                }
                //bo sung
                if (fieldName.equals("rentFrom") || fieldName.equals("rentTo")) {
                    if (!StringUtils.isNullOrEmpty(objectValue)) {
                        if (fieldName.equals("costRentFrom")) {
                            whereQuery.append(" and building.rentprice >= '" + objectValue + "' ");
                        }
                        if (fieldName.equals("costRentTo")) {
                            whereQuery.append(" and building.rentprice <= '" + objectValue + "' ");
                        }
                    }
                }
                if (fieldName.startsWith("rentArea")) {
                    //Object objectValue = field.get(builder);
                    if (!StringUtils.isNullOrEmpty(objectValue)) {
                        whereQuery.append(" and EXISTS (SELECT * FROM rentarea WHERE rentarea.buildingid=building.id");
                        if (fieldName.equals("areaRentFrom")) {
                            whereQuery.append(" and rentarea.value >= " + objectValue + "");
                        }
                        if (fieldName.equals("areaRentTo")) {
                            whereQuery.append(" and rentarea.value <= " + objectValue + "");
                        }
                        whereQuery.append(" )");
                    }
                }


                if (fieldName.equals("buildingTypes")) {
                    if (field.getType().getName().equals("java.util.List")) {
                        if (objectValue != null) {
                            if (objectValue instanceof ArrayList) {
                                List<String> types = (List<String>) objectValue;
                                if (types.size() != 0) {
                                    whereQuery.append(" and (");
                                    String sqlJoin = types.stream().map(item -> " building.type like '%" + item + "%'").collect(Collectors.joining(" OR "));
                                    whereQuery.append(sqlJoin);
                                    whereQuery.append(") ");
                                }
                            }
                        }
                    }
                }
                if (fieldName.equals("staffId")) {
                    if (!StringUtils.isNullOrEmpty(objectValue) && Integer.parseInt(objectValue.toString()) != -1) {
                        joinQuery.append(
                                "\n" + "inner join assignmentbuilding on building.id = assignmentbuilding.buildingid\n" + "\n");
                        whereQuery.append(" and assignmentbuilding.staffid = " + objectValue + " ");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
