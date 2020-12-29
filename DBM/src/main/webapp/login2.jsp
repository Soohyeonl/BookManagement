<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>登录</title>
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
			border-bottom:1px solid black;

		}

		.header h1 {
			font-weight: 400;
		}

		.box {
			margin: 50px auto;
			background-color: #fff;
			width: 410px;
			height: 300px;
			box-shadow: 10px 10px 10px -4px rgba(0, 0, 0, 0.3);
		}

		.box .nav a {
			margin: 0 auto;
			width: 200px;
			height: 80px;
			padding: 27px 0 24px;
			text-align: center;
			font-size: 24px;
			color: #666;
			display: inline-block;
		}
		.box .nav a:hover {
			color: #ff6700;
		}
		.line {
			width: 1px;
			height: 24px;
			border: 1px solid #e0e0e0;
			background: #e0e0e0;
		}


		button {
			background-color: #ff6700;
			/* Green */
			border: none;
			color: white;
			padding: 15px 45px;
			margin-left: 137px;
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

		.box .danxuan {
			margin: 20px 106px;
		}

		.box .danxuan #radio2 {
			margin-left: 40px;
		}
		.input_stu_pwd {
			display: flex;
			justify-content: flex-start;
			margin: 15px;
			height: 35px;
			line-height: 35px;

		}
		.inputinfo {
			display: flex;
			flex-direction: column;
			justify-items: center;
			align-items: center;
		}
		.in {
			width: 250px;
		}
		#login {
			padding-top: 25px;

		}
	</style>
</head>

<body>
<%@ include file="/header.jsp" %>

	<div class="box">
		<form action="/DBM/login" name="fir" id="login" method="POST">
			<div class="inputinfo">
				<div class="input_stu_pwd">
					<span>学号：</span>
					<input class="in" id="us" type="text" name="username" placeholder="请输入学号..." />
				</div>
				<div class="input_stu_pwd">
					<span>密码：</span>
					<input class="in" id="pwd" type="password" name="password" placeholder="请输入密码..." />
				</div>
			</div>
			<div class="danxuan">
				<input type="radio" checked="checked" name="limit" value="user" id="radio1" />
				<label for="radio1">普通用户</label>
				<input type="radio" name="limit" value="root" id="radio2" />
				<label for="radio2">管理员</label>

			</div>
			<div>
				<button onclick="Check()">登录</button>
			</div>

		</form>

	</div>


	<script type="text/javascript">
	var eye = document.getElementById('eye');
	var pwd = document.getElementById('pwd');
	var flag = 0;
	//显示密码明文
	eye.onclick = function(){
		if(flag == 0){
			pwd.type = 'text';
			eye.src = 'images/睁眼.png';
			flag = !flag;
		} else{
			pwd.type = 'password';
			eye.src = 'images/闭眼.png';
			flag = !flag;
		}
		
	}

		function Check() {
			var a = document.fir.us.value
			var b = document.fir.pwd.value
			if (a == "") {
				window.alert("用户名不能为空");
				return false;
			} else if (b == "") {
				window.alert("密码不能为空");
				return false;
			}

			var form = document.getElementById("login");
			form.submit();

		}

	</script>
</body>

</html>