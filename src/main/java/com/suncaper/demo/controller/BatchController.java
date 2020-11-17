package com.suncaper.demo.controller;

import com.github.pagehelper.PageInfo;
import com.suncaper.demo.common.Constant;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.dto.BatchDto;
import com.suncaper.demo.entity.vo.BatchVo;
import com.suncaper.demo.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/toBatchList")
    public String toBatchList(){
        return "batchList";
    }

    @RequestMapping("/getActiveBatch")
    @ResponseBody
    public JsonResult getActiveBatch(){

        return JsonResult.ok(batchService.getActiveBatch());
    }

    @RequestMapping("/save")
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
}
