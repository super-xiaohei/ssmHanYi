package com.suncaper.demo.entity.dto;

import com.suncaper.demo.entity.Batch;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/17 - 17:44
 */
public class BatchDto extends Batch {

    private List<Long> ids;
    private Integer pageNum;
    private Integer pageSize;

    public BatchDto() {
    }

    public BatchDto(Integer pageNum, Integer pageSize) {
        super();
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    public BatchDto(List<Long> ids, Integer pageNum, Integer pageSize) {
        super();
        this.ids = ids;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    public List<Long> getIds() {
        return ids;
    }

    public void setIds(List<Long> ids) {
        this.ids = ids;
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
