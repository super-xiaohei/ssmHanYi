package com.suncaper.demo.service.impl;

import com.suncaper.demo.mapper.ImageMapper;
import com.suncaper.demo.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zyq
 * @date 2020/11/18 - 18:17
 */
@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageMapper imageMapper;
}
