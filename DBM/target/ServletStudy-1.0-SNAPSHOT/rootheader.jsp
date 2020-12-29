<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <!--链接外部样式-->
    <link rel="stylesheet" href="style/headerStyle.css">

</head>
<body>
<!--头部-->
<div id="header">
<!--头部登录，购物车-->
<div class="header_top">
        <!--中部-->
        <div class="header_top_center">
            <!--中部左侧-->
            <div class="h_top_left">
                欢迎来到图书管理系统
                <c:if test="${!empty user }">
                    <a href="/DBM/rootshowbooks">主页</a>
                </c:if>
            </div>
            <!--中部右侧-->
            <div class="h_top_right">
            <!--有没有用户  session -->
            <c:if test="${empty user }">
           		 <a href="login.jsp">登录</a>
                <a href="register.html">注册</a>
            </c:if>

            <div class="h_top_left">
                <c:if test="${!empty user }">
                    欢迎： ${user.id }
                    <a href="/DBM/logout">退出</a>
                </c:if>
            </div>
            </div>


        </div>
</div>


</div>
    