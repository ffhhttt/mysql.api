package com.example.demo.controller;


import com.example.demo.entity.Base;
import com.example.demo.entity.Experimentstep;
import com.example.demo.service.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/base")
public class BaseHandler {

    @Autowired
    private BaseRepository baseRepository;

    @GetMapping("/findAll")
    public List<Base> findAll(){
        return baseRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Base> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return baseRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Base base){
        Integer maxId = baseRepository.getMaxID();
        baseRepository.rewriteSave(maxId,base.getName(),base.getPlace());
        Optional<Base> result = baseRepository.findById(maxId);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Base findById(@PathVariable("id") Integer id){
        return baseRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Base base){
        Base result = baseRepository.save(base);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        baseRepository.deleteById(id);
    }

    @GetMapping("/findByNameLike/{name}")
    @ResponseBody
    public List<Base> findByNameLike(@PathVariable("name") String name ){
        return baseRepository.findByNameLike(name);
    }

    @GetMapping("/findByPlaceLike/{place}")
    @ResponseBody
    public List<Base> findByPlaceLike(@PathVariable("place") String place ){
        return baseRepository.findByPlaceLike(place);
    }

    @GetMapping("/findByName/{name}")
    @ResponseBody
    public List<Base> findByName(@PathVariable("name") String name ){

        return baseRepository.findByName(name);
    }

    @GetMapping("/findByPlace/{place}")
    @ResponseBody
    public List<Base> findByPlace(@PathVariable("place") String place ){

        return baseRepository.findByPlace(place);
    }
}
