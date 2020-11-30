package com.suncaper.demo.service.impl;

import com.suncaper.demo.entity.AuditHistory;
import com.suncaper.demo.mapper.AuditHistoryMapper;
import com.suncaper.demo.service.AuditHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zyq
 * @date 2020/11/25 - 11:26
 */
@Service
public class AuditHistoryServiceImpl implements AuditHistoryService {
    @Autowired
    private AuditHistoryMapper auditHistoryMapper;
    @Override
    public void insert(AuditHistory auditHistory) {
        auditHistoryMapper.insertSelective(auditHistory);
    }
}
