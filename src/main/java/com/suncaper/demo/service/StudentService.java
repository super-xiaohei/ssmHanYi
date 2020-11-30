package com.suncaper.demo.service;

import com.suncaper.demo.entity.Student;
import com.suncaper.demo.entity.User;

/**
 * @author zyq
 * @date 2020/11/24 - 19:46
 */
public interface StudentService {
    Student selectByUser(User user);
}
