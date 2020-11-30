package com.suncaper.demo.mapper.extend;

import com.suncaper.demo.entity.Sku;
import com.suncaper.demo.mapper.SkuMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/18 - 17:58
 */
public interface SkuMapperExtend {
    void ManyInsert(@Param("skuList") List<Sku> skuList);
}
