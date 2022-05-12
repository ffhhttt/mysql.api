package com.example.demo.controller;


import com.example.demo.entity.Users;
import com.example.demo.service.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/users")
public class UsersHandler {

    @Autowired
    private UsersRepository usersRepository;

    @GetMapping("/findAll")
    public List<Users> findAll(){
        return usersRepository.findAll();
    }

    @GetMapping("/find/{page}/{size}")
        public Page<Users> findAll(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page-1,size);
        return usersRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Users users){
        Integer maxId = usersRepository.getMaxID();
        usersRepository.rewriteSave(maxId,users.getUserName(),users.getPwd(),users.getRealName(),users.getSchoolId());
        Optional<Users> result = usersRepository.findById(maxId);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Users findById(@PathVariable("id") Integer id){
        return usersRepository.findById(id).get();
    }

    @PutMapping("/update")
    public String update(@RequestBody Users users){
        Users result = usersRepository.save(users);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    public void delById(@PathVariable("id") Integer id){
        usersRepository.deleteById(id);
    }

    @GetMapping("/findByUserNameLike/{userName}")
    @ResponseBody
    public List<Users> findByUserNameLike(@PathVariable("userName") String userName ){
        return usersRepository.findByUsernameLike(userName);
    }

    @GetMapping("/findByRealNameLike/{realName}")
    @ResponseBody
    public List<Users> findByRealNameLike(@PathVariable("realName") String realName ){
        return usersRepository.findByRealnameLike(realName);
    }

    @GetMapping("/findBySchoolIdLike/{schoolId}")
    @ResponseBody
    public List<Users> findBySchoolIdLike(@PathVariable("schoolId") String schoolId ){
        return usersRepository.findBySchoolidLike(schoolId);
    }

    @GetMapping("/findByUserName/{userName}")
    @ResponseBody
    public List<Users> findByUserName(@PathVariable("userName") String userName ){

        return usersRepository.findByUsername(userName);
    }

    @GetMapping("/findByRealName/{realName}")
    @ResponseBody
    public List<Users> findByRealName(@PathVariable("realName") String realName ){

        return usersRepository.findByRealname(realName);
    }

    @GetMapping("/findBySchoolId/{schoolId}")
    @ResponseBody
    public List<Users> findBySchoolId(@PathVariable("schoolId") String schoolId ){

        return usersRepository.findBySchoolid(schoolId);
    }
}
