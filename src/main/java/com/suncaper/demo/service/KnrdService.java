package com.suncaper.demo.service;

import com.suncaper.demo.entity.Knrd;
import com.suncaper.demo.entity.User;

/**
 * @author zyq
 * @date 2020/11/24 - 19:45
 */
public interface KnrdService {
    Knrd selectByUser(User user);
}
