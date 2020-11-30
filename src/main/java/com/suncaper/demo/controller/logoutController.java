package com.suncaper.demo.controller;

import com.suncaper.demo.common.SessionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.stream.Stream;

/**
 * @author zyq
 * @date 2020/11/16 - 15:33
 */

@Controller
@RequestMapping("/logout")
public class logoutController {

    @RequestMapping("toLogout")
    public String logout(){
        SessionUtils.clearCurUser();
        return "login";
    }

}
