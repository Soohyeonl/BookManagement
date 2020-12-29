package com.mktb.nobug.servlet;

import com.mktb.nobug.domain.Book;
import com.mktb.nobug.domain.Root;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/addBook")
public class AddNewBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AddNewServlet");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();
        Root user = (Root) session.getAttribute("user");

        if (user == null || !user.getId().equals("root")) {
            response.getWriter().write("权限错误");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            String book_num = request.getParameter("book_num");

            Map<String, String[]> parameterMap = request.getParameterMap();
            Book book = new Book();
            book.setNow_num(Integer.parseInt(book_num));
            //把接受的参数封装成User对象
            try {
                BeanUtils.populate(book, parameterMap);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }

            System.out.println(book);

            //写入到数据库
            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSourceRoot());
            String checked = "select * from book where book_id=?";
            Book abook = null;
            try {
                abook = qr.query(checked, new BeanHandler<Book>(Book.class), book.getBook_id());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            if (abook != null) {
                String updateNumSql = "update book set book_num = book_num + ? where book_id = ?";
                try {
                    qr.update(updateNumSql, book.getBook_num(), book.getBook_id());
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                response.sendRedirect("/DBM/rootshowbooks");

            } else {
                String sql = "insert into book value(?,?,?,?,?,?,?,?,?)";
                try {
                    qr.update(sql, book.getBook_id(), book.getBook_name(), book.getPrice(), book.getAuther(),
                            book.getBook_kind(), book.getPublisher(), book.getBook_num(), book.getDescription(),
                            book.getNow_num());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                //跳转到主页面
                response.sendRedirect("/DBM/rootshowbooks");
            }
        }
    }
}
