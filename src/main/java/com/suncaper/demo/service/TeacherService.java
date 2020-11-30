package com.suncaper.demo.service;

import com.suncaper.demo.entity.Teacher;
import com.suncaper.demo.entity.TeacherExample;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/25 - 18:36
 */
public interface TeacherService {
    List<Teacher> selectByExample(TeacherExample teacherExample);
}
