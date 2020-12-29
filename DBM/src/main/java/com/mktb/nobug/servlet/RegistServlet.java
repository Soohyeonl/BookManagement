package com.mktb.nobug.servlet;

import com.mktb.nobug.domain.User;
import com.mktb.nobug.util.JdbcUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;


@WebServlet("/register")
public class RegistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("RegistServlet");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        Map<String, String[]> parameterMap = request.getParameterMap();
        User u = new User();
        //把接受的参数封装成User对象
        try {
            BeanUtils.populate(u, parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        System.out.println(u);

        //写入到数据库
        QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
        String checked = "select * from user where user_id=?";
        User auser = null;
        try {
            auser = qr.query(checked, new BeanHandler<User>(User.class), u.getUser_id());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (auser != null) {
            response.getWriter().write("该学号已经注册，请登录（1s后自动跳转）");
            response.setHeader("refresh", "1;url=/DBM/login.jsp");
        } else {
            String sql = "insert into user value(?,?,?,?,?)";
            try {
                qr.update(sql, u.getUser_id(), u.getUser_name(), u.getUser_pwd(),
                        u.getUser_phone(), u.getUser_gender());
            } catch (SQLException e) {
                e.printStackTrace();
            }
            //跳转到登录页面
            response.setHeader("refresh", "0;url=/DBM/login.jsp");
        }
    }

}
