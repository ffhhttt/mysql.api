package com.example.demo.service;

import com.example.demo.entity.Experiments;
import com.example.demo.entity.Experimentstep;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Timestamp;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ExperimentstepRepositoryTest {

    @Autowired
    private ExperimentstepRepository experimentstepRepository;

    @Autowired
    private ExperimentsRepository experimentsRepository;

   /* @Test
    void test(){
        Experimentstep experimentstep= new Experimentstep();
        experimentstep.setId(10);
        experimentstep.setStep(1);
        experimentstep.setUsages("20mg");
        experimentstepRepository.setAllPara(experimentstep.getId(),experimentstep.getStep(),experimentstep.getUsages());
    }*/

    @Test
    void test2(){
        Experimentstep experimentstep= new Experimentstep();
        experimentstep.setExperimentsId(6);
        Experiments experiments = new Experiments();
        experiments.setId(experimentstep.getExperimentsId());
        Timestamp d = new Timestamp(System.currentTimeMillis());
        experiments.setUpdatetime(d);
        experiments.setExperimentname("s");
        experimentsRepository.save(experiments);

    }

   /* @Test
    void test3(){
        experimentstepRepository.updateStatus();
    }*/
    @Test
    void test3(){
        System.out.println(experimentstepRepository.findByExperimentsIdAndStepAndStarttime(1,2,10));
        System.out.println(experimentstepRepository.findAll());
    }
}