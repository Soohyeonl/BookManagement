package com.mktb.nobug.domain;

public class Book {
    String book_id;
    String book_name;
    Double price;
    String auther;
    String book_kind;
    String publisher;
    Integer book_num;
    String description;
    Integer now_num;

    @Override
    public String toString() {
        return "Book{" +
                "book_id='" + book_id + '\'' +
                ", book_name='" + book_name + '\'' +
                ", price=" + price +
                ", auther='" + auther + '\'' +
                ", book_kind='" + book_kind + '\'' +
                ", publisher='" + publisher + '\'' +
                ", book_num=" + book_num +
                ", description='" + description + '\'' +
                ", now_num=" + now_num +
                '}';
    }

    public void setNow_num(Integer now_num) {
        this.now_num = now_num;
    }

    public Integer getNow_num() {
        return now_num;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setAuther(String auther) {
        this.auther = auther;
    }

    public void setBook_kind(String book_kind) {
        this.book_kind = book_kind;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setBook_num(Integer book_num) {
        this.book_num = book_num;
    }

    public String getBook_id() {
        return book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public Double getPrice() {
        return price;
    }

    public String getAuther() {
        return auther;
    }

    public String getBook_kind() {
        return book_kind;
    }

    public String getPublisher() {
        return publisher;
    }

    public Integer getBook_num() {
        return book_num;
    }

}
