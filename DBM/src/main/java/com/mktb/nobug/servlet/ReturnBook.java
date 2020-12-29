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

@WebServlet("/returnBook")
public class ReturnBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static Date getNowDate() {
        Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();

        return new Date(date.getTime());
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("ReturnBook");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String user_id = null;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.getWriter().write("还书请先登录");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            user_id = user.getUser_id();
            String book_id = request.getParameter("book_id");

            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            String sql = "select * from BorrowRecords where book_id=? and user_id=? and state=?";
            BorrowRecords findBorrowRecord = null;
            try {
                findBorrowRecord =  qr.query(sql, new BeanHandler<BorrowRecords>(BorrowRecords.class), book_id, user_id, "0");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            if (findBorrowRecord != null) {

                Date returnDate = getNowDate();
                findBorrowRecord.setReturn_date(returnDate);

                Long dueTime = findBorrowRecord.getDue_date().getTime();
                Long returnTime = returnDate.getTime();

                if (returnTime > dueTime) {
                    findBorrowRecord.setState("2");
                } else {
                    findBorrowRecord.setState("1");
                }

                String updateBorrowRecordSQL = "update BorrowRecords set return_date=?,state=? where record_id=?";

                try {
                    qr.update(updateBorrowRecordSQL, findBorrowRecord.getReturn_date(), findBorrowRecord.getState(), findBorrowRecord.getRecord_id());
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                if (findBorrowRecord.getState().equals("1")) {
                    response.getWriter().write("还书成功");

                    response.setHeader("refresh", "2;url=/DBM/userbooks");
                } else {
                    response.getWriter().write("超时还书，请到指定地点支付费用");
                    response.setHeader("refresh", "2;url=/DBM/userbooks");
                }

            } else {
                response.getWriter().write("未借此书");
                response.setHeader("refresh", "2;url=/DBM/userbooks");
            }
        }
    }
}
