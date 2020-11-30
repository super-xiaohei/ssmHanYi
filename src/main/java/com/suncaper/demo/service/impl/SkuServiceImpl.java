package com.suncaper.demo.service.impl;

import com.suncaper.demo.common.Constant;
import com.suncaper.demo.entity.Sku;
import com.suncaper.demo.entity.SkuExample;
import com.suncaper.demo.mapper.SkuMapper;
import com.suncaper.demo.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/18 - 18:19
 */
@Service
public class SkuServiceImpl implements SkuService {
    @Autowired
    private SkuMapper skuMapper;

    @Override
    public void ManyInsert(List<Sku> skuList) {
        skuMapper.ManyInsert(skuList);
    }

    @Override
    public List<Sku> listByProductId(Long id) {
        SkuExample skuExample = new SkuExample();
        skuExample.createCriteria().andProductIdEqualTo(id).andIsDeletedEqualTo(Constant.IS_DELETE_0);
        return skuMapper.selectByExample(skuExample);
    }

    @Override
    public void deleteByExample(SkuExample skuExample) {
        skuMapper.deleteByExample(skuExample);
    }
}
