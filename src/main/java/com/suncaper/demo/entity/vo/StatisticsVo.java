package com.suncaper.demo.entity.vo;

import com.suncaper.demo.entity.Application;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author zyq
 * @date 2020/11/30 - 10:38
 */
@Data
@Accessors(chain = true)
public class StatisticsVo{
    private Integer allCount;//总申请人数
    private Integer passCount;//申请通过人数
    private Integer noPassCount;//申请未通过人数
    private Integer waitAuditCount;//等待审核的人数
}
