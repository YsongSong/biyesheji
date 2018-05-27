package com.qikan.entitys;

import java.util.List;

/**
 * Created by Yang.
 */
public class IndexPageBean {
    private Type type;
    private List<Notice> noticeList;
    private List<Qikan> qikanList;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public List<Notice> getNoticeList() {
        return noticeList;
    }

    public void setNoticeList(List<Notice> noticeList) {
        this.noticeList = noticeList;
    }

    public List<Qikan> getQikanList() {
        return qikanList;
    }

    public void setQikanList(List<Qikan> qikanList) {
        this.qikanList = qikanList;
    }
}
