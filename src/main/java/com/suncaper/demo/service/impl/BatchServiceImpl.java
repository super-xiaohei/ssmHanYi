package com.suncaper.demo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.suncaper.demo.common.Constant;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.BatchExample;
import com.suncaper.demo.entity.dto.BatchDto;
import com.suncaper.demo.mapper.BatchMapper;
import com.suncaper.demo.service.BatchService;
import com.suncaper.demo.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/16 - 18:38
 */
@Service
public class BatchServiceImpl implements BatchService {
    @Autowired
    private BatchMapper batchMapper;

    @Autowired
    private DictionaryService dictionaryService;

    @Override
    public Batch getActiveBatch() {
        BatchExample batchExample = new BatchExample();
        batchExample.createCriteria().andActiveEqualTo(Constant.FLAG_TRUE);
        List<Batch> batches = batchMapper.selectByExample(batchExample);
        return batches.size()>0?batches.get(0):null;
    }

    @Override
    public Integer save(Batch batch) {
        return batchMapper.insertSelective(batch);
    }

    @Override
    public PageInfo<Batch> list(BatchDto batchDto) {
        BatchExample batchExample = new BatchExample();
        batchExample.createCriteria().andIsDeletedEqualTo(Constant.IS_DELETE_0);
        batchExample.setOrderByClause("id desc");
        PageHelper.startPage(batchDto.getPageNum(),batchDto.getPageSize());
        List<Batch> batches = batchMapper.selectByExample(batchExample);
        PageInfo<Batch> batchPageInfo = new PageInfo<>(batches);

        //普通写法
//        List<BatchVo> batchVoList = new ArrayList<>();
//        for (Batch batch1 : batches) {
//            BatchVo batchVo = new BatchVo(batch1);
//            batchVo.setDifficultyValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,batch1.getDifficultyLevel()));
//            batchVoList.add(batchVo);
//        }
        //lambda表达式
//        List<BatchVo> collect = batches.stream().map(s -> {
//            BatchVo batchVo = new BatchVo(s);
//            batchVo.setDifficultyValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE, s.getDifficultyLevel()));
//            return batchVo;
//        }).collect(Collectors.toList());

        batchPageInfo.getList().stream().forEach(s->{
            s.setDiffcultyValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,s.getDifficultyLevel()));
        });
        return batchPageInfo;
    }
}
