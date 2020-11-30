package com.suncaper.demo.controller;

import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Application;
import com.suncaper.demo.entity.Image;
import com.suncaper.demo.entity.Product;
import com.suncaper.demo.entity.dto.ProductDto;
import com.suncaper.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
    public String insert(HttpServletRequest request, MultipartFile[] multipartFile, ProductDto productDto, Model model) throws IOException {
        String realPath = request.getServletContext().getRealPath("static/imgs");
        System.out.println(realPath);
        System.out.println();
        File imageFile = new File(realPath);
        if(!imageFile.exists()){
            imageFile.mkdir();
        }
        List<Image> images = Stream.of(multipartFile)
                .filter(x->x.getOriginalFilename()!=null&&!"".equals(x.getOriginalFilename()))
                .map(x -> {
            String path = UUID.randomUUID().toString() + x.getOriginalFilename();
            System.out.println(path);
            File fileUpload = new File(realPath + "/" + path);
            if (!fileUpload.exists()) {
                try {
                    fileUpload.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            try {
                x.transferTo(fileUpload);//--------------------------
            } catch (IOException e) {
                e.printStackTrace();
            }
            Image image = new Image();
            image.setPath(path);
            image.setName(x.getOriginalFilename());
            return image;
        }).collect(Collectors.toList());
        productService.insert(productDto,images);
        return "forward:/product/list";
    }


    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(HttpServletRequest request, MultipartFile[] multipartFile, ProductDto productDto, Model model) throws IOException {
        String realPath = request.getServletContext().getRealPath("static/imgs");
        System.out.println(realPath);
        System.out.println();
        File imageFile = new File(realPath);
        if(!imageFile.exists()){
            imageFile.mkdir();
        }
        List<Image> images = Stream.of(multipartFile)
                .filter(x->x.getOriginalFilename()!=null&&!"".equals(x.getOriginalFilename()))
                .map(x -> {
                    String path = UUID.randomUUID().toString() + x.getOriginalFilename();
                    System.out.println(path);
                    File fileUpload = new File(realPath + "/" + path);
                    if (!fileUpload.exists()) {
                        try {
                            fileUpload.createNewFile();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    try {
                        x.transferTo(fileUpload);//--------------------------
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Image image = new Image();
                    image.setPath(path);
                    image.setName(x.getOriginalFilename());
                    return image;
                }).collect(Collectors.toList());
        productService.update(productDto,images);
        return "forward:/product/list";
    }

    @RequestMapping("/list")
    public String list(ProductDto productDto, Model model){
        PageInfo<Product> productPageInfo = productService.list(productDto);
        model.addAttribute("productPageInfo",productPageInfo);
        return "productList";
    }

    @RequestMapping("/deleteById")
    @ResponseBody
    public JsonResult deleteById(Long id){
        return productService.deleteById(id);
    }
    @RequestMapping("/selectById")
    @ResponseBody
    public JsonResult selectById(Long id){
        return productService.selectById(id);
    }

    @RequestMapping("/listBySn")
    public String listBySn(ProductDto productDto,Model model){
       List<Product> productList = productService.listBySn(productDto);
       model.addAttribute("productList",productList);
       return "myProductList";
    }

}
