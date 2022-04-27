package com.example.demo.controller;


import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrdersHandler {

    @Autowired
    private OrdersRepository ordersRepository;

    @GetMapping("/findAll")
    public List<Orders> findAll(){
        return ordersRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Orders> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return ordersRepository.findAll(request);
    }



    @GetMapping("/findById/{id}")
    public Orders findById(@PathVariable("id") Integer id){
        return ordersRepository.findById(id).get();
    }



    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        ordersRepository.deleteById(id);
    }



    @GetMapping("/findByExperimentsId/{experimentsId}")
    @ResponseBody
    public List<Orders> findByExperimentsId(@PathVariable("experimentsId") Integer experimentsId ){

        return ordersRepository.findByExperimentsId(experimentsId);
    }

}
