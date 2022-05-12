package com.example.demo.service;

import com.example.demo.entity.Experiments;
import com.example.demo.entity.Experimentstep;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.PersistenceContext;
import java.util.List;

public interface ExperimentstepRepository extends JpaRepository<Experimentstep,Integer>{

    List<Experimentstep> findByExperimentsId(Integer experimentsId);
    List<Experimentstep> findByStep(Integer step);
    List<Experimentstep> findByReceiver(Integer receiver);
    List<Experimentstep> findByTask(Integer task);
    List<Experimentstep> findByContainerId(Integer containerId);
    List<Experimentstep> findByChemicalsId(Integer chemicalsId);
    List<Experimentstep> findByBaseId(Integer baseId);

    List<Experimentstep> findByExperimentsIdAndStep(Integer experimentsId,Integer step);
    List<Experimentstep> findByExperimentsIdAndStepAndStarttime(Integer experimentsId,Integer step,Integer starttime);
    List<Experimentstep> findByExperimentsIdAndReceiver(Integer experimentsId,Integer receiver);
    List<Experimentstep> findByExperimentsIdAndReceiverAndTask(Integer experimentsId,Integer receiver,Integer task);

    @Query(value = "select max(id) + 1 from experimentstep;", nativeQuery = true)
    Integer getMaxID();

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO `experimentstep` VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14, ?15, ?16, ?17, ?18, ?19, ?20, ?21, ?22, ?23, ?24, ?25, ?26, ?27, ?28, ?29, ?30, ?31, ?32, ?33, ?34, ?35, ?36, ?37, ?38);", nativeQuery = true)
    void rewriteSave(Integer maxId,Integer experiments_id,Integer step,Integer startTime,Integer receiver,Integer task,Integer base_id,
                     Integer container_id,Integer chemicals_id,Integer x,Integer y,Integer z,Integer usages,Integer add_speed,Integer start_pos,
                     Integer end_pos,Integer tubes_move,Integer tubes_platform,Integer tubes_reaction,Integer duration_min,Integer temperature,
                     Integer react_speed,Integer pressure,Integer light,Integer backup_react,Integer singleTask_start,Integer singleTask_end,
                     Integer sample_pos_1,Integer sample_pos_2,Integer intervals,Integer sample_volume,Integer hplc_count,String hplc_volume,
                     String hplc_involume,String wavelength,String proportion,String flowrate,String hplc_time);
}
