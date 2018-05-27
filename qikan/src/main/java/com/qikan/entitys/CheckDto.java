package com.qikan.entitys;

/**
 * Created by Yang.
 */
public class CheckDto extends CheckUpWithBLOBs {

    private Integer pc;  // 当前页数

    private Integer ps = 5; // 每页记录数

    public Integer getPc() {
        return pc;
    }

    public void setPc(Integer pc) {
        this.pc = pc;
    }

    public Integer getPs() {
        return ps;
    }

    public void setPs(Integer ps) {
        this.ps = ps;
    }

    @Override
    public String toString() {
        return "CheckDto{" +
                "pc=" + pc +
                ", ps=" + ps +
                '}';
    }
}
