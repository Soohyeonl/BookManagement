package com.mktb.nobug.domain;

public class User {
    String user_id;
    String user_name;
    String user_pwd;
    String user_phone;
    String user_gender;

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(String user_gender) {
        this.user_gender = user_gender;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public String getUser_phone() {
        return user_phone;
    }
}
