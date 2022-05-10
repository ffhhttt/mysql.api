package com.example.demo.service;

import com.example.demo.entity.Experimentlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExperimentlogRepository extends JpaRepository<Experimentlog,Integer> {

    List<Experimentlog> findByExperimentsId(Integer experimentsId);
    List<Experimentlog> findByUsersId(Integer usersId);

    @Query(value = "select max(id) from experimentlog;", nativeQuery = true)
    Integer getMaxID();
}
