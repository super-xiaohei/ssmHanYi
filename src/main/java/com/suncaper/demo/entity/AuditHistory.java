package com.suncaper.demo.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;


@Data
@Accessors(chain = true)
public class AuditHistory {
    private Long id;

    private Long applicationId;

    private String auditBy;

    private String auditorName;

    private String auditComment;

    private Integer auditNodeCode;

    private String auditNodeName;

    private Boolean isDeleted;

    private String status;

    private Date gmtCreated;

    private Date gmtModified;


}