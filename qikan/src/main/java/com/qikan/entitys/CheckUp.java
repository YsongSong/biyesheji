package com.qikan.entitys;

public class CheckUp {
    private Integer cheekid;

    private ArticleInfo articleInfo;

    private UserInfo expertInfo;

    private String expertenddate;

    private Integer ischeck;

    private Integer adminMessage;

    private Integer adminstatus;

    public Integer getAdminMessage() {
        return adminMessage;
    }

    public void setAdminMessage(Integer adminMessage) {
        this.adminMessage = adminMessage;
    }

    public Integer getCheekid() {
        return cheekid;
    }

    public void setCheekid(Integer cheekid) {
        this.cheekid = cheekid;
    }

    public ArticleInfo getArticleInfo() {
        return articleInfo;
    }

    public void setArticleInfo(ArticleInfo articleInfo) {
        this.articleInfo = articleInfo;
    }

    public UserInfo getExpertInfo() {
        return expertInfo;
    }

    public void setExpertInfo(UserInfo expertInfo) {
        this.expertInfo = expertInfo;
    }

    public String getExpertenddate() {
        return expertenddate;
    }

    public void setExpertenddate(String expertenddate) {
        this.expertenddate = expertenddate == null ? null : expertenddate.trim();
    }

    public Integer getIscheck() {
        return ischeck;
    }

    public void setIscheck(Integer ischeck) {
        this.ischeck = ischeck;
    }

    public Integer getAdminstatus() {
        return adminstatus;
    }

    public void setAdminstatus(Integer adminstatus) {
        this.adminstatus = adminstatus;
    }

    @Override
    public String toString() {
        return "CheckUp{" +
                "cheekid=" + cheekid +
                ", articleInfo=" + articleInfo +
                ", expertInfo=" + expertInfo +
                ", expertenddate='" + expertenddate + '\'' +
                ", ischeck=" + ischeck +
                ", adminMessage=" + adminMessage +
                ", adminstatus=" + adminstatus +
                '}';
    }
}