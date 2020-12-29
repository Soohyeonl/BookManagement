package com.mktb.nobug.servlet;

import com.alibaba.fastjson.JSON;

import com.mktb.nobug.domain.Book;
import com.mktb.nobug.domain.Root;
import com.mktb.nobug.domain.User;
import com.mktb.nobug.util.JdbcUtil;

import org.apache.commons.dbutils.QueryRunner;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/rootshowbooks")
public class ShowRootBooks extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("RootShowBooks");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");


        HttpSession session = request.getSession();
        Root user = (Root) session.getAttribute("user");

        if (user == null || !user.getId().equals("root")) {
            response.getWriter().write("权限错误");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            QueryRunner qr = new QueryRunner(JdbcUtil.getDataSourceRoot());
            String sql = "select * from book";
            List<Book> allBooks = null;
            try {
                allBooks =  qr.query(sql, new BeanListHandler<Book>(Book.class));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            System.out.println(allBooks);

            //把图书从数据库取出存放到request域当中
            request.setAttribute("allBooks", allBooks);
            //转发到主页
            request.getRequestDispatcher("/mainRoot.jsp").forward(request, response);

//            Map<String, List<Book>> booksMap = new HashMap<>();
//            booksMap.put("books", allBooks);
//
//            String books = JSON.toJSON(allBooks).toString();
//            System.out.println(books);
//            response.getWriter().write(books);
        }

    }
}
