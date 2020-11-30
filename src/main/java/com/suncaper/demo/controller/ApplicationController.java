package com.suncaper.demo.controller;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Application;
import com.suncaper.demo.entity.AuditHistory;
import com.suncaper.demo.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.krb5.internal.APOptions;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author zyq
 * @date 2020/11/25 - 11:30
 */
@Controller
@RequestMapping("/application")
public class ApplicationController {

    @Autowired
    private ApplicationService applicationService;

    @RequestMapping("/toApplicationCommit")
    public String toApplicationCommit(){
        return "applicationCommit";
    }



    //学生获取我的申请
    @RequestMapping("/listBySn")
    public String listBySn(Model model){
        //根据当前用户的sn获取他的所有申请
        List<Application> applicationList = applicationService.listBySn();
        model.addAttribute("applicationList",applicationList);
        return "applicationHistory";
    }

    //提交申请
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult insert(Application application){
        //判断当前用户是否已经提交了本批次的申请 true 有 false 没有
        boolean flag = applicationService.getCurApplication();
        if(flag){
            return JsonResult.ok(flag);
        }
        applicationService.insert(application);
        return JsonResult.ok(flag);
    }

    //获取待我审核
    @RequestMapping("/waitAudit")
    public String waitAudit(Model model){
        List<Application> applications = applicationService.waitAudit();
        model.addAttribute("waits",applications);
        return "waitAudit";
    }
    //进行审核
    @RequestMapping("/audit")
    @ResponseBody
    public JsonResult audit(AuditHistory auditHistory){
        applicationService.audit(auditHistory);
        return JsonResult.ok(true);
    }
    //选衣
    @RequestMapping("/updateApp")
    @ResponseBody
    public JsonResult updateApp(Application application){
        applicationService.updateApp(application);
        return JsonResult.ok(true);
    }
    //导出excel
    @RequestMapping("/export")
    @ResponseBody
    public void export(HttpServletResponse response){
        applicationService.export(response);
    }
    //获取统计
    @RequestMapping("/getStatistics")
    @ResponseBody
    public JsonResult getStatistics(){
        return JsonResult.ok(applicationService.statistics());
    }

}
