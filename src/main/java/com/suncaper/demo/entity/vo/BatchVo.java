package com.suncaper.demo.entity.vo;

import com.suncaper.demo.entity.Batch;

/**
 * @author zyq
 * @date 2020/11/17 - 16:05
 */
public class BatchVo extends Batch {
    private String difficultyValue; //困难等级真正的值

    public BatchVo(Batch batch){
        super.setApplicationStartDate(batch.getApplicationStartDate());
        super.setApplicationEndDate(batch.getApplicationEndDate());
        super.setRegisterStartDate(batch.getRegisterStartDate());
        super.setRegisterEndDate(batch.getRegisterEndDate());
        super.setName(batch.getName());
        super.setActive(batch.getActive());
    }

    public String getDifficultyValue() {
        return difficultyValue;
    }

    public void setDifficultyValue(String difficultyValue) {
        this.difficultyValue = difficultyValue;
    }
}
