package com.suncaper.demo.common;

/**
 * @author zyq
 * @date 2020/11/16 - 19:51
 */
public interface Constant {
    //数据库为1的标志
    Integer FLAG_TRUE = 1;

    //批次激活标志
    Integer AVTIVE_FLAG_TRUE = 1;
    //批次结束标志
    Integer AVTIVE_FLAG_FALSE = 0;

    //逻辑删除：未删除标记 0
    Integer IS_DELETE_0 = 0;


    //困难等级类型标识
    String DIFFICULTY_TYPE = "DIFFICULTY";
}
