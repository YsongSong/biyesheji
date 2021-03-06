package com.qikan.enums;

/**
 * 稿件审核状态(主编)
 * Created by Yang.
 */
public enum SendAdminStatus {
    FASONGZHUBIAN(1,"发送主编审稿"),
    TUIGAO(2,"退稿");

    private Integer code;   // 稿件状态码
    private String desc;    // 稿件状态描述

    private SendAdminStatus(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
