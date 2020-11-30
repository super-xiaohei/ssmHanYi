package com.suncaper.demo.service;

import com.suncaper.demo.entity.Image;
import com.suncaper.demo.entity.ImageExample;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/18 - 18:17
 */
public interface ImageService {
    void insertImage(List<Image> images);

    List<Image> listByProductId(Long id);

    void deleteByExample(ImageExample imageExample);
}
