package com.example.demo.entity;



import com.alibaba.fastjson.JSONObject;
import com.vladmihalcea.hibernate.type.json.JsonStringType;
import lombok.Data;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.*;

@Entity
@Data
@TypeDef(name="json",typeClass = JsonStringType.class)
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer experimentsId;

    @Type(type = "json")
    @Column(columnDefinition = "json")
    private JSONObject allparameters;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getExperimentsId() {
        return experimentsId;
    }

    public void setExperimentsId(Integer experimentsId) {
        this.experimentsId = experimentsId;
    }

    public JSONObject getAllparameters() {
        return allparameters;
    }

    public void setAllparameters(JSONObject allparameters) {
        this.allparameters = allparameters;
    }

}