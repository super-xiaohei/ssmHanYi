package com.suncaper.demo.service;

import com.suncaper.demo.entity.FlowSetting;

/**
 * @author zyq
 * @date 2020/11/25 - 11:23
 */
public interface FlowSettingService {
    String getNodeNameByNodeCode(Integer currentNodeCode);

    FlowSetting getNextNodeByCurNode(Integer currentNodeCode);
}
