<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员主页</title>

    <link rel="stylesheet" href="style/table.css">

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
            background-color: #f8f8f9;
        }

        .box table {
            margin: 50px auto;
            width: 70%;
        }

        table td {
            text-align: center;
            border-color: lavenderblush !important;
        }

        th {
            background-color: #f8f8f9 !important;
            border: 1px solid #e9eaec !important;
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
            margin-left: -112px;
            margin-right: 19px;
        }

        button {
            background-color: red;
            border: none;
            color: white;
            padding: 13px 7px;
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
            width: 80%;
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

<script>
    function Check() {
        var a = document.delete.book_id.value;
        if (a == "") {
            window.alert("图书id不能为空");
            return false;
        }
        var form = document.getElementById("id_delete");
        form.submit();
        return true;
    }
</script>

<body>
<%@ include file="/rootheader.jsp" %>

<c:if test="${empty allBooks}">
    out.write("没有图书");
</c:if>

<div class="box">


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
            <br/>
        </c:forEach>
    </table>


    <div class="delete">
        <form action="/DBM/deleteBook" name="delete" id="id_delete" method="POST">

            <span class="">删除图书的id</span>
            <input class="in" type="text" name="book_id" placeholder="请输入..."/>
            <div>
                <button type="button" name="deletebutton" onclick="Check()">删除图书</button>
                <a href="newBook.jsp">
                    <button type="button" class="add" onclick="">添加图书</button>
                </a>
            </div>
        </form>
    </div>

</div>

<%--    <form action="/DBM/deleteBook" name="delete"  id="id_delete" method="POST">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <th>删除图书的id</th>--%>
<%--                <td><input type="text" name="book_id" placeholder="请输入..." /></td>--%>
<%--                <td>--%>
<%--                    <input type="button" name="deletebutton" value="删除图书" onclick="Check()" />--%>

<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td>--%>
<%--                    <a href="newBook.jsp">--%>
<%--                        <input type="button" value="添加图书" />--%>
<%--                    </a>--%>

<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>


</body>
</html>