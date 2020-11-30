package com.suncaper.demo.mapper;

import com.suncaper.demo.entity.Image;
import com.suncaper.demo.entity.ImageExample;
import java.util.List;

import com.suncaper.demo.mapper.extend.ImageMapperExtend;
import org.apache.ibatis.annotations.Param;

public interface ImageMapper extends ImageMapperExtend {
    long countByExample(ImageExample example);

    int deleteByExample(ImageExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Image record);

    int insertSelective(Image record);

    List<Image> selectByExample(ImageExample example);

    Image selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Image record, @Param("example") ImageExample example);

    int updateByExample(@Param("record") Image record, @Param("example") ImageExample example);

    int updateByPrimaryKeySelective(Image record);

    int updateByPrimaryKey(Image record);
}