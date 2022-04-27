package com.example.demo.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String username;

    private String pwd;

    private String realname;

    private String schoolid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return username;
    }

    public void setUserName(String userName) {
        this.username = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return pwd;
    }

    public void setPassword(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getRealName() {
        return realname;
    }

    public void setRealName(String realName) {
        this.realname = realName == null ? null : realName.trim();
    }

    public String getSchoolId() {
        return schoolid;
    }

    public void setSchoolId(String schoolId) {
        this.schoolid = schoolId == null ? null : schoolId.trim();
    }
}