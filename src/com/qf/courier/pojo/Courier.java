package com.qf.courier.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class Courier {
    private String cno;
    private String getter;
    private String putter;
    @JSONField(format = "yyyy-MM-dd")
    private Date putdate;
    @JSONField(format = "yyyy-MM-dd")
    private Date getdate;
    private String getcode;
    private String state;
    private String fromd;
    private String tod;
    private int audit;

    public Courier(String cno, String getter, String putter, Date putdate, Date getdate, String getcode, String state, String fromd, String tod, int audit) {
        this.cno = cno;
        this.getter = getter;
        this.putter = putter;
        this.putdate = putdate;
        this.getdate = getdate;
        this.getcode = getcode;
        this.state = state;
        this.fromd = fromd;
        this.tod = tod;
        this.audit = audit;
    }

    public Courier() {
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getGetter() {
        return getter;
    }

    public void setGetter(String getter) {
        this.getter = getter;
    }

    public String getPutter() {
        return putter;
    }

    public void setPutter(String putter) {
        this.putter = putter;
    }

    public Date getPutdate() {
        return putdate;
    }

    public void setPutdate(Date putdate) {
        this.putdate = putdate;
    }

    public Date getGetdate() {
        return getdate;
    }

    public void setGetdate(Date getdate) {
        this.getdate = getdate;
    }

    public String getPasscode() {
        return getcode;
    }

    public void setPasscode(String passcode) {
        this.getcode = getcode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getFromd() {
        return fromd;
    }

    public void setFromd(String fromd) {
        this.fromd = fromd;
    }

    public String getTod() {
        return tod;
    }

    public void setTod(String tod) {
        this.tod = tod;
    }

    public String getGetcode() {
        return getcode;
    }

    public void setGetcode(String getcode) {
        this.getcode = getcode;
    }

    public int getAudit() {
        return audit;
    }

    public void setAudit(int audit) {
        this.audit = audit;
    }

    @Override
    public String toString() {
        return "Courier{" +
                "cno='" + cno + '\'' +
                ", getter='" + getter + '\'' +
                ", putter='" + putter + '\'' +
                ", putdate=" + putdate +
                ", getdate=" + getdate +
                ", getcode='" + getcode + '\'' +
                ", state='" + state + '\'' +
                ", fromd='" + fromd + '\'' +
                ", tod='" + tod + '\'' +
                ", audit=" + audit +
                '}';
    }
}
