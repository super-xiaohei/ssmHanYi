package com.suncaper.demo.mapper.extend;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/16 - 18:40
 */
public interface BatchMapperExtend {

    void deletes(@Param("ids") List<Long> ids);
}
