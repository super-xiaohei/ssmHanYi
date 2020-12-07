package com.suncaper.demo.controller;

import com.suncaper.demo.service.BatchGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zyq
 * @date 2020/12/2 - 10:34
 */

@Controller
@RequestMapping("/batchGrade")
public class BatchGradeController {
    @Autowired
    private BatchGradeService batchGradeService;


}
