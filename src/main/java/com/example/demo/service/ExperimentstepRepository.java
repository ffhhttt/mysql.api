package com.example.demo.service;

import com.example.demo.entity.Experiments;
import com.example.demo.entity.Experimentstep;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExperimentstepRepository extends JpaRepository<Experimentstep,Integer>{

    List<Experimentstep> findByExperimentsId(Integer experimentsId);
    List<Experimentstep> findByStep(Integer step);
    List<Experimentstep> findByReceiver(Integer receiver);
    List<Experimentstep> findByTask(Integer task);
    List<Experimentstep> findByContainerId(Integer containerId);
    List<Experimentstep> findByChemicalsId(Integer chemicalsId);
    List<Experimentstep> findByBaseId(Integer baseId);

    List<Experimentstep> findByExperimentsIdAndStep(Integer experimentsId,Integer step);
    List<Experimentstep> findByExperimentsIdAndStepAndStarttime(Integer experimentsId,Integer step,Integer starttime);
    List<Experimentstep> findByExperimentsIdAndReceiver(Integer experimentsId,Integer receiver);
    List<Experimentstep> findByExperimentsIdAndReceiverAndTask(Integer experimentsId,Integer receiver,Integer task);

    @Query(value = "select max(id) from experimentstep;", nativeQuery = true)
    Integer getMaxID();
}
