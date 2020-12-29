<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
	<title>登录</title>

	<script type="text/javascript">

		function Check() {
			var a = document.fir.us.value
			var b = document.fir.pwd.value
			if(a == "") {
				window.alert("用户名不能为空");
				return false;
			} else if(b == "") {
				window.alert("密码不能为空");
				return false;
			}

			var form = document.getElementById("login");
			form.submit();

		}

	</script>
</head>

<body>

<%@ include file="/header.jsp" %>

	<center>
	<form action="/DBM/login" name="fir" id="login" method="POST">
		<table>
			<tr>
				<th>学号</th>
				<td><input id="us" type="text" name="username" placeholder="请输入用户名..." /></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input id="pwd" type="password" name="password" placeholder="请输入密码..." />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				普通用户
				<input type="radio" checked="checked" name="limit" 
				value="user" />
				管理员
				<input type="radio" name="limit" value="root" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="button" value="登录" onclick="Check()" />
					<a href="register.html" target="_blank">
						<input type="button" value="我要注册" />
					</a>
					
				</td>
			</tr>	
		</table>
	</form>
	</center>
</body>
</html>