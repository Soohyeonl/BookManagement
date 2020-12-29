<%@ page import="com.mktb.nobug.domain.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mktb.nobug.domain.UserBookShow" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户主页</title>
    <link rel="stylesheet" href="style/table.css">

    <script type="text/javascript">

        function Check() {
            var a = document.borrow.book_id.value
            if(a == "") {
                window.alert("图书id不能为空");
                return false;
            }

            var form = document.getElementById("borrow");
            form.submit();

        }

        function Check1() {
            var b = document.returnb.book_id.value
            if(b == "") {
                window.alert("图书id不能为空");
                return false;
            }

            var form = document.getElementById("returnb");
            form.submit();

        }

    </script>

</head>
<body>
<%@ include file="/header.jsp" %>

<form action="/DBM/borrowBook" name="borrow"  id="borrow" method="POST">
    <table>
        <tr>
            <th>图书id</th>
            <td><input type="text" name="book_id" placeholder="请输入..." /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="button" value="借书" onclick="Check()" />

            </td>
        </tr>
    </table>
</form>

<form action="/DBM/returnBook" name="returnb" id="returnb" method="POST">
    <table>
        <tr>
            <th>图书id</th>
            <td><input type="text" name="book_id" placeholder="请输入..." /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="button" value="还书" onclick="Check1()" />
            </td>
        </tr>
    </table>
</form>

<%--<%--%>
<%--    List<UserBookShow> allBooks =  (List<UserBookShow>)request.getAttribute("allBooks");--%>
<%--    System.out.println(allBooks);--%>
<%--%>--%>

<c:if test="${empty allBooks}">
    out.write("没有图书");
</c:if>


<table class="gridtable">
    <th>
    <td>图书编号</td>
    <td>书名</td>
    <td>借阅时间</td>
    <td>到期时间</td>
    </th>


<c:forEach items="${allBooks}" var="userbook">
        <tr>
            <td></td>
            <td>${userbook.book_id}</td>
            <td>${userbook.book_name}</td>
            <td>${userbook.lend_date}</td>
            <td>${userbook.due_date}</td>
        </tr>
    <br />
</c:forEach>
</table>

<%--<a href="/DBM/userbooks" target="_blank">--%>
<%--    <input type="button" value="查询个人借阅信息"/>--%>
<%--</a>--%>

</body>
</html>