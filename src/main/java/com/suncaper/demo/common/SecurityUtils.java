package com.suncaper.demo.common;

import com.suncaper.demo.entity.User;

import javax.jws.soap.SOAPBinding;

/**
 * @author zyq
 * @date 2020/11/16 - 15:04
 */
public class SecurityUtils {
    public static User getCurUser(){
        User curUser = SessionUtils.getCurUser();
        if(curUser == null){
            User user = new User();
            user.setRoleId(2l);
            user.setSn("123132132114");
        }
        return curUser;
    }
}
