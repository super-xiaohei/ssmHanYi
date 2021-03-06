package com.suncaper.demo.controller;

import com.github.pagehelper.PageInfo;
import com.suncaper.demo.common.Constant;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.dto.BatchDto;
import com.suncaper.demo.service.BatchGradeService;
import com.suncaper.demo.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.*;
import java.util.List;

/**
 * @author zyq
 * @date 2020/11/16 - 18:41
 */

@Controller
@RequestMapping("/batch")
public class BatchController {

    @Autowired
    private BatchService batchService;
    @Autowired
    private BatchGradeService batchGradeService;

    @RequestMapping("/toBatchList")
    public String toBatchList(){
        return "batchList";
    }

    @RequestMapping("/getActiveBatch")
    @ResponseBody
    public JsonResult getActiveBatch(){
        return JsonResult.ok(batchService.getActiveBatch());
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult save(Batch batch){
        batch.setActive(Constant.AVTIVE_FLAG_TRUE);
        batchService.save(batch);
        return JsonResult.ok("操作成功");
    }

    @RequestMapping("/list")
    public String list(BatchDto batchDto, Model model){
        PageInfo<Batch> batchPageInfo = batchService.list(batchDto);
        model.addAttribute("batchPageInfo",batchPageInfo);
        return "batchList";
    }

    @RequestMapping("/end")
    @ResponseBody
    public JsonResult end(long id){
        batchService.end(id);
        return JsonResult.ok(true);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public JsonResult deletes(@RequestParam("ids[]") List<Long> ids){
        batchService.deletes(ids);
        return JsonResult.ok(true);
    }


    @RequestMapping("/listByAjax")
    @ResponseBody
    public JsonResult listByAjax(){
       List<Batch> list = batchService.listByAjax();
        return JsonResult.ok(list);
    }

    @RequestMapping("/addGrade")
    @ResponseBody
    public JsonResult addGrade(BatchDto batchDto){
        batchGradeService.addGrade(batchDto);
        return JsonResult.ok(true);
    }
    @RequestMapping("/selectBatchById")
    @ResponseBody
    public JsonResult selectBatchById(Long id){
        return batchService.selectBatchById(id);
    }
}
