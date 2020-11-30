package com.suncaper.demo.entity;

import com.suncaper.demo.entity.extend.ProductExtend;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@Accessors(chain = true)
public class Product extends ProductExtend {
    private Long id;

    private String name;

    private String productNumber;

    private Long batchId;

    private String gender;

    private Integer isDeleted;

    private Date gmtCreated;

    private Date gmtModified;

    private String description;

}