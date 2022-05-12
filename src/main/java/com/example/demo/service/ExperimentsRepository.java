package com.example.demo.service;

import com.example.demo.entity.Experiments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

public interface ExperimentsRepository extends JpaRepository<Experiments,Integer> {

    List<Experiments> findByExperimentname(String experimentname);
    List<Experiments> findByUsersId(Integer usersId);


    @Query(value = "select * from experiments where experimentName like %?1%", nativeQuery = true)
    List<Experiments> findByExperimentnameLike(String experimentname);

    @Query(value = "select max(id) + 1 from experiments;", nativeQuery = true)
    Integer getMaxID();

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO `experiments` VALUES (?1, ?2, ?3, ?4, ?5, ?6);", nativeQuery = true)
    void rewriteSave(Integer maxId, String experimentname, Timestamp createtime,Timestamp updatetime,Integer usersId,String description);
}
