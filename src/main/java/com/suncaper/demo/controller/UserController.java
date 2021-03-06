package com.suncaper.demo.controller;

import com.suncaper.demo.common.Constant;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.common.SessionUtils;
import com.suncaper.demo.common.utils.ValidateCodeUtil;
import com.suncaper.demo.entity.Application;
import com.suncaper.demo.entity.Knrd;
import com.suncaper.demo.entity.Student;
import com.suncaper.demo.entity.User;
import com.suncaper.demo.entity.vo.StatisticsVo;
import com.suncaper.demo.service.ApplicationService;
import com.suncaper.demo.service.KnrdService;
import com.suncaper.demo.service.StudentService;
import com.suncaper.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @author zyq
 * @date 2020/11/16 - 13:47
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private KnrdService knrdService;
    @Autowired
    private ApplicationService applicationService;
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
            StatisticsVo statisticsVo = applicationService.statistics();
            System.out.println("-----------------------------------------------");
            System.out.println(statisticsVo.getAllCount());
            System.out.println("-----------------------------------------------");
            model.addAttribute("applicationInfo",statisticsVo);
            model.addAttribute("loginUser",loginUser);
            return "main";
        }
        Student student = studentService.selectByUser(user);
        if(student != null){
            Knrd knrd = knrdService.selectByUser(user);
            if(knrd != null){
                //判断用户的困难等级是否符合批次的困难等级
                boolean flag = userService.confirmPovertyLevel(knrd);
                if(!flag){
                    model.addAttribute("msg","当前用户不符合当前批次的困难等级");
                    return "login";
                }
                //如果以上都满足就将此学生的信息加入到白名单
                User u = new User();
                u.setSn(user.getSn());
                u.setName(user.getName());
                u.setPassword(user.getPassword());
                System.out.println("-----------------------------------------------------");
                System.out.println(user.getName());
                System.out.println(user.getPassword());
                System.out.println("-----------------------------------------------------");
                u.setRoleId(Constant.STUDENT_ROLE_ID);
                userService.insert(u);
                SessionUtils.saveCurUser(u);
                return "main";
            }
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

    @RequestMapping("/toRetrievePassword")
    public String toRetrievePassword(){
        return "forgotPassword";
    }

    @RequestMapping("/getValidateCode")
    public JsonResult getValidateCode(HttpSession session, HttpServletResponse response, Model model) throws Exception {
        //获取整个验证码的效果
        BufferedImage validateCodeImage = ValidateCodeUtil.getValidateCodeImage();
        //获取验证码的时候一定要存到session里面
        session.setAttribute("validateCodeImage",validateCodeImage);
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(validateCodeImage,"png",outputStream);
        //获取验证码里面的数字
        String validateCode = ValidateCodeUtil.getValidateCode();
        System.out.println("+++++++++++++++++++++++++++++++++++++");
        System.out.println(validateCode);
        System.out.println("+++++++++++++++++++++++++++++++++++++");
        //传到前端页面看看
        model.addAttribute("validateCode",validateCode.trim());
        return JsonResult.ok("获取成功");
    }
}
