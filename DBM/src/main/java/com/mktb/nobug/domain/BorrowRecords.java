package com.mktb.nobug.domain;

import java.sql.Date;

public class BorrowRecords {
    private Integer record_id;
    private String user_id;
    private String book_id;
    private Date lend_date;
    private Date due_date;
    private Date return_date;
    private String state;


    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public void setLend_date(Date lend_date) {
        this.lend_date = lend_date;
    }

    @Override
    public String toString() {
        return "BorrowRecords{" +
                "record_id=" + record_id +
                ", user_id='" + user_id + '\'' +
                ", book_id='" + book_id + '\'' +
                ", lend_date=" + lend_date +
                ", due_date=" + due_date +
                ", return_date=" + return_date +
                ", state='" + state + '\'' +
                '}';
    }

    public void setDue_date(Date due_date) {
        this.due_date = due_date;
    }

    public void setReturn_date(Date return_date) {
        this.return_date = return_date;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setRecord_id(Integer record_id) {
        this.record_id = record_id;
    }

    public Integer getRecord_id() {
        return record_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getBook_id() {
        return book_id;
    }

    public Date getLend_date() {
        return lend_date;
    }

    public Date getDue_date() {
        return due_date;
    }

    public Date getReturn_date() {
        return return_date;
    }

    public String getState() {
        return state;
    }
}
