package com.mktb.nobug.servlet;

import com.mktb.nobug.domain.Root;
import com.mktb.nobug.domain.User;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("login");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String limit = request.getParameter("limit");

        String sql;
        QueryRunner qr;
        User user = null;
        Root root = null;

        if (limit.equals("user")) {
            qr = new QueryRunner(JdbcUtil.getDataSource());
            sql = "select * from user where user_id=? and user_pwd=?";

            try {
                user = qr.query(sql, new BeanHandler<User>(User.class), username, password);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            if (user != null) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("Login success ----" + user.getUser_name() + "  " + user.getUser_gender());
                response.sendRedirect("/DBM/userbooks");
//                response.setHeader("refresh", "1;url=/DBM/main.jsp");

                HttpSession session = request.getSession();
                session.setAttribute("user", user);

//                Cookie cookie = new Cookie("state", "user");
//                response.addCookie(cookie);
//                Cookie id = new Cookie("id", username);
//                response.addCookie(id);
            } else {
                response.getWriter().write("Login fail");
                response.setHeader("refresh", "1;url=/DBM/login.jsp");
            }

        } else {
            qr = new QueryRunner(JdbcUtil.getDataSourceRoot());
            sql = "select * from admin where id=? and pwd=?";

            try {
                root = qr.query(sql, new BeanHandler<Root>(Root.class), username, password);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            if (root != null) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("Login success ----" + root.getId());

                response.sendRedirect("/DBM/rootshowbooks");

//                response.setHeader("refresh", "1;url=/DBM/mainRoot.jsp");

                HttpSession session = request.getSession();
                session.setAttribute("user", root);

//                Cookie cookie = new Cookie("state", "admin");
//                response.addCookie(cookie);

            } else {
                response.getWriter().write("Login fail");
                response.setHeader("refresh", "1;url=/DBM/login.jsp");
            }
        }

    }
}