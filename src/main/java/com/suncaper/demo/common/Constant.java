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

    //逻辑删除：删除标记 1
    Integer IS_DELETE_1 = 1;
    //困难等级类型标识
    String DIFFICULTY_TYPE = "DIFFICULTY";
    //性别类型标识
    String GENDER_TYPE = "GENDER";
    //审核状态标识
    String STATUS_TYPE = "STATUS";
    //学生身份id标志
    Long STUDENT_ROLE_ID = 1L;
    //辅导员身份id标志
    Long TEACHER_ROLE_ID = 4L;
    //学院身份id标志
    Long COLLEGE_ROLE_ID = 3L;
    //学校身份id标志
    Long SCHOOL_ROLE_ID = 2L;

    //困难等级
    String DIFFICULTY_BKN = "不困难";
    String DIFFICULTY_YBKN = "一般困难";
    String DIFFICULTY_TSKN = "特殊困难";

    //性别为男生的标志
    String GENDER_MAN = "男性";

    //辅导员节点
    Integer ROLE_NODE_1 = 1;
    //学院节点
    Integer ROLE_NODE_2 = 2;
    //学校节点
    Integer ROLE_NODE_3 = 3;
    //结束节点
    Integer ROLE_NODE_4 = 4;

    //审核状态-待审核
    String STATUS_DSH = "DSH";
    //审核状态-通过
    String STATUS_TG = "TG";
    //审核状态-不通过
    String STATUS_BTG = "BTG";
}
