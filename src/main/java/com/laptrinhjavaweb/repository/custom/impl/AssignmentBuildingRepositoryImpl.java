package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.repository.custom.AssignmentBuildingRepositoryCustom;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class AssignmentBuildingRepositoryImpl implements AssignmentBuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void assignBuilding(Long buildingId, Long[] staffs) {
        try{
            //xoa nhan vien cu
            String sqlDelete = "delete from assignmentbuilding where buildingid = "+buildingId+";";
            int row = entityManager.createNativeQuery(sqlDelete).executeUpdate();
            //them nhan vien sau khi chon
            String sql=null;
            for(Long staffId : staffs){
                sql="insert into assignmentbuilding(staffid,buildingid) values ("+staffId+","+buildingId+");";
                entityManager.createNativeQuery(sql).executeUpdate();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
