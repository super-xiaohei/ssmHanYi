package com.suncaper.demo.controller;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.common.SecurityUtils;
import com.suncaper.demo.entity.*;
import com.suncaper.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
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
    @Autowired
    private BatchService batchService;
    @Autowired
    private BatchGradeService batchGradeService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private SkuService skuService;

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
        //判断用户是否在本批次的所开放的年级
        //首先得到最新批次的开放的年级
        Batch curBatch = batchService.getCurBatch();
        List<String> gradesList = new ArrayList<>();
        List<BatchGrade> batchGradeList = batchGradeService.selectGradeByBatchId(curBatch.getId());
        for (int i = 0; i < batchGradeList.size(); i++) {
            gradesList.add(batchGradeList.get(i).getGrade());

        }
        //得到当前登录学生的年级
        User curUser = SecurityUtils.getCurUser();
        String grade = studentService.selectGradeByCurSn(curUser.getSn());
        //如果不是该批次开放年级的学生
        if(gradesList.contains(grade)){
            //判断当前用户是否已经提交了本批次的申请 true 有  false 没有
            boolean flag = applicationService.getCurApplication();
            if(flag){
                return JsonResult.ok(flag);
            }
            applicationService.insert(application);
            return JsonResult.ok(flag);
        }
        return JsonResult.fail("对不起,您不在本批次的开放年级中");

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
    public JsonResult updateApp(Application application,Sku sku){
        //获取当前选择的款式的规格的库存
        Sku sku2 = skuService.selectStockAndTotalBySkuId(sku.getId());
        Long skuStock = sku2.getSkuStock();
        boolean flag = applicationService.updateApp(application);
        if(flag){
            skuStock--;
            //如果选衣成功就修改数据库中的款式的规格的库存的值
            sku2.setSkuStock(skuStock);
            skuService.updateSkuStockByExample(sku2);
            return JsonResult.ok(true);
        }
        return JsonResult.fail("选衣失败，请重新尝试");
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
