package com.suncaper.demo.service.impl;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.BatchExample;
import com.suncaper.demo.entity.BatchGrade;
import com.suncaper.demo.entity.BatchGradeExample;
import com.suncaper.demo.entity.dto.BatchDto;
import com.suncaper.demo.mapper.BatchGradeMapper;
import com.suncaper.demo.service.BatchGradeService;
import com.suncaper.demo.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zyq
 * @date 2020/12/2 - 10:33
 */

@Service
public class BatchGradeServiceImpl implements BatchGradeService {
    @Autowired
    private BatchGradeMapper batchGradeMapper;
    @Autowired
    private BatchService batchService;

    @Override
    public void addGrade(BatchDto batchDto) {
        //得到当前的批次
        Batch curBatch = batchService.getCurBatch();
        List<String> grades = batchDto.getGrades();
        List<BatchGrade> batchGrades = grades.stream().map(grade -> {
            BatchGrade batchGrade = new BatchGrade();
            batchGrade.setBatchId(curBatch.getId());
            batchGrade.setGrade(grade);
            return batchGrade;
        }).collect(Collectors.toList());
        batchGrades.stream().forEach(x->{
            x.setBatchId(curBatch.getId());
            batchGradeMapper.insertSelective(x);
        });
    }

    @Override
    public List<BatchGrade> selectGradeByBatchId(Long id) {
        BatchGradeExample batchGradeExample = new BatchGradeExample();
        batchGradeExample.createCriteria().andBatchIdEqualTo(id);
        List<BatchGrade> batchGrades = batchGradeMapper.selectByExample(batchGradeExample);
        return batchGrades;
    }



}
