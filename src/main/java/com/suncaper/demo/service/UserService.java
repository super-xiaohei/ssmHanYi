package com.suncaper.demo.service;

import com.suncaper.demo.entity.Knrd;
import com.suncaper.demo.entity.User;

/**
 * @author zyq
 * @date 2020/11/16 - 13:11
 */
public interface UserService {

    User login(User user);

    void insert(User u);

    boolean confirmPovertyLevel(Knrd knrd);
}
