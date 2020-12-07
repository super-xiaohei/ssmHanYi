package com.suncaper.demo.entity.extend;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/17 - 16:44
 */
@Data
@Accessors(chain = true)
public class BatchExtend {
    private String diffcultyValue;
    private List<String> grades;

}
