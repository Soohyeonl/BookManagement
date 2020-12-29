package com.mktb.nobug.servlet;

import com.mktb.nobug.domain.Book;
import com.mktb.nobug.domain.User;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/searchbook")
public class SearchBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SearchBook");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");


        String user_id = null;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.getWriter().write("请先登录");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            String search = request.getParameter("search_thing");

            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
            String searchSQL = "select * from book where book_name like ? or description like ?";

            List<Book> searchBooks = null;

            try {
                searchBooks = qr.query(searchSQL, new BeanListHandler<Book>(Book.class), "%" + search + "%", "%" + search + "%");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            if (searchBooks != null && !searchBooks.isEmpty()) {
                session.setAttribute("searchBooks", searchBooks);
                session.setAttribute("notfind", false);
                //把图书从数据库取出存放到request域当中
                //request.setAttribute("allBooks", allBooks);
                //转发到主页
                request.getRequestDispatcher("/main.jsp").forward(request, response);
            } else {
                session.removeAttribute("searchBooks");
                session.setAttribute("notfind", true);

                response.setHeader("refresh", "0;url=/DBM/userbooks");
            }
        }
    }
}
