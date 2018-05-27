package com.qikan.enums;

/**
 * Created by Yang.
 */
public enum LogEnum {
    LOGIN(1,"用户登录"),
    LOGOUT(2,"用户注销"),
    SEARCH(3,"查询操作"),
    UPDATE(4,"更新操作"),
    ADD(5,"添加操作"),
    DELETE(6,"删除操作"),
    DOWNLOAD(7,"下载操作");

    private Integer code; // 操作编号
    private String desc;  // 操作描述
    LogEnum(Integer code, String desc){
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

    @Override
    public String toString() {
        return "LogEnum{" +
                "code=" + code +
                ", desc='" + desc + '\'' +
                '}';
    }
}
