package com.suncaper.demo.controller;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Product;
import com.suncaper.demo.entity.dto.ProductDto;
import com.suncaper.demo.mapper.SkuMapper;
import com.suncaper.demo.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zyq
 * @date 2020/12/1 - 18:27
 */
@Controller
@RequestMapping("/sku")
public class SkuController {
    @Autowired
    private SkuService skuService;

    @RequestMapping("/selectStockAndTotalBySkuId")
    @ResponseBody
    public JsonResult selectStockAndTotalBySkuId(Long skuId){
        return JsonResult.ok(skuService.selectStockAndTotalBySkuId(skuId));
    }
    @RequestMapping("/listByProductId")
    @ResponseBody
    public JsonResult listByProductId(Long id){
        return JsonResult.ok(skuService.listByProductId(id));
    }

}
