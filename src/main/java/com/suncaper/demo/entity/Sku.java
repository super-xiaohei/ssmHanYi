package com.suncaper.demo.entity;

import java.util.Date;

public class Sku {
    private Long id;

    private Long productId;

    private String skuName;

    private Integer isDeleted;

    private Date gmtCreated;

    private Date gmtModified;

    private Long skuStock;

    private Long skuTotal;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName == null ? null : skuName.trim();
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getGmtCreated() {
        return gmtCreated;
    }

    public void setGmtCreated(Date gmtCreated) {
        this.gmtCreated = gmtCreated;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Long getSkuStock() {
        return skuStock;
    }

    public void setSkuStock(Long skuStock) {
        this.skuStock = skuStock;
    }

    public Long getSkuTotal() {
        return skuTotal;
    }

    public void setSkuTotal(Long skuTotal) {
        this.skuTotal = skuTotal;
    }
}