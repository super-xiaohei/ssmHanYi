package com.suncaper.demo.service;

import com.suncaper.demo.entity.Sku;
import com.suncaper.demo.entity.SkuExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/18 - 18:18
 */
public interface SkuService {

    void ManyInsert(List<Sku> skuList);

    List<Sku> listByProductId(Long id);

    void deleteByExample(SkuExample skuExample);
}
