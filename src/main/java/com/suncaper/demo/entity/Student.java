package com.suncaper.demo.entity;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Student {
    private String sn;

    private String name;

    private String password;

    private String gender;

    private String nation;

    private String nationality;

    private String college;

    private String major;

    private String clazz;

    private String collegeCode;

    private String majorCode;

    private String classCode;

    private String grade;


}