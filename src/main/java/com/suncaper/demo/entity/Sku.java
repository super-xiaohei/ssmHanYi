package com.suncaper.demo.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@Accessors(chain = true)
public class Sku {
    private Long id;

    private Long productId;

    private String name;

    private Integer isDeleted;

    private Date gmtCreated;

    private Date gmtModified;


}