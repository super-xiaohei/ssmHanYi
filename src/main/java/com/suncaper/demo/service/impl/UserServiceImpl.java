package com.suncaper.demo.service.impl;

import com.suncaper.demo.common.Constant;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.Knrd;
import com.suncaper.demo.entity.User;
import com.suncaper.demo.entity.UserExample;
import com.suncaper.demo.mapper.UserMapper;
import com.suncaper.demo.service.BatchService;
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
    @Autowired
    private BatchService batchService;

    @Override
    public User login(User user) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andSnEqualTo(user.getSn()).andPasswordEqualTo(user.getPassword());
        List<User> users = userMapper.selectByExample(userExample);
       return users.size()>0?users.get(0):null;
    }

    @Override
    public void insert(User u) {
        userMapper.insertSelective(u);
    }

    @Override
    public boolean confirmPovertyLevel(Knrd knrd) {
        Batch curBatch = batchService.getCurBatch();
        //当前已经激活批次的可申请的困难等级
        String curBatchDiffcultyValue = curBatch.getDiffcultyValue();
        //当前学生的困难等级
        String knrdPovertyLevel = knrd.getPovertyLevel();
        //如果当前批次的可申请困难等级为不困难，那么在knrd表里面的所有学生可以申请（不困难，一般困难，特殊困难）
        if(Constant.DIFFICULTY_BKN.equals(curBatchDiffcultyValue)){
            return true;
        }
        //如果当前批次的可申请困难等级为一般困难，那么在knrd表里面的一般困难，特殊困难学生可以申请（一般困难，特殊困难）
        if(Constant.DIFFICULTY_YBKN.equals(curBatchDiffcultyValue)&&(Constant.DIFFICULTY_YBKN.equals(knrdPovertyLevel)||Constant.DIFFICULTY_TSKN.equals(knrdPovertyLevel))){
            return true;
        }
        //如果当前批次的可申请困难等级为特殊困难，那么在knrd表里面只有特殊困难学生可以申请（特殊困难）
        if(Constant.DIFFICULTY_TSKN.equals(curBatchDiffcultyValue)&&Constant.DIFFICULTY_TSKN.equals(knrdPovertyLevel)){
            return true;
        }
        return false;
    }
}
