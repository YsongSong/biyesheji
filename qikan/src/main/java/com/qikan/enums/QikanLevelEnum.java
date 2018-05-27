package com.qikan.enums;

import com.qikan.util.StringUtil;

/**
 * Created by Yang.
 */
public enum QikanLevelEnum {
    NATIONAL(1, "国家级"),
    PROVINCE(2, "省级"),
    HEXIN(3, "核心期刊");

    private int id;
    private String name;
    private QikanLevelEnum(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static QikanLevelEnum getQikanLevelById(int id) {
        switch (id) {
            case 1 : return NATIONAL;
            case 2 : return PROVINCE;
            default : throw new RuntimeException("id=" + id + "暂时没有此期刊级别");
        }
    }

    public static QikanLevelEnum getQikanLevelByName (String name) {
        if(StringUtil.isEmpty(name)) {
            return null;
        }
        for (QikanLevelEnum qikanLevelEnum : values()) {
            if(name.contains(qikanLevelEnum.name)) {
                return qikanLevelEnum;
            }
        }
        throw new RuntimeException("name=" + name + "暂时没有此期刊级别");
    }
}
