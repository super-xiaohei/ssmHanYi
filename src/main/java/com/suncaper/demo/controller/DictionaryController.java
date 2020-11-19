package com.suncaper.demo.controller;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Dictionary;
import com.suncaper.demo.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zyq
 * @date 2020/11/18 - 10:42
 */
@RequestMapping("/dictionary")
@Controller
public class DictionaryController {
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("/getDictionary")
    @ResponseBody
    public JsonResult getDictionary(Dictionary dictionary){
        return JsonResult.ok(dictionaryService.getDictionary(dictionary));
    }
}
