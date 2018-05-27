package com.qikan.enums;

/**
 * Created by Yang.
 */
public enum SystemIdEnums {
    /**
     * 编辑系统
     * */
    EDIT_SYS("111","编辑办公系统"),
    /**
     * 专家系统
     * */
    EXPERT_SYS("222","专家审稿系统"),
    /**
     * 作者系统
     * */
    AUTHOR_SYS("333","作者投稿系统"),

    ADMIN_SYS("444","主编在线办公");

    private String code;
    private String name;
    SystemIdEnums(String code,String name){
        this.code=code;
        this.name=name;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

}
