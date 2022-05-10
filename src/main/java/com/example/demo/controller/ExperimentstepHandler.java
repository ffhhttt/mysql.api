package com.example.demo.controller;



import com.example.demo.entity.Experimentstep;

import com.example.demo.service.ExperimentstepRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@RequestMapping("/experimentstep")
public class ExperimentstepHandler {

    @Autowired
    private ExperimentstepRepository experimentstepRepository;



    @GetMapping("/findAll")
    public List<Experimentstep> findAll(){
        return experimentstepRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Experimentstep> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return experimentstepRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Experimentstep experimentstep){
        experimentstep.setId(experimentstepRepository.getMaxID() + 1);
        Experimentstep result = experimentstepRepository.save(experimentstep);

        if(result != null){
            return "success";
        }else{
            return "error";
        }

    }

    @GetMapping("/findById/{id}")
    public Experimentstep findById(@PathVariable("id") Integer id){
        return experimentstepRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Experimentstep experimentstep){

        Experimentstep result = experimentstepRepository.save(experimentstep);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        experimentstepRepository.deleteById(id);
    }

    @GetMapping("/findByExperimentsId/{experimentsId}")
    @ResponseBody
    public List<Experimentstep> findByExperimentsId(@PathVariable("experimentsId") Integer experimentsId ){
        return experimentstepRepository.findByExperimentsId(experimentsId);
    }

    @GetMapping("/findByStep/{step}")
    @ResponseBody
    public List<Experimentstep> findByStep(@PathVariable("step") Integer step ){
        return experimentstepRepository.findByStep(step);
    }

    @GetMapping("/findByTask/{task}")
    @ResponseBody
    public List<Experimentstep> findByTask(@PathVariable("task") Integer task ){
        return experimentstepRepository.findByTask(task);
    }

    @GetMapping("/findByReceiver/{receiver}")
    @ResponseBody
    public List<Experimentstep> findByReceiver(@PathVariable("receiver") Integer receiver ){
        return experimentstepRepository.findByReceiver(receiver);
    }

    @GetMapping("/findByContainerId/{containerId}")
    @ResponseBody
    public List<Experimentstep> findByContainerId(@PathVariable("containerId") Integer containerId ){
        return experimentstepRepository.findByContainerId(containerId);
    }

    @GetMapping("/findByChemicalsId/{chemicalsId}")
    @ResponseBody
    public List<Experimentstep> findByChemicalsId(@PathVariable("chemicalsId") Integer chemicalsId ){
        return experimentstepRepository.findByChemicalsId(chemicalsId);
    }

    @GetMapping("/findByBaseId/{baseId}")
    @ResponseBody
    public List<Experimentstep> findByBaseId(@PathVariable("baseId") Integer baseId ){
        return experimentstepRepository.findByBaseId(baseId);
    }

    @GetMapping("/findByExperimentsIdAndStep/{experimentsId}/{step}")
    @ResponseBody
    public List<Experimentstep> findByExperimentsIdAndStep(@PathVariable("experimentsId") Integer experimentsId ,@PathVariable("step") Integer step){
        return experimentstepRepository.findByExperimentsIdAndStep(experimentsId,step);
    }

    @GetMapping("/findByExperimentsIdAndStepAndStarttime/{experimentsId}/{step}/{starttime}")
    @ResponseBody
    public List<Experimentstep> findByExperimentsIdAndStepAndStarttime(@PathVariable("experimentsId") Integer experimentsId ,@PathVariable("step") Integer step,@PathVariable("starttime") Integer starttime){
        return experimentstepRepository.findByExperimentsIdAndStepAndStarttime(experimentsId,step, starttime);
    }

    @GetMapping("/findByExperimentsIdAndReceiver/{experimentsId}/{receiver}")
    @ResponseBody
    public List<Experimentstep> findByExperimentsIdAndReceiver(@PathVariable("experimentsId") Integer experimentsId ,@PathVariable("receiver") Integer receiver){
        return experimentstepRepository.findByExperimentsIdAndReceiver(experimentsId,receiver);
    }

    @GetMapping("/findByExperimentsIdAndReceiverAndTask/{experimentsId}/{receiver}/{task}")
    @ResponseBody
    public List<Experimentstep> findByExperimentsIdAndReceiverAndTask(@PathVariable("experimentsId") Integer experimentsId ,@PathVariable("receiver") Integer receiver,@PathVariable("task") Integer task){
        return experimentstepRepository.findByExperimentsIdAndReceiverAndTask(experimentsId,receiver, task);
    }
}
