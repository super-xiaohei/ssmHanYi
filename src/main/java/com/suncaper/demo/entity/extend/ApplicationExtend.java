package com.suncaper.demo.entity.extend;

import com.suncaper.demo.entity.Batch;
import lombok.Data;

/**
 * @author zyq
 * @date 2020/11/25 - 16:53
 */
@Data
public class ApplicationExtend {
    private Batch batch;
    private String difValue;
    private String statusValue;
}
