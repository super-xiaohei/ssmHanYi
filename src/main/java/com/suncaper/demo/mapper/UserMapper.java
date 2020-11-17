package com.suncaper.demo.mapper;

import com.suncaper.demo.entity.User;
import com.suncaper.demo.entity.UserExample;
import java.util.List;

import com.suncaper.demo.mapper.extend.UserMapperExtend;
import org.apache.ibatis.annotations.Param;

public interface UserMapper extends UserMapperExtend {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}