package com.qikan.enums;

/**
 * 稿件审核状态
 * Created by Yang.
 */
public enum EditorStatus {
    DAISHENHE(0,"待分派"),
    SHENHEZHONG(1,"专家未审核"),
    YISHENHE(2,"专家已审核");

    private Integer code;   // 稿件状态码
    private String desc;    // 稿件状态描述

    private EditorStatus(Integer code, String desc) {
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
