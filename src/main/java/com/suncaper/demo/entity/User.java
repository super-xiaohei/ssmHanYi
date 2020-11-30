package com.suncaper.demo.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;


@Data
@Accessors(chain = true)
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