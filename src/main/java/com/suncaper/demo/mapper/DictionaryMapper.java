package com.suncaper.demo.mapper;

import com.suncaper.demo.entity.Dictionary;
import com.suncaper.demo.entity.DictionaryExample;
import java.util.List;

import com.suncaper.demo.mapper.extend.DictionaryMapperExtend;
import org.apache.ibatis.annotations.Param;

public interface DictionaryMapper extends DictionaryMapperExtend {
    long countByExample(DictionaryExample example);

    int deleteByExample(DictionaryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    List<Dictionary> selectByExample(DictionaryExample example);

    Dictionary selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Dictionary record, @Param("example") DictionaryExample example);

    int updateByExample(@Param("record") Dictionary record, @Param("example") DictionaryExample example);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);
}