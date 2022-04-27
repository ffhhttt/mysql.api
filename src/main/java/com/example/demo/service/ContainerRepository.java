package com.example.demo.service;

import com.example.demo.entity.Container;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ContainerRepository extends JpaRepository<Container,Integer> {

    List<Container> findByName(String name);
    List<Container> findByPlace(String place);

    @Query(value = "select * from container where name like %?1%", nativeQuery = true)
    List<Container> findByNameLike(String name);
    @Query(value = "select * from container where place like %?1%", nativeQuery = true)
    List<Container> findByPlaceLike(String place);
}
