package com.suncaper.demo.entity;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.ibatis.annotations.AutomapConstructor;

import java.util.Date;


@Data
@Accessors(chain = true)
public class FlowSetting {
    private Long id;

    private Integer nodeCode;

    private String nodeName;

    private Integer nextNode;

    private Boolean isDeleted;

    private Date gmtCreated;

    private Date gmtModified;


}