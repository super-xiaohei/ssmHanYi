package com.suncaper.demo.service;

import com.github.pagehelper.PageInfo;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Application;
import com.suncaper.demo.entity.Image;
import com.suncaper.demo.entity.Product;
import com.suncaper.demo.entity.dto.ProductDto;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/18 - 18:15
 */
public interface ProductService {
    void insert(ProductDto productDto, List<Image> images);

    PageInfo<Product> list(ProductDto productDto);

    JsonResult deleteById(Long id);

    JsonResult selectById(Long id);

    void update(ProductDto productDto, List<Image> images);

    List<Product> listBySn(ProductDto productDto);
}

