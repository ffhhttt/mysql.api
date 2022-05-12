package com.example.demo.controller;


import com.example.demo.entity.Base;
import com.example.demo.entity.Container;
import com.example.demo.service.ContainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/container")
public class ContainerHandler {

    @Autowired
    private ContainerRepository containerRepository;

    @GetMapping("/findAll")
    public List<Container> findAll(){
        return containerRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Container> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return containerRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Container container){
        Integer maxId = containerRepository.getMaxID();
        containerRepository.rewriteSave(maxId,container.getName(),container.getPlace());
        Optional<Container> result = containerRepository.findById(maxId);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Container findById(@PathVariable("id") Integer id){
        return containerRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Container container){
        Container result = containerRepository.save(container);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        containerRepository.deleteById(id);
    }

    @GetMapping("/findByNameLike/{name}")
    @ResponseBody
    public List<Container> findByNameLike(@PathVariable("name") String name ){
        return containerRepository.findByNameLike(name);
    }

    @GetMapping("/findByPlaceLike/{place}")
    @ResponseBody
    public List<Container> findByPlaceLike(@PathVariable("place") String place ){
        return containerRepository.findByPlaceLike(place);
    }

    @GetMapping("/findByName/{name}")
    @ResponseBody
    public List<Container> findByName(@PathVariable("name") String name ){

        return containerRepository.findByName(name);
    }

    @GetMapping("/findByPlace/{place}")
    @ResponseBody
    public List<Container> findByPlace(@PathVariable("place") String place ){

        return containerRepository.findByPlace(place);
    }
}
