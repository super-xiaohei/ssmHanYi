package com.suncaper.demo.controller;

import com.suncaper.demo.entity.Product;
import com.suncaper.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zyq
 * @date 2020/11/18 - 18:14
 */
@RequestMapping("/product")
@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "productAdd";
    }
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insert(Product product){
        productService.insert(product);
        return "productList";
    }
}
