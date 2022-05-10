package com.example.demo.controller;


import com.example.demo.entity.Chemicals;
import com.example.demo.service.ChemicalsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/chemicals")
public class ChemicalsHandler {

    @Autowired
    private ChemicalsRepository chemicalsRepository;

    @GetMapping("/findAll")
    public List<Chemicals> findAll(){
        return chemicalsRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
    public Page<Chemicals> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return chemicalsRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Chemicals chemicals){
        chemicals.setId(chemicalsRepository.getMaxID() + 1);
        Chemicals result = chemicalsRepository.save(chemicals);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Chemicals findById(@PathVariable("id") Integer id){
        return chemicalsRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Chemicals chemicals){
        Chemicals result = chemicalsRepository.save(chemicals);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        chemicalsRepository.deleteById(id);
    }

    @GetMapping("/findByNameLike/{name}")
    @ResponseBody
    public List<Chemicals> findByNameLike(@PathVariable("name") String name ){
        return chemicalsRepository.findByNameLike(name);
    }

    @GetMapping("/findByPlaceLike/{place}")
    @ResponseBody
    public List<Chemicals> findByPlaceLike(@PathVariable("place") String place ){
        return chemicalsRepository.findByPlaceLike(place);
    }

    @GetMapping("/findByName/{name}")
    @ResponseBody
    public List<Chemicals> findByName(@PathVariable("name") String name ){

        return chemicalsRepository.findByName(name);
    }

    @GetMapping("/findByPlace/{place}")
    @ResponseBody
    public List<Chemicals> findByPlace(@PathVariable("place") String place ){

        return chemicalsRepository.findByPlace(place);
    }


}
