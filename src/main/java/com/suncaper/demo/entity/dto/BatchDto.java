package com.suncaper.demo.entity.dto;

import com.suncaper.demo.entity.Batch;

/**
 * @author zyq
 * @date 2020/11/17 - 17:44
 */
public class BatchDto extends Batch {
    private Integer pageNum;
    private Integer pageSize;

    public BatchDto() {
    }

    public BatchDto(Integer pageNum, Integer pageSize) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
