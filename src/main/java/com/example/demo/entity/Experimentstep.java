package com.example.demo.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Experimentstep {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer experimentsId;

    private Integer step;

    private Integer starttime;

    private Integer receiver;

    private Integer task;

    private Integer baseId;

    private Integer containerId;

    private Integer chemicalsId;

    private Integer x;

    private Integer y;

    private Integer z;

    private Integer usages;

    private Integer addSpeed;

    private Integer startPos;

    private Integer endPos;

    private Integer tubesMove;

    private Integer tubesPlatform;

    private Integer tubesReaction;

    private Integer durationMin;

    private Integer temperature;

    private Integer reactSpeed;

    private Integer pressure;

    private Integer light;

    private Integer backupReact;

    private Integer singletaskStart;

    private Integer singletaskEnd;

    private Integer samplePos_1;

    private Integer samplePos_2;

    private Integer intervals;

    private Integer sampleVolume;

    private Integer hplcCount;

    private String hplcVolume;

    private String hplcInvolume;

    private String wavelength;

    private String proportion;

    private String flowrate;

    private String hplcTime;

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

    public Integer getStep() {
        return step;
    }

    public void setStep(Integer step) {
        this.step = step;
    }

    public Integer getStarttime() {
        return starttime;
    }

    public void setStarttime(Integer starttime) {
        this.starttime = starttime ;
    }

    public Integer getReceiver() {
        return receiver;
    }

    public void setReceiver(Integer receiver) {
        this.receiver = receiver;
    }

    public Integer getTask() {
        return task;
    }

    public void setTask(Integer task) {
        this.task = task;
    }

    public Integer getBaseId() {
        return baseId;
    }

    public void setBaseId(Integer baseId) {
        this.baseId = baseId;
    }

    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(Integer containerId) {
        this.containerId = containerId;
    }

    public Integer getChemicalsId() {
        return chemicalsId;
    }

    public void setChemicalsId(Integer chemicalsId) {
        this.chemicalsId = chemicalsId;
    }

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Integer getZ() {
        return z;
    }

    public void setZ(Integer z) {
        this.z = z;
    }

    public Integer getUsages() {
        return usages;
    }

    public void setUsages(Integer usages) {
        this.usages = usages ;
    }

    public Integer getAddSpeed() {
        return addSpeed;
    }

    public void setAddSpeed(Integer addSpeed) {
        this.addSpeed = addSpeed;
    }

    public Integer getStartPos() {
        return startPos;
    }

    public void setStartPos(Integer startPos) {
        this.startPos = startPos;
    }

    public Integer getEndPos() {
        return endPos;
    }

    public void setEndPos(Integer endPos) {
        this.endPos = endPos;
    }

    public Integer getTubesMove() {
        return tubesMove;
    }

    public void setTubesMove(Integer tubesMove) {
        this.tubesMove = tubesMove;
    }

    public Integer getTubesPlatform() {
        return tubesPlatform;
    }

    public void setTubesPlatform(Integer tubesPlatform) {
        this.tubesPlatform = tubesPlatform;
    }

    public Integer getTubesReaction() {
        return tubesReaction;
    }

    public void setTubesReaction(Integer tubesReaction) {
        this.tubesReaction = tubesReaction;
    }

    public Integer getDurationMin() {
        return durationMin;
    }

    public void setDurationMin(Integer durationMin) {
        this.durationMin = durationMin ;
    }

    public Integer getTemperature() {
        return temperature;
    }

    public void setTemperature(Integer temperature) {
        this.temperature = temperature;
    }

    public Integer getReactSpeed() {
        return reactSpeed;
    }

    public void setReactSpeed(Integer reactSpeed) {
        this.reactSpeed = reactSpeed;
    }

    public Integer getPressure() {
        return pressure;
    }

    public void setPressure(Integer pressure) {
        this.pressure = pressure;
    }

    public Integer getLight() {
        return light;
    }

    public void setLight(Integer light) {
        this.light = light;
    }

    public Integer getBackupReact() {
        return backupReact;
    }

    public void setBackupReact(Integer backupReact) {
        this.backupReact = backupReact;
    }

    public Integer getSingletaskStart() {
        return singletaskStart;
    }

    public void setSingletaskStart(Integer singletaskStart) {
        this.singletaskStart = singletaskStart;
    }

    public Integer getSingletaskEnd() {
        return singletaskEnd;
    }

    public void setSingletaskEnd(Integer singletaskEnd) {
        this.singletaskEnd = singletaskEnd;
    }

    public Integer getSamplePos_1() {
        return samplePos_1;
    }

    public void setSamplePos_1(Integer samplePos_1) {
        this.samplePos_1 = samplePos_1;
    }

    public Integer getSamplePos_2() {
        return samplePos_2;
    }

    public void setSamplePos_2(Integer samplePos_2) {
        this.samplePos_2 = samplePos_2;
    }

    public Integer getIntervals() {
        return intervals;
    }

    public void setIntervals(Integer intervals) {
        this.intervals = intervals ;
    }

    public Integer getSampleVolume() {
        return sampleVolume;
    }

    public void setSampleVolume(Integer sampleVolume) {
        this.sampleVolume = sampleVolume ;
    }

    public Integer getHplcCount() {
        return hplcCount;
    }

    public void setHplcCount(Integer hplcCount) {
        this.hplcCount = hplcCount;
    }

    public String getHplcVolume() {
        return hplcVolume;
    }

    public void setHplcVolume(String hplcVolume) {
        this.hplcVolume = hplcVolume == null ? null : hplcVolume.trim();
    }

    public String getHplcInvolume() {
        return hplcInvolume;
    }

    public void setHplcInvolume(String hplcInvolume) {
        this.hplcInvolume = hplcInvolume == null ? null : hplcInvolume.trim();
    }

    public String getWavelength() {
        return wavelength;
    }

    public void setWavelength(String wavelength) {
        this.wavelength = wavelength == null ? null : wavelength.trim();
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion == null ? null : proportion.trim();
    }

    public String getFlowrate() {
        return flowrate;
    }

    public void setFlowrate(String flowrate) {
        this.flowrate = flowrate == null ? null : flowrate.trim();
    }

    public String getHplcTime() {
        return hplcTime;
    }

    public void setHplcTime(String hplcTime) {
        this.hplcTime = hplcTime == null ? null : hplcTime.trim();
    }
}