package com.qikan.entitys;

public class ArticleInfo {
    private Integer articleid;  // 稿件编号

    private String articlecntitle;  // 稿件中文标题

    private String articleentitle;  // 稿件英文标题

    private String articlecnsummary;    // 稿件中文摘要

    private String articleensummary;    // 稿件英文摘要

    private String articlecnkeywords;   // 稿件中文关键字

    private String articleenkeywords;   // 稿件英文关键字

    private Qikan qikan;    // 所属期刊

    private String receivearticletime;  // 稿件投稿时间

    private String readarticletime;     // 稿件审稿时间

    private String updatearticletime;   // 退修时间

    private Integer editorstatus;       // 审核状态 0待审核,1审核中,2已审核

    private Integer articlestatus;      // 发表状态 0发表,1退稿

    private String publishtime;         // 发表时间

    private UserInfo author;            // 作者

    private UserInfo expert;            // 审稿专家

    private String articlepath; //稿件上传存储路径

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }

    public String getArticlecntitle() {
        return articlecntitle;
    }

    public void setArticlecntitle(String articlecntitle) {
        this.articlecntitle = articlecntitle == null ? null : articlecntitle.trim();
    }

    public String getArticleentitle() {
        return articleentitle;
    }

    public void setArticleentitle(String articleentitle) {
        this.articleentitle = articleentitle == null ? null : articleentitle.trim();
    }

    public String getArticlecnsummary() {
        return articlecnsummary;
    }

    public void setArticlecnsummary(String articlecnsummary) {
        this.articlecnsummary = articlecnsummary == null ? null : articlecnsummary.trim();
    }

    public String getArticleensummary() {
        return articleensummary;
    }

    public void setArticleensummary(String articleensummary) {
        this.articleensummary = articleensummary == null ? null : articleensummary.trim();
    }

    public String getArticlecnkeywords() {
        return articlecnkeywords;
    }

    public void setArticlecnkeywords(String articlecnkeywords) {
        this.articlecnkeywords = articlecnkeywords == null ? null : articlecnkeywords.trim();
    }

    public String getArticleenkeywords() {
        return articleenkeywords;
    }

    public void setArticleenkeywords(String articleenkeywords) {
        this.articleenkeywords = articleenkeywords == null ? null : articleenkeywords.trim();
    }

    public String getReceivearticletime() {
        return receivearticletime;
    }

    public void setReceivearticletime(String receivearticletime) {
        this.receivearticletime = receivearticletime == null ? null : receivearticletime.trim();
    }

    public String getReadarticletime() {
        return readarticletime;
    }

    public void setReadarticletime(String readarticletime) {
        this.readarticletime = readarticletime == null ? null : readarticletime.trim();
    }

    public String getUpdatearticletime() {
        return updatearticletime;
    }

    public void setUpdatearticletime(String updatearticletime) {
        this.updatearticletime = updatearticletime == null ? null : updatearticletime.trim();
    }

    public Integer getEditorstatus() {
        return editorstatus;
    }

    public void setEditorstatus(Integer editorstatus) {
        this.editorstatus = editorstatus;
    }

    public Integer getArticlestatus() {
        return articlestatus;
    }

    public void setArticlestatus(Integer articlestatus) {
        this.articlestatus = articlestatus;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime == null ? null : publishtime.trim();
    }

    public Qikan getQikan() {
        return qikan;
    }

    public void setQikan(Qikan qikan) {
        this.qikan = qikan;
    }

    public UserInfo getAuthor() {
        return author;
    }

    public void setAuthor(UserInfo author) {
        this.author = author;
    }

    public UserInfo getExpert() {
        return expert;
    }

    public void setExpert(UserInfo expert) {
        this.expert = expert;
    }

    public String getArticlepath() {
        return articlepath;
    }

    public void setArticlepath(String articlepath) {
        this.articlepath = articlepath == null ? null : articlepath.trim();
    }

    @Override
    public String toString() {
        return "ArticleInfo{" +
                "articleid=" + articleid +
                ", articlecntitle='" + articlecntitle + '\'' +
                ", articleentitle='" + articleentitle + '\'' +
                ", articlecnsummary='" + articlecnsummary + '\'' +
                ", articleensummary='" + articleensummary + '\'' +
                ", articlecnkeywords='" + articlecnkeywords + '\'' +
                ", articleenkeywords='" + articleenkeywords + '\'' +
                ", qikan=" + qikan +
                ", receivearticletime='" + receivearticletime + '\'' +
                ", readarticletime='" + readarticletime + '\'' +
                ", updatearticletime='" + updatearticletime + '\'' +
                ", editorstatus=" + editorstatus +
                ", articlestatus=" + articlestatus +
                ", publishtime='" + publishtime + '\'' +
                ", author=" + author +
                ", expert=" + expert +
                ", articlepath='" + articlepath + '\'' +
                '}';
    }
}