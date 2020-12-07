package com.suncaper.demo.entity.dto;

import com.suncaper.demo.entity.Batch;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/17 - 17:44
 */
@Data
@Accessors(chain = true)
public class BatchDto extends Batch {
    private List<Long> ids;
    private Integer pageNum;
    private Integer pageSize;
}
