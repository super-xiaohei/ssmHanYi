package com.suncaper.demo.service;

import com.github.pagehelper.PageInfo;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.dto.BatchDto;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/16 - 18:38
 */
public interface BatchService {
    Batch getActiveBatch();

    Integer save(Batch batch);

    PageInfo<Batch> list(BatchDto batchDto);

    void end(long id);

    void deletes(List<Long> ids);

    List<Batch> listByAjax();


}
