package com.qikan.enums;

/**
 * 稿件审核状态(主编)
 * Created by Yang.
 */
public enum AdminStatus {
    YISONGSHEN(0,"已送主编审阅"),
    WEISONGSHEN(1,"未送主编审阅"),
    YISHENYUE(2,"主编已审阅"),
    YIFABIAO(3,"稿件已发表");



    private Integer code;   // 稿件状态码
    private String desc;    // 稿件状态描述

    private AdminStatus(Integer code, String desc) {
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
