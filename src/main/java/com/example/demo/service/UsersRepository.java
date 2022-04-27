package com.example.demo.service;

import com.example.demo.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UsersRepository extends JpaRepository<Users,Integer> {

    List<Users> findByUsername(String userName);
    List<Users> findByRealname(String realName);
    List<Users> findBySchoolid(String schoolId);

    @Query(value = "select * from users where userName like %?1%", nativeQuery = true)
    List<Users> findByUsernameLike(String userName);

    @Query(value = "select * from users where realName like %?1%", nativeQuery = true)
    List<Users> findByRealnameLike(String realName);

    @Query(value = "select * from users where schoolId like %?1%", nativeQuery = true)
    List<Users> findBySchoolidLike(String schoolId);
}
