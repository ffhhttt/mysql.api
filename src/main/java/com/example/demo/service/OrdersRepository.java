package com.example.demo.service;

import com.example.demo.entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrdersRepository extends JpaRepository<Orders,Integer> {

    List<Orders> findByExperimentsId(Integer experimentsId);

    @Query(value = "select max(id) from orders;", nativeQuery = true)
    Integer getMaxID();
}
