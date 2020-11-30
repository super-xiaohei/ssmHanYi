package com.suncaper.demo.entity;

import com.suncaper.demo.entity.extend.BatchExtend;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Accessors(chain = true) //表示支持链式写法
public class Batch extends BatchExtend {
    private Long id;

    private String name;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date applicationStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date applicationEndDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date registerStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date registerEndDate;

    private String difficultyLevel;

    private Integer isDeleted;

    private Integer active;

    private Date gmtCreated;

    private Date gmtModified;

}