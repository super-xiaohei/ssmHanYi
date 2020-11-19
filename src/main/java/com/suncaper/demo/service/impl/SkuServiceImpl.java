package com.suncaper.demo.service.impl;

import com.suncaper.demo.mapper.SkuMapper;
import com.suncaper.demo.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zyq
 * @date 2020/11/18 - 18:19
 */
@Service
public class SkuServiceImpl implements SkuService {
    @Autowired
    private SkuMapper skuMapper;
}
