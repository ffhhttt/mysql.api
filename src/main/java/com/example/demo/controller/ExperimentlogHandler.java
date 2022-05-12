package com.example.demo.controller;


import com.example.demo.entity.Base;
import com.example.demo.entity.Experimentlog;
import com.example.demo.service.ExperimentlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/experimentlog")
public class ExperimentlogHandler {

    @Autowired
    private ExperimentlogRepository experimentlogRepository;

    @GetMapping("/findAll")
    public List<Experimentlog> findAll(){
        return experimentlogRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Experimentlog> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return experimentlogRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Experimentlog experimentlog){
        Integer maxId = experimentlogRepository.getMaxID();
        experimentlogRepository.rewriteSave(maxId,experimentlog.getExperimentsId(),experimentlog.getStarttime(),experimentlog.getEndtime(),experimentlog.getUsersId(),experimentlog.getStandby());
        Optional<Experimentlog> result = experimentlogRepository.findById(maxId);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Experimentlog findById(@PathVariable("id") Integer id){
        return experimentlogRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Experimentlog experimentlog){
        Experimentlog result = experimentlogRepository.save(experimentlog);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        experimentlogRepository.deleteById(id);
    }

    @GetMapping("/findByExperimentsId/{experimentsId}")
    @ResponseBody
    public List<Experimentlog> findByExperimentsId(@PathVariable("experimentsId") Integer experimentsId ){
        return experimentlogRepository.findByExperimentsId(experimentsId);
    }

    @GetMapping("/findByUsersId/{usersId}")
    @ResponseBody
    public List<Experimentlog> findByUsersId(@PathVariable("usersId") Integer usersId ){
        return experimentlogRepository.findByUsersId(usersId);
    }



}
