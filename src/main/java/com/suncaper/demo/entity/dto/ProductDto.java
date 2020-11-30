package com.suncaper.demo.entity.dto;

import com.suncaper.demo.entity.Product;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/19 - 11:07
 */
@Data
@Accessors(chain = true)
public class ProductDto extends Product {
    private List<String> skuName;
    private Integer pageNum;
    private Integer pageSize;
    private List<String> oldImg;

}
