package com.suncaper.demo.service.impl;

import com.suncaper.demo.common.Constant;
import com.suncaper.demo.entity.Image;
import com.suncaper.demo.entity.ImageExample;
import com.suncaper.demo.mapper.ImageMapper;
import com.suncaper.demo.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/18 - 18:17
 */
@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageMapper imageMapper;

    @Override
    public void insertImage(List<Image> images) {
        images.stream().forEach(x->{
            imageMapper.insertSelective(x);
        });
        //imageMapper.insertSelective(image);
    }

    @Override
    public List<Image> listByProductId(Long id) {
        ImageExample imageExample = new ImageExample();
        imageExample.createCriteria().andProductIdEqualTo(id).andIsDeletedEqualTo(Constant.IS_DELETE_0);
        return imageMapper.selectByExample(imageExample);
    }

    @Override
    public void deleteByExample(ImageExample imageExample) {
        imageMapper.deleteByExample(imageExample);
    }
}
