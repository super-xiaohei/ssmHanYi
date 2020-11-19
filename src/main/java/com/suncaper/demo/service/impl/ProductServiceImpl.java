package com.suncaper.demo.service.impl;

import com.suncaper.demo.entity.Product;
import com.suncaper.demo.mapper.ProductMapper;
import com.suncaper.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zyq
 * @date 2020/11/18 - 18:15
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public void insert(Product product) {
        productMapper.insertSelective(product);
    }
}
