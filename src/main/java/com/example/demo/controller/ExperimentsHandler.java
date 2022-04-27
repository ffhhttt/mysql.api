package com.example.demo.controller;


import com.example.demo.entity.Experiments;
import com.example.demo.service.ExperimentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/experiments")
public class ExperimentsHandler {

    @Autowired
    private ExperimentsRepository experimentsRepository;

    @GetMapping("/findAll")
    public List<Experiments> findAll(){
        return experimentsRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Experiments> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return experimentsRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Experiments experiments){
        Experiments result = experimentsRepository.save(experiments);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Experiments findById(@PathVariable("id") Integer id){
        return experimentsRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Experiments experiments){
        Experiments result = experimentsRepository.save(experiments);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        experimentsRepository.deleteById(id);
    }

    @GetMapping("/findByExperimentnameLike/{experimentname}")
    @ResponseBody
    public List<Experiments> findByExperimentnameLike(@PathVariable("experimentname") String experimentname ){
        return experimentsRepository.findByExperimentnameLike(experimentname);
    }


    @GetMapping("/findByExperimentname/{experimentname}")
    @ResponseBody
    public List<Experiments> findByExperimentname(@PathVariable("experimentname") String experimentname ){

        return experimentsRepository.findByExperimentname(experimentname);
    }

    @GetMapping("/findByUsersId/{usersId}")
    @ResponseBody
    public List<Experiments> findByUsersId(@PathVariable("usersId") Integer usersId){

        return experimentsRepository.findByUsersId(usersId);
    }
}
