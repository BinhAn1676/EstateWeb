package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.custom.UserRepositoryCustom;
import com.laptrinhjavaweb.repository.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long>, UserRepositoryCustom {
    UserEntity findOneByUserNameAndStatus(String name, int status);
    Page<UserEntity> findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status,
                                                                                                  Pageable pageable);
    Page<UserEntity> findByStatusNot(int status, Pageable pageable);
    long countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status);
    long countByStatusNot(int status);
    UserEntity findOneByUserName(String userName);

    List<UserEntity> findByStatusAndRoles_Code(Integer status, String roleCode);
    List<UserEntity> findByBuildings_Id(Long id);
    List<UserEntity> findByIdIn(List<Long> ids);
}
