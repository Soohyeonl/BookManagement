package com.mktb.nobug.domain;

public class UserBookShow {
    private String user_id;
    private String book_id;
    private String book_name;
    private String lend_date;
    private String due_date;

    @Override
    public String toString() {
        return "UserBookShow{" +
                "user_id='" + user_id + '\'' +
                ", book_id='" + book_id + '\'' +
                ", book_name='" + book_name + '\'' +
                ", lend_date=" + lend_date +
                ", due_date=" + due_date +
                '}';
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public void setLend_date(String lend_date) {
        this.lend_date = lend_date;
    }

    public void setDue_date(String due_date) {
        this.due_date = due_date;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getBook_id() {
        return book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public String getLend_date() {
        return lend_date;
    }

    public String getDue_date() {
        return due_date;
    }
}
