package com.mktb.nobug.servlet;

import com.alibaba.fastjson.JSON;
import com.mktb.nobug.domain.Book;
import com.mktb.nobug.domain.BorrowRecords;
import com.mktb.nobug.domain.User;
import com.mktb.nobug.domain.UserBookShow;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/userbooks")
public class ShowUserBooks extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("showBook");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");


        String user_id = null;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.getWriter().write("请先登录");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            user_id = user.getUser_id();
            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            String sql = "select br.user_id, bo.book_id, bo.book_name, br.lend_date, br.due_date from BorrowRecords br, book bo\n" +
                    "where br.user_id = ? and bo.book_id = br.book_id and br.state='0'";
            List<UserBookShow> allBooks = null;
            try {
                allBooks =  qr.query(sql, new BeanListHandler<UserBookShow>(UserBookShow.class), user_id);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            System.out.println(allBooks);

            if (allBooks != null) {
                session.setAttribute("allBooks", allBooks);
                //把图书从数据库取出存放到request域当中
                //request.setAttribute("allBooks", allBooks);
                //转发到主页
                request.getRequestDispatcher("/main.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/main.jsp").forward(request, response);
            }
//            Map<String, List<UserBookShow>> booksMap = new HashMap<>();
//            booksMap.put("books", allBooks);
//
//            String books = JSON.toJSON(allBooks).toString();
//            System.out.println(books);
//            response.getWriter().write(books);
        }
    }
}
