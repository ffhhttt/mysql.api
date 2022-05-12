package com.example.demo.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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
//        Experimentstep experimentstep= new Experimentstep();
//
//        experimentstep.setExperimentsId(3);
//        experimentstep.setStep(10);
//        experimentstep.setReceiver(6);
//        experimentstep.setTask(2);

        Integer id = experimentstepRepository.getMaxID();

//        experimentstepRepository.rewriteSave(experimentstepRepository.getMaxID(),experimentstep.getExperimentsId(),experimentstep.getStep(),
//                experimentstep.getStarttime(),experimentstep.getReceiver(),experimentstep.getTask(),experimentstep.getBaseId(),
//                experimentstep.getContainerId(),experimentstep.getChemicalsId(),experimentstep.getX(),experimentstep.getY(),experimentstep.getZ(),
//                experimentstep.getUsages(),experimentstep.getAddSpeed(),experimentstep.getStartPos(),experimentstep.getEndPos(),
//                experimentstep.getTubesMove(),experimentstep.getTubesPlatform(),experimentstep.getTubesReaction(),experimentstep.getDurationMin(),
//                experimentstep.getTemperature(),experimentstep.getReactSpeed(),experimentstep.getPressure(),experimentstep.getLight(),
//                experimentstep.getBackupReact(),experimentstep.getSingletaskStart(),experimentstep.getSingletaskEnd(),experimentstep.getSamplePos_1(),
//                experimentstep.getSamplePos_2(),experimentstep.getIntervals(),experimentstep.getSampleVolume(),experimentstep.getHplcCount(),
//                experimentstep.getHplcVolume(),experimentstep.getHplcInvolume(),experimentstep.getWavelength(),experimentstep.getProportion(),
//                experimentstep.getFlowrate(),experimentstep.getHplcTime());
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