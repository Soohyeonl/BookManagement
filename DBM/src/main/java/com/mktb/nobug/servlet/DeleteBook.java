package com.mktb.nobug.servlet;

import com.mktb.nobug.domain.Book;
import com.mktb.nobug.domain.Root;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

@WebServlet("/deleteBook")
public class DeleteBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("DeleteBook");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");


        HttpSession session = request.getSession();
        Root user = (Root) session.getAttribute("user");

        if (user == null || !user.getId().equals("root")) {
            response.getWriter().write("权限错误");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            String book_id = request.getParameter("book_id");

            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSourceRoot());
            String sql = "select * from book where book_id = ?";

            Book findBook = null;
            try {
                findBook =  qr.query(sql, new BeanHandler<Book>(Book.class), book_id);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            if (findBook != null) {
                if (findBook.getBook_num().equals(findBook.getNow_num())) {
                    String deleteSQL = "delete from book where book_id = ?";

                    try {
                        qr.update(deleteSQL, book_id);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }

                    response.getWriter().write("图书删除成功");

                    response.setHeader("refresh", "2;url=/DBM/rootshowbooks");
                } else {
                    response.getWriter().write("部分该书未归还，删除失败");

                    response.setHeader("refresh", "2;url=/DBM/rootshowbooks");
                }
            } else {
                response.getWriter().write("图书id错误");

                response.setHeader("refresh", "2;url=/DBM/rootshowbooks");
            }

        }
    }
}
