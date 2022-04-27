package com.example.demo.service;

import com.example.demo.entity.Experiments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExperimentsRepository extends JpaRepository<Experiments,Integer> {

    List<Experiments> findByExperimentname(String experimentname);
    List<Experiments> findByUsersId(Integer usersId);


    @Query(value = "select * from experiments where experimentName like %?1%", nativeQuery = true)
    List<Experiments> findByExperimentnameLike(String experimentname);

}
