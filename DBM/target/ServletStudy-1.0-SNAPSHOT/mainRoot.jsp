<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员主页</title>

    <link rel="stylesheet" href="style/table.css">
</head>
<body>
<%@ include file="/rootheader.jsp" %>
<center>
    <c:if test="${empty allBooks}">
        out.write("没有图书");
    </c:if>


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


        <c:forEach items="${allBooks}" var="rootbook">
            <tr>
                <td></td>
                <td>${rootbook.book_id}</td>
                <td>${rootbook.book_name}</td>
                <td>${rootbook.description}</td>
                <td>${rootbook.book_kind}</td>
                <td>${rootbook.auther}</td>
                <td>${rootbook.publisher}</td>
                <td>${rootbook.price}</td>
                <td>${rootbook.book_num}</td>
                <td>${rootbook.now_num}</td>
            </tr>
            <br />
        </c:forEach>
    </table>

    <form action="/DBM/#" name="delete"  id="id_delete" method="POST">
        <table>
            <tr>
                <th>删除图书的id</th>
                <td><input type="text" name="book_id" placeholder="请输入..." /></td>
                <td>
                    <input type="button" value="删除图书" onclick="Check()" />

                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <a href="newBook.jsp">
                        <input type="button" value="添加图书" />
                    </a>

                </td>
            </tr>
        </table>
    </form>

</center>

</body>
</html>