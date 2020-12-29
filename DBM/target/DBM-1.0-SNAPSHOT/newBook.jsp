<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增书籍</title>

    <script>
        function Check() {
            console.log(1);
            var bookid = document.newbook.book_id.value;
            var bookname = document.newbook.book_name.value;
            var price = document.newbook.price.value;
            var auther = document.newbook.auther.value;
            var kind = document.newbook.book_kind.value;
            var publisher = document.newbook.publisher.value;
            var booknum = document.newbook.book_num.value;
            var bookdescription = document.newbook.description.value;

            if (bookid == "") {
                window.alert("书籍编号不能为空");
                return false;
            } else if (bookname == "") {
                window.alert("书籍名称不能为空");
                return false;
            } else if (price == "") {
                window.alert("价格不能为空");
                return false;
            } else if (auther == "") {
                window.alert("作者不能为空")
                return false;
            } else if (kind == "") {
                window.alert("类别不能为空")
                return false;
            } else if (publisher == "") {
                window.alert("出版社不能为空")
                return false;
            } else if (booknum == "") {
                window.alert("书籍数量不能为空")
                return false;
            } else if (bookdescription == "") {
                window.alert("书籍数量不能为空")
                return false;
            }

            var form = document.getElementById("newbook_form");
            form.submit();
            return true;
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

        .box {
            margin: 50px auto;
            background-color: #fff;
            width: 800px;
            height: 630px;
            padding: 20px;
            border-radius: 30px;
            /* box-shadow: 10px 10px 10px -4px rgba(0, 0, 0, 0.3); */
        }

        .head {
            border-bottom: 1px solid black;
            padding-bottom: 10px;
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

        .word4 {
            margin-left: 30px;
        }

        .word2 {
            margin-left: 62px;
        }

        .word3 {
            margin-left: 46px;
        }

        form div {
            margin-top: 25px;
        }

        button {
            background-color: #ff6700;
            /* Green */
            border: none;
            color: white;
            padding: 15px 45px;
            margin-left: 8px;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 30px;
        }

        button:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .reset {
            background-color: whitesmoke;
            /* Green */
            border: none;
            color: black;
            padding: 15px 45px;
            margin-left: 440px;
            margin-right: 10px;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 30px;
        }

        .reset:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

    </style>

</head>
<body>

<%@ include file="/rootheader.jsp" %>
<div class="box">
    <%--    <form action="/DBM/addBook" id="newbook_form" name="newbook" method="POST">--%>
    <%--        <table>--%>
    <%--            <tr>--%>
    <%--                <th>书籍编号</th>--%>
    <%--                <td><input id="bookid" type="text" name="book_id" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <th>书籍名称</th>--%>
    <%--                <td><input id="bookname" type="text" name="book_name" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <th>书籍简介</th>--%>
    <%--                <td><input id="bookdescription" type="text" name="description" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>

    <%--            <tr>--%>
    <%--                <th>书籍价格</th>--%>
    <%--                <td><input id="bookprice" type="text" name="price" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <th>作者</th>--%>
    <%--                <td><input id="auther" type="text" name="auther" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <th>书籍类别</th>--%>
    <%--                <td><input id="kind" type="text" name="book_kind" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <th>出版社</th>--%>
    <%--                <td><input id="publisher" type="text" name="publisher" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <th>数量</th>--%>
    <%--                <td><input id="booknum" type="text" name="book_num" placeholder="请输入..." /></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <td></td>--%>
    <%--                <td>--%>
    <%--                    <input type="button" value="提交" id="register_button" onclick="Check()" />--%>
    <%--                    <input type="reset" value="重置" />--%>
    <%--                </td>--%>
    <%--            </tr>--%>
    <%--        </table>--%>
    <%--    </form>--%>

    <div class="head">
        <h4>新增书籍</h4>
    </div>

    <form action="/DBM/addBook" id="newbook_form" name="newbook" method="POST">
        <div>
            <span class="word4">书籍编号</span>
            <input class="in" id="bookid" type="text" name="book_id" placeholder="请输入..."/></td>
        </div>
        <div>
            <span class="word4">书籍名称</span>
            <input class="in" id="bookname" type="text" name="book_name" placeholder="请输入..."/></td>
        </div>
        <div>
            <span class="word4">书籍简介</span>
            <input class="in" id="bookdescription" type="text" name="description" placeholder="请输入..."/></td>
        </div>

        <div>
            <span class="word4">书籍价格</span>
            <input class="in" id="bookprice" type="text" name="price" placeholder="请输入..."/></td>
        </div>
        <div>
            <span class="word2">作者</span>
            <input class="in" id="auther" type="text" name="auther" placeholder="请输入..."/></td>
        </div>
        <div>
            <span class="word4">书籍类别</span>
            <input class="in" id="kind" type="text" name="book_kind" placeholder="请输入..."/></td>
        </div>
        <div>
            <span class="word3">出版社</span>
            <input class="in" id="publisher" type="text" name="publisher" placeholder="请输入..."/></td>
        </div>
        <div>
            <span class="word2">数量</span>
            <input class="in" id="booknum" type="text" name="book_num" placeholder="请输入..."/></td>
        </div>
        <div>
            <input class="reset" type="reset" value="重置"/>
            <button id="register_button" onclick="Check()">提交</button>


        </div>
    </form>
</div>

</body>
</html>