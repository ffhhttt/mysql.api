package com.example.demo.service;

import com.example.demo.entity.Experimentlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

public interface ExperimentlogRepository extends JpaRepository<Experimentlog,Integer> {

    List<Experimentlog> findByExperimentsId(Integer experimentsId);
    List<Experimentlog> findByUsersId(Integer usersId);

    @Query(value = "select max(id) + 1 from experimentlog;", nativeQuery = true)
    Integer getMaxID();

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO `experimentlog` VALUES (?1, ?2, ?3, ?4, ?5, ?6);", nativeQuery = true)
    void rewriteSave(Integer maxId, Integer experimentsId, Timestamp starttime,Timestamp endtime,Integer usersId,String standby);
}
