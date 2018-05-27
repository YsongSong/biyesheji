package com.qikan.entitys;

public class Notice {
    private Integer noticeid;   // id

    private String noticetitle;     // 通知标题

    private Type type;     // 所属类别

    private String noticetime;    // 通知发布时间

    public Integer getNoticeid() {
        return noticeid;
    }

    public void setNoticeid(Integer noticeid) {
        this.noticeid = noticeid;
    }

    public String getNoticetitle() {
        return noticetitle;
    }

    public void setNoticetitle(String noticetitle) {
        this.noticetitle = noticetitle == null ? null : noticetitle.trim();
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getNoticetime() {
        return noticetime;
    }

    public void setNoticetime(String noticetime) {
        this.noticetime = noticetime;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "noticeid=" + noticeid +
                ", noticetitle='" + noticetitle + '\'' +
                ", type=" + type +
                ", noticetime=" + noticetime +
                '}';
    }
}