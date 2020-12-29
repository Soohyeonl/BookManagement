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

            if(bookid == "") {
                window.alert("书籍编号不能为空");
                return false;
            } else if(bookname == "") {
                window.alert("书籍名称不能为空");
                return false;
            } else if(price == "") {
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


</head>
<body>

<%@ include file="/rootheader.jsp" %>
<center>
    <form action="/DBM/addBook" id="newbook_form" name="newbook" method="POST">
        <table>
            <tr>
                <th>书籍编号</th>
                <td><input id="bookid" type="text" name="book_id" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <th>书籍名称</th>
                <td><input id="bookname" type="text" name="book_name" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <th>书籍简介</th>
                <td><input id="bookdescription" type="text" name="description" placeholder="请输入..." /></td>
            </tr>

            <tr>
                <th>书籍价格</th>
                <td><input id="bookprice" type="text" name="price" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <th>作者</th>
                <td><input id="auther" type="text" name="auther" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <th>书籍类别</th>
                <td><input id="kind" type="text" name="book_kind" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <th>出版社</th>
                <td><input id="publisher" type="text" name="publisher" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <th>数量</th>
                <td><input id="booknum" type="text" name="book_num" placeholder="请输入..." /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="提交" id="register_button" onclick="Check()" />
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>
    </form>
</center>

</body>
</html>