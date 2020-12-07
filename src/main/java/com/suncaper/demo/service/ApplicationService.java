package com.suncaper.demo.service;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Application;
import com.suncaper.demo.entity.AuditHistory;
import com.suncaper.demo.entity.vo.StatisticsVo;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author zyq
 * @date 2020/11/25 - 11:25
 */
public interface ApplicationService {
    void insert(Application application);

    boolean getCurApplication();

    List<Application> listBySn();

    List<Application> waitAudit();

    void audit(AuditHistory auditHistory);

    boolean updateApp(Application application);

    void export(HttpServletResponse response);

    StatisticsVo statistics();

}
