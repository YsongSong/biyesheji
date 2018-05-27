package com.qikan.entitys;

public class NoticeWithBLOBs extends Notice {
    private String noticecontent;

    private String noticetext;

    public String getNoticecontent() {
        return noticecontent;
    }

    public void setNoticecontent(String noticecontent) {
        this.noticecontent = noticecontent == null ? null : noticecontent.trim();
    }

    public String getNoticetext() {
        return noticetext;
    }

    public void setNoticetext(String noticetext) {
        this.noticetext = noticetext == null ? null : noticetext.trim();
    }
}