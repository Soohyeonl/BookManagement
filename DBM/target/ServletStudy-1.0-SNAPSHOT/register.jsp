<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>注册</title>
    <meta charset="UTF-8">

    <script>
        function Check() {
            var a = document.fir.pw.value;
            var b = document.fir.rpw.value;
            var u = document.fir.us.value;
            var t = document.fir.tel.value;
            var name = document.fir.un.value;
            if(a != b) {
                window.alert("两次密码不相同");
                return false;
            } else if(u == "") {
                window.alert("学号不能为空");
                return false;
            } else if(t == "") {
                window.alert("电话不能为空");
                return false;
            } else if (name == "") {
                window.alert("姓名不能为空")
                return false;
            } else if (a == "") {
                window.alert("密码不能为空")
                return false;
            }

            // if(u.length < 4 || u.length > 20) {
            //     window.alert("学号长度不合法");
            //     return false;
            // } else if(pw.length < 6 || pw.length > 20) {
            //     window.alert("密码长度不合法");
            //     return false;
            // } else if(t.length !== 11) {
            //     window.alert("电话号码不合法");
            //     return false;
            // }
            var form = document.getElementById("reg_form");
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

        .header {
            text-align: center;
            background-color: #f9f9f9;
            border-bottom: 1px solid black;
        }

        .header h1 {
            font-weight: 400;
        }

        .box {
            margin: 50px auto;
            background-color: #fff;
            width: 410px;
            height: 520px;
            padding: 20px;
            box-shadow: 10px 10px 10px -4px rgba(0, 0, 0, 0.3);
        }

        .box label {
            width: 80px;
            height: 50px;
            text-align: right;
        }

        .box .nav {
            width: 390px;
            height: 45px;
            text-align: center;
            font-size: 24px;
            color: #666;
            display: inline-block;
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
        .reset:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        span {
            margin-left: 34px;
        }

        .less {
            margin-left: 50px;
        }

        .in {
            height: 6px;
            line-height: 7px;
            padding: 10px 28px 12px 22px;
            margin: 15px 20px 15px 36px;

        }

        .in1 {
            height: 6px;
            line-height: 7px;
            padding: 10px 28px 12px 22px;
            margin: 15px 20px;
        }

        .danxuan {
            margin-left: 55px;
        }
        .op_button {
            display: flex;
            justify-content: space-around;
            padding-left: 35px;
            padding-right: 35px;
        }
    </style>

</head>
<body>
<%@ include file="/header.jsp" %>
<%--<center>--%>
<%--    <form action="/DBM/register" id="reg_form" name="fir" method="POST">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <th>学号</th>--%>
<%--                <td><input id="us" type="text" name="user_id" placeholder="请输入学号..." /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>姓名</th>--%>
<%--                <td><input id="un" type="text" name="user_name" placeholder="请输入姓名..." /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>密码</th>--%>
<%--                <td><input id="pw" type="password" name="user_pwd" placeholder="请输入密码..." /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>重复密码</th>--%>
<%--                <td><input id="rpw" type="password"--%>
<%--                           name="rpassword" placeholder="请再次输入密码..." /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>手机</th>--%>
<%--                <td><input id="tel" type="text" name="user_phone" placeholder="请输入手机号码..." /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>性别</th>--%>
<%--                <td>--%>
<%--                    <label>--%>
<%--                        <input type="radio" name="user_gender" value="男">--%>
<%--                        <span>男👦</span>--%>
<%--                    </label>--%>
<%--                    <label>--%>
<%--                        <input type="radio" checked="checked" name="user_gender" value="女">--%>
<%--                        <span>女👧</span>--%>
<%--                    </label>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td>--%>
<%--                    <input type="button" value="注册" id="register_button" onclick="Check()" />--%>
<%--                    <input type="reset" value="重置" />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td>--%>
<%--                    <a href="login.jsp">--%>
<%--                        <input type="button" value="登录"/>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</center>--%>

<div class="box">
    <div class="nav">
        账号注册
    </div>
    <form action="/DBM/register" id="reg_form" name="fir" method="POST">
        <table>

            <div>
                <span class="less">学号</span>
                <input class="in" id="us" type="text" name="user_id" placeholder="请输入学号..." />
            </div>

            <div>
                <span class="less">姓名</span>
                <input class="in" id="un" type="text" name="user_name" placeholder="请输入姓名..." />
            </div>

            <div>
                <span class="less">密码</span>
                <input class="in" id="pw" type="password" name="user_pwd" placeholder="请输入密码..." />
            </div>

            <div>
                <span>确认密码</span>
                <input class="in1" id="rpw" type="password" name="rpassword" placeholder="请再次输入密码..." />
            </div>

            <div>
                <span>手机号码</span>
                <input class="in1" id="tel" type="text" name="user_phone" placeholder="请输入手机号码..." />
            </div>

            <div>
                <span class="less">性别</span>
                <span class="danxuan">
                        <input type="radio" checked="checked" name="user_gender" value="男" id="radio1">
                        <label for="radio1">男👦</label>
                    </span>
                <span class="danxuan">
                        <input type="radio" name="user_gender" value="女" id="radio2">
                        <label for="radio2">女👧</label>
                    </span>
            </div>
            <div class="op_button">
                <button id="register_button" onclick="Check()">注册</button>
                <input class="reset" type="reset" value="重置" />
            </div>
        </table>

    </form>

</div>
</body>

</html>