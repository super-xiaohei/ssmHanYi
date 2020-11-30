package com.suncaper.demo.service.impl;

import com.suncaper.demo.entity.FlowSetting;
import com.suncaper.demo.entity.FlowSettingExample;
import com.suncaper.demo.mapper.FlowSettingMapper;
import com.suncaper.demo.service.FlowSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/25 - 11:24
 */

@Service
public class FlowSettingServiceImpl implements FlowSettingService {
    @Autowired
    private FlowSettingMapper flowSettingMapper;
    @Override
    public String getNodeNameByNodeCode(Integer currentNodeCode) {
        FlowSettingExample flowSettingExample = new FlowSettingExample();
        flowSettingExample.createCriteria().andNodeCodeEqualTo(currentNodeCode);
        List<FlowSetting> flowSettings = flowSettingMapper.selectByExample(flowSettingExample);
        return flowSettings.size() == 0?"":flowSettings.get(0).getNodeName();
    }

    @Override
    public FlowSetting getNextNodeByCurNode(Integer currentNodeCode) {
        //通过currentNodeCode（application表里面的）去获取node_code（flowsetting表里面的）
        FlowSetting nodeByCode = this.getNodeByCode(currentNodeCode);
        //再通过node_code（flowsetting表里面的）获取next_node（flowsetting表里面的）
        //根据当前节点的下一个节点值获取下一个节点
        if(nodeByCode != null){
            FlowSetting nextNode = this.getNodeByCode(nodeByCode.getNextNode());
            return nextNode;
        }
        return null;
    }

    //根据code获取节点
    public FlowSetting getNodeByCode(Integer currentNodeCode){
        FlowSettingExample flowSettingExample = new FlowSettingExample();
        flowSettingExample.createCriteria().andNodeCodeEqualTo(currentNodeCode);
        List<FlowSetting> flowSettings = flowSettingMapper.selectByExample(flowSettingExample);
        return flowSettings.size() == 0?null:flowSettings.get(0);
    }
}
