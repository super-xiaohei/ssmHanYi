package com.suncaper.demo.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@Accessors(chain = true)
public class Dictionary {
    private Integer id;

    private Integer parentId;

    private String type;

    private String itemName;

    private String itemValue;

    private String description;

    private String extdata;

    private Short sortId;

    private Boolean isEditable;

    private Boolean isDeletable;

    private Boolean isDeleted;

    private Date gmtCreated;

    private Date gmtModified;


}