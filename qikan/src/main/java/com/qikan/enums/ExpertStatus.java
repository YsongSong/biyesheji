package com.qikan.enums;

/**
 * 稿件审核结果(主编)
 * Created by Yang.
 */
public enum ExpertStatus {
    YISHENHE(0,"已审核"),
    WEISHENHE(1,"未审核");


    private Integer code;   // 稿件状态码
    private String desc;    // 稿件状态描述

    private ExpertStatus(Integer code, String desc) {
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
