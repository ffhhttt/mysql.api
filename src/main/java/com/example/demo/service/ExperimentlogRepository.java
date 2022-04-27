package com.example.demo.service;

import com.example.demo.entity.Experimentlog;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExperimentlogRepository extends JpaRepository<Experimentlog,Integer> {

    List<Experimentlog> findByExperimentsId(Integer experimentsId);
    List<Experimentlog> findByUsersId(Integer usersId);

}
