package com.qf.courier.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class User {
    private String username;
    private String password;
    private String name;
    private String phone;
    private int type;
    @JSONField(format = "yyyy-MM-dd")
    private Date createdate;

    public User(String username, String password, String name, String phone, int type, Date createdate) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.type = type;
        this.createdate = createdate;
    }

    public User() {
    }

    public User(String name, String phone, int type) {

        this.name = name;
        this.phone = phone;
        this.type = type;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", type=" + type +
                ", createdate=" + createdate +
                '}';
    }
}
