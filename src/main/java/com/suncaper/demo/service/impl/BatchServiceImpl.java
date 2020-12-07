package com.suncaper.demo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.suncaper.demo.common.Constant;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.common.SessionUtils;
import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.BatchExample;
import com.suncaper.demo.entity.BatchGrade;
import com.suncaper.demo.entity.dto.BatchDto;
import com.suncaper.demo.mapper.BatchMapper;
import com.suncaper.demo.service.BatchGradeService;
import com.suncaper.demo.service.BatchService;
import com.suncaper.demo.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
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
    @Autowired
    private BatchGradeService batchGradeService;
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
        BatchExample.Criteria criteria = batchExample.createCriteria();
        if(batchDto.getActive() != null && !"".equals(batchDto.getActive())){
            criteria.andActiveEqualTo(batchDto.getActive());
        }
        if(batchDto.getName() != null && !"".equals(batchDto.getName())){
            criteria.andNameLike("%" + batchDto.getName() + "%");
        }
        if(batchDto.getDifficultyLevel() != null && !"".equals(batchDto.getDifficultyLevel())){
            criteria.andDifficultyLevelEqualTo(batchDto.getDifficultyLevel());
        }
        criteria.andIsDeletedEqualTo(Constant.IS_DELETE_0);
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
        //获取当前的批次
        Batch curBatch = getCurBatch();
        List<BatchGrade> batchGradeList = batchGradeService.selectGradeByBatchId(curBatch.getId());
       /* batchPageInfo.getList().stream().forEach(s->{
            s.setDiffcultyValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,s.getDifficultyLevel()));
        });*/
        //设置困难等级和年级在里面
        for (int i = 0; i < batchPageInfo.getList().size(); i++) {
            batchPageInfo.getList().get(i).setDiffcultyValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,batchPageInfo.getList().get(i).getDifficultyLevel()));
            for (int j = 0; j < batchGradeList.size(); j++) {
                batchPageInfo.getList().get(i).setGrades(Arrays.asList(batchGradeList.get(j).getGrade()));
            }
        }
        return batchPageInfo;
    }

    @Override
    public void end(long id) {
        Batch batch = new Batch();
        batch.setId(id);
        batch.setActive(Constant.AVTIVE_FLAG_FALSE);
        batchMapper.updateByPrimaryKeySelective(batch);
    }

    @Override
    public void deletes(List<Long> ids) {
        ids.add(-1L); //防止万一ids数组中的容量为0出现安全问题
        batchMapper.deletes(ids);
    }

    @Override
    public List<Batch> listByAjax() {
        BatchExample batchExample = new BatchExample();
        BatchExample.Criteria criteria = batchExample.createCriteria();
        criteria.andIsDeletedEqualTo(Constant.IS_DELETE_0);
        batchExample.setOrderByClause("id desc");
        List<Batch> batches = batchMapper.selectByExample(batchExample);
        return batches;
    }

    @Override
    public Batch selectByPrimaryKey(Long batchId) {
        return batchMapper.selectByPrimaryKey(batchId);
    }

    @Override
    public Batch getCurBatch() {
        BatchExample batchExample = new BatchExample();
        BatchExample.Criteria criteria = batchExample.createCriteria();
        criteria.andIsDeletedEqualTo(Constant.IS_DELETE_0).andActiveEqualTo(Constant.AVTIVE_FLAG_TRUE);
        List<Batch> batches = batchMapper.selectByExample(batchExample);
        Batch batch = null;
        if(batches.size() == 0){
            //如果数据库中没有已经激活的批次，就获取最近一次创建的批次
            BatchExample batchExampleLast = new BatchExample();
            batchExampleLast.createCriteria().andIsDeletedEqualTo(Constant.IS_DELETE_0);
            batchExampleLast.setOrderByClause("id desc");
            List<Batch> batchesLast = batchMapper.selectByExample(batchExampleLast);
            return batchesLast.size() == 0?new Batch():batchesLast.get(0);
        }
        batch = batches.get(0);
        batch.setDiffcultyValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,batch.getDifficultyLevel()));
        return batch;
    }

    @Override
    public JsonResult selectBatchById(Long id) {
        BatchExample batchExample = new BatchExample();
        batchExample.createCriteria().andIdEqualTo(id);
        List<Batch> batches = batchMapper.selectByExample(batchExample);
        return JsonResult.ok(batches.size()>0?batches.get(0):null);
    }
}
