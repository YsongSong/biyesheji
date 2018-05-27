package com.qikan.entitys;

public class Type {
    private Integer typeid; // 期刊类别id

    private String typename; // 类别名称

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "Type{" +
                "typeid=" + typeid +
                ", typename='" + typename + '\'' +
                '}';
    }
}