package com.example.demo.service;

import com.example.demo.entity.Base;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

public interface BaseRepository extends JpaRepository<Base,Integer> {

    List<Base> findByName(String name);
    List<Base> findByPlace(String place);

    @Query(value = "select * from base where name like %?1%", nativeQuery = true)
    List<Base> findByNameLike(String name);

    @Query(value = "select * from base where place like %?1%", nativeQuery = true)
    List<Base> findByPlaceLike(String place);

    @Query(value = "select max(id) + 1 from base;", nativeQuery = true)
    Integer getMaxID();

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO `base` VALUES (?1, ?2, ?3);", nativeQuery = true)
    void rewriteSave(Integer maxId,String name,String place);
}
