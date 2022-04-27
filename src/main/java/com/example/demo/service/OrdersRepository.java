package com.example.demo.service;

import com.example.demo.entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrdersRepository extends JpaRepository<Orders,Integer> {

    List<Orders> findByExperimentsId(Integer experimentsId);

}
