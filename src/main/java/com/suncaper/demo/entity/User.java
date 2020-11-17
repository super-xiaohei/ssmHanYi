package com.suncaper.demo.entity;

import java.util.Date;

public class User {
    private Long id;

    private String sn;

    private String name;

    private String password;

    private Long roleId;

    private String sex;

    private Boolean isEnabled;

    private Boolean isDeleted;

    private Date gmtCreated;

    private Date gmtModified;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Boolean getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getGmtCreated() {
        return gmtCreated;
    }

    public void setGmtCreated(Date gmtCreated) {
        this.gmtCreated = gmtCreated;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        return "User{" +
                "\"id\":" + id +
                ", \"sn\":\"" + sn + '\"' +
                ", \"name\":\"" + name + '\"' +
                ", \"password\":\"" + password + '\"' +
                ", \"roleId\":" + roleId +
                ", \"sex\":\"" + sex + '\"' +
                ", \"isEnabled\":" + isEnabled +
                ", \"isDeleted\":" + isDeleted +
                ", \"gmtCreated\":" + gmtCreated +
                ", \"gmtModified\":" + gmtModified +
                '}';
    }
}