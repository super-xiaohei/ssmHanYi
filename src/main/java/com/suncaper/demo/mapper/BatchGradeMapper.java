package com.suncaper.demo.mapper;

import com.suncaper.demo.entity.BatchGrade;
import com.suncaper.demo.entity.BatchGradeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BatchGradeMapper {
    long countByExample(BatchGradeExample example);

    int deleteByExample(BatchGradeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(BatchGrade record);

    int insertSelective(BatchGrade record);

    List<BatchGrade> selectByExample(BatchGradeExample example);

    BatchGrade selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") BatchGrade record, @Param("example") BatchGradeExample example);

    int updateByExample(@Param("record") BatchGrade record, @Param("example") BatchGradeExample example);

    int updateByPrimaryKeySelective(BatchGrade record);

    int updateByPrimaryKey(BatchGrade record);
}