package com.suncaper.demo.service;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.BatchGrade;
import com.suncaper.demo.entity.dto.BatchDto;

import java.util.List;

/**
 * @author zyq
 * @date 2020/12/2 - 10:33
 */
public interface BatchGradeService {
    void addGrade(BatchDto batchDto);

    List<BatchGrade> selectGradeByBatchId(Long id);
}
