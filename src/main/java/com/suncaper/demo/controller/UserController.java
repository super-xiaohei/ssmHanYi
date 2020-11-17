package com.suncaper.demo.controller;

import com.suncaper.demo.common.SecurityUtils;
import com.suncaper.demo.common.SessionUtils;
import com.suncaper.demo.entity.User;
import com.suncaper.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.Security;

/**
 * @author zyq
 * @date 2020/11/16 - 13:47
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public String login(User user, Model model){

//        User loginUser = new User();
//        loginUser.setRoleId(1L);
//        //session.setAttribute("loginUser",loginUser);
//        SessionUtils.saveCurUser(loginUser);
//        User curUser = SecurityUtils.getCurUser();
        User loginUser = userService.login(user);
        if(loginUser != null) {
            SessionUtils.saveCurUser(loginUser);
            return "main";
        }
        model.addAttribute("msg","学号/工号或者密码错误!");
        return "login";
    }

    @RequestMapping("/toRegist")
    public String toRegist(){
        return "regist";
    }

    @RequestMapping("/regist")
    @ResponseBody
    public String regist(){
        return null;
    }
}
