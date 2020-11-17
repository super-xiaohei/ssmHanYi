package com.suncaper.demo.common;

import com.suncaper.demo.entity.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author zyq
 * @date 2020/11/16 - 14:53
 */
public class SessionUtils {
    private static final String LOGIN_USER = "loginUser";

    public static void saveCurUser(User curUser){
        getSession().setAttribute(LOGIN_USER,curUser);
    }

    public static HttpSession getSession(){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        //getSession().setMaxInactiveInterval(60*60*2);
        HttpServletRequest request = attributes.getRequest();
        return request.getSession();
    }

    public static User getCurUser(){
        return (User) getSession().getAttribute(LOGIN_USER);
    }

    //使session无效,退出登录的时候，清除当前用户

    public static void clearCurUser(){
        getSession().removeAttribute(LOGIN_USER);
    }



}
