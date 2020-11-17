package com.suncaper.demo.service.impl;

import com.suncaper.demo.entity.User;
import com.suncaper.demo.entity.UserExample;
import com.suncaper.demo.mapper.UserMapper;
import com.suncaper.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/16 - 13:11
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andSnEqualTo(user.getSn()).andPasswordEqualTo(user.getPassword());
        List<User> users = userMapper.selectByExample(userExample);
       return users.size()>0?users.get(0):null;
    }
}
