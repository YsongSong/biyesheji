package com.qikan.enums;

/**
 * Created by Yang.
 */
public enum RoleIdEnums {
    ADMIN(0,"主编"),
    EDITOR(1,"编辑"),
    EXPERT(2,"专家"),
    AUTHOR(3,"作者");

    /*角色代码*/
    private int code;
    /*描述*/
    private String desc;

    RoleIdEnums(int code, String desc){
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
