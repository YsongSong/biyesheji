package com.qikan.entitys;

public class Qikan {
    private Integer qikanid;    //  期刊编号

    private String qikanname;   //  期刊名称

    private String competentunit;   // 主管单位

    private String hostunit;    //  主办单位

    private String issn;    //  国际期刊

    private String cn;      //  国内期刊

    private String temail;  //  投稿邮箱

    private String readtime;  //  审稿时间

    private String image;   //  图片路径

    private Type type;

    private String jibie;

    public Integer getQikanid() {
        return qikanid;
    }

    public void setQikanid(Integer qikanid) {
        this.qikanid = qikanid;
    }

    public String getQikanname() {
        return qikanname;
    }

    public void setQikanname(String qikanname) {
        this.qikanname = qikanname;
    }

    public String getCompetentunit() {
        return competentunit;
    }

    public void setCompetentunit(String competentunit) {
        this.competentunit = competentunit;
    }

    public String getHostunit() {
        return hostunit;
    }

    public void setHostunit(String hostunit) {
        this.hostunit = hostunit;
    }

    public String getIssn() {
        return issn;
    }

    public void setIssn(String issn) {
        this.issn = issn;
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn;
    }

    public String getTemail() {
        return temail;
    }

    public void setTemail(String temail) {
        this.temail = temail;
    }

    public String getReadtime() {
        return readtime;
    }

    public void setReadtime(String readtime) {
        this.readtime = readtime;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getJibie() {
        return jibie;
    }

    public void setJibie(String jibie) {
        this.jibie = jibie;
    }

    @Override
    public String toString() {
        return "Qikan{" +
                "qikanid=" + qikanid +
                ", qikanname='" + qikanname + '\'' +
                ", competentunit='" + competentunit + '\'' +
                ", hostunit='" + hostunit + '\'' +
                ", issn='" + issn + '\'' +
                ", cn='" + cn + '\'' +
                ", temail='" + temail + '\'' +
                ", readtime='" + readtime + '\'' +
                ", image='" + image + '\'' +
                ", type=" + type +
                ", jibie='" + jibie + '\'' +
                '}';
    }
}