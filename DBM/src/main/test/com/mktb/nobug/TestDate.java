package com.mktb.nobug;

import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class TestDate {
    @Test
    public void test1() {
        //now():获取当前的日期，时间，日期+时间
        LocalDateTime localDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        System.out.println(date);
        java.sql.Date date1 = new java.sql.Date(date.getTime());

        calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
        Date date2 = calendar.getTime();
        java.sql.Date date3 = new java.sql.Date(date2.getTime());
        System.out.println(date2);
        System.out.println(date3);
    }
}
