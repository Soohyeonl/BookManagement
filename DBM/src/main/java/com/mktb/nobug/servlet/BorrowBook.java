package com.mktb.nobug.servlet;

import com.mktb.nobug.domain.Book;
import com.mktb.nobug.domain.BorrowRecords;
import com.mktb.nobug.domain.User;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

@WebServlet("/borrowBook")
public class BorrowBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static Date getNowDate() {
        Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();

        return new Date(date.getTime());
    }

    public static Date getNextDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
        return new Date(calendar.getTime().getTime());
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("BorrowBook");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        //验证用户信息
//        boolean flag = false;
//        Cookie[] cookies = request.getCookies();
//        String user_id = null;
//        if(cookies != null) {
//            //取出每一个cookies
//            for (Cookie cookie : cookies) {
//                //判断名字是否是自己的
//                String name = cookie.getName();
//                if (name.equals("state")) {
//                    flag = cookie.getValue().equals("user");
//                }
//                if (name.equals("id")) {
//                    user_id = cookie.getValue();
//                }
//            }
//        }

        String user_id = null;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.getWriter().write("借书请先登录");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            user_id = user.getUser_id();
            String book_id = request.getParameter("book_id");

            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            String sql = "select * from book where book_id=? and now_num>0";
            Book findBook = null;
            try {
                findBook =  qr.query(sql, new BeanHandler<Book>(Book.class), book_id);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            if (findBook != null) {
                String addBorrowRecordSQL = "insert into BorrowRecords(user_id,book_id,lend_date,due_date,return_date,state) values(?,?,?,?,?,?)";
                BorrowRecords br = new BorrowRecords();

                br.setBook_id(book_id);
                br.setUser_id(user_id);
                br.setState("0");
                br.setLend_date(getNowDate());
                br.setDue_date(getNextDate());
                br.setReturn_date(null);

                try {
                    qr.update(addBorrowRecordSQL, br.getUser_id(), br.getBook_id(), br.getLend_date(), br.getDue_date(), br.getReturn_date(), br.getState());
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                response.getWriter().write("借书成功");

                response.setHeader("refresh", "2;url=/DBM/userbooks");
            } else {
                response.getWriter().write("该书不存在或该书已经全部借出");

                response.setHeader("refresh", "2;url=/DBM/userbooks");
            }
        }
    }
}
