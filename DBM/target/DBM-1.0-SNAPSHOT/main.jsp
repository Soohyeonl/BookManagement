<%@ page import="com.mktb.nobug.domain.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mktb.nobug.domain.UserBookShow" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户主页</title>
    <link rel="stylesheet" href="style/table.css">

    <script type="text/javascript">

        function Check() {
            var a = document.borrow.book_id.value
            if (a == "") {
                window.alert("图书id不能为空");
                return false;
            }

            var form = document.getElementById("borrow");
            form.submit();

        }

        function Check1() {
            var b = document.returnb.book_id.value
            if (b == "") {
                window.alert("图书id不能为空");
                return false;
            }

            var form = document.getElementById("returnb");
            form.submit();

        }

        function Check2() {
            var c = document.search.search_thing.value
            if (c == "") {
                window.alert("图书id不能为空");
                return false;
            }

            var form = document.getElementById("search_id");
            form.submit();

        }

    </script>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        a {
            text-decoration: none;
            color: #666666;
        }

        body {
            background-color: #f9f9f9;
        }

        th {
            height: 40px;
            white-space: nowrap;
            background-color: #f8f8f9 !important;
            border: 1px solid #e9eaec !important;
        }

        table {
            margin: 50px auto;
            width: 70%;
        }

        table td {
            text-align: center;
            border-color: lavenderblush !important;
        }
        table tr:hover td {
            background-color: #ebf7ff;
        }

        .delete {
            width: 200px;
            height: 200px;
            margin: 20px auto;
        }

        form span {
            margin-left: 93px;
            margin-right: 8px;
        }
        form .chaxun {
            margin-left: 78px;
            margin-right: 8px;
        }
        .box1 {
            width: 630px;
            height: 120px;
            margin: 20px auto;
        }
        .box2 {
            width: 630px;
            height: 60px;
            margin: 20px auto;
        }

        button {
            background-color: skyblue;
            border: none;
            color: darkgreen;
            padding: 7px 10px;
            margin-left: 8px;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            border-radius: 15px;
        }

        .add {
            background-color: green;
        }

        button:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .in {
            display: inline-block;
            width: 50%;
            height: 32px;
            line-height: 1.5;
            padding: 4px 7px;
            font-size: 12px;
            border: 1px solid #dddee1;
            border-radius: 4px;
            color: #495060;
            background-color: #fff;
            background-image: none;
            position: relative;
            cursor: text;
            transition: border .2s ease-in-out, background .2s ease-in-out, box-shadow .2s ease-in-out;
        }
    </style>

</head>
<body>
<%@ include file="/header.jsp" %>


<%--<form action="/DBM/borrowBook" name="borrow" id="borrow" method="POST">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>图书id</th>--%>
<%--            <td><input type="text" name="book_id" placeholder="请输入..."/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td></td>--%>
<%--            <td>--%>
<%--                <input type="button" value="借书" onclick="Check()"/>--%>

<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>

<%--<form action="/DBM/returnBook" name="returnb" id="returnb" method="POST">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>图书id</th>--%>
<%--            <td><input type="text" name="book_id" placeholder="请输入..."/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td></td>--%>
<%--            <td>--%>
<%--                <input type="button" value="还书" onclick="Check1()"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>

<%--<%--%>
<%--    List<UserBookShow> allBooks =  (List<UserBookShow>)request.getAttribute("allBooks");--%>
<%--    System.out.println(allBooks);--%>
<%--%>--%>


<div class="box1">

    <form action="/DBM/returnBook" name="returnb" id="returnb" method="POST">
        <span>还书id</span>
        <input class="in" type="text" name="book_id" placeholder="请输入..." />
        <button onclick="Check1()">还书</button>
    </form>
</div>


<c:if test="${empty allBooks}">
    未借阅图书
</c:if>

<c:if test="${!empty allBooks}">
<table class="gridtable">
    <th>
        <td>图书编号</td>
        <td>书名</td>
        <td>借阅时间</td>
        <td>到期时间</td>
    </th>

    </c:if>


    <c:forEach items="${allBooks}" var="userbook">
        <tr>
            <td></td>
            <td>${userbook.book_id}</td>
            <td>${userbook.book_name}</td>
            <td>${userbook.lend_date}</td>
            <td>${userbook.due_date}</td>
        </tr>
        <br/>
    </c:forEach>

    <c:if test="${!empty allBooks}">
</table>
</c:if>


<%--<form action="/DBM/searchbook" name="search" id="search_id" method="POST">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>查询内容</th>--%>
<%--            <td><input type="text" name="search_thing" placeholder="请输入..."/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td></td>--%>
<%--            <td>--%>
<%--                <input type="button" value="查询" onclick="Check2()"/>--%>

<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>

<div class="box2">
    <form action="/DBM/searchbook" name="search" id="search_id" method="POST">

        <span class="chaxun">查询内容</span>
        <input class="in" type="text" name="search_thing" placeholder="请输入..." />
        <button onclick="Check2()">查询</button>

    </form>

    <form action="/DBM/borrowBook" name="borrow" id="borrow" method="POST">

        <span>借书id</span>
        <input  class="in" type="text" name="book_id" placeholder="请输入..." />
        <button onclick="Check()">借书</button>
    </form>
</div>


<c:if test="${!empty notfind}">
    <c:if test="${notfind}">
        未查找到此书
    </c:if>
</c:if>

<c:if test="${!empty searchBooks}">
<table class="gridtable">
    <th>
    <td>图书编号</td>
    <td>书名</td>
    <td>图书描述</td>
    <td>图书类别</td>
    <td>作者</td>
    <td>出版社</td>
    <td>价格</td>
    <td>总数</td>
    <td>在库数</td>
    </th>
    </c:if>


    <c:forEach items="${searchBooks}" var="book">
        <tr>
            <td></td>
            <td>${book.book_id}</td>
            <td>${book.book_name}</td>
            <td>${book.description}</td>
            <td>${book.book_kind}</td>
            <td>${book.auther}</td>
            <td>${book.publisher}</td>
            <td>${book.price}</td>
            <td>${book.book_num}</td>
            <td>${book.now_num}</td>
        </tr>
        <br/>
    </c:forEach>

    <c:if test="${!empty searchBooks}">
</table>
</c:if>

<%--<a href="/DBM/userbooks" target="_blank">--%>
<%--    <input type="button" value="查询个人借阅信息"/>--%>
<%--</a>--%>

</body>
</html>