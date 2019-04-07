<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>登录</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/login.css" />

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/register.css" />
<style type="text/css">
#vertify_input {
	width: 385px
}
</style>
<script>
	var i = 0;
	function changeImg(obj) {
		var E = document.getElementById("vertify");
		E.src = "/BookStore/vertify?" + i;
		i++;
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#myform")
				.submit(
						function() {
							var username = $("#uname").val();
							var password = $("#upwd").val();
							var autoLogin = $("#autoLogin").val();
							var flag = false;
							if (username == "") {
								$("#showMessage").html("用户名不能为空");
								return false;
							}
							if (password == "") {
								$("#showMessage").html("密码不能为空");
								return false;
							}
							$
									.ajax({
										type : "POST",
										url : "/BookStore/user?method=login",
										data : {
											"username" : username,
											"password" : password,
											"autoLogin" : autoLogin
										},
										async : true,
										dataType : "text",
										success : function(data) {

											if (data == "1") {
												location = "/BookStore/getBooks?method=bookofHotandNew";
											} else {
												$("#showMessage").html(
														"用户名或者密码错误");

											}
										}
									});

							return false;
						});

	});
</script>
</head>
<body style="background: #F9F9F9;">
	<%@include file="/head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="container1" style="width: 100%;">
				<div class="bgPic">
					<img src="img/register/b3_1.jpg" width="100%" height="600px" alt="" />
				</div>
				<div class="register" style="height: 400px;">
					<div class="title">
						<span>登录</span> <a href="register.html">去注册</a>
					</div>
					<form id="myform" autocomplete="off">
						<div class="default">
							<p>请输入用户名或手机号码</p>
							<input id="uname" name="username" data-form="uname" type="text"
								placeholder="请输入用户名" />

						</div>
						<div class="default">
							<p>请输入账号密码</p>
							<input id="upwd" name="password" data-form="upwd" type="password"
								placeholder="请输入密码" />

						</div>

						<div class="default">

							<div class="checkbox">

								<label> <input type="checkbox" id="autoLogin"
									name="autoLogin" value="autoLogin"> 自动登录
								</label>

								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<font color="red" id="showMessage"></font>
							</div>
						</div>
						<div class="submit">
							<span class="notice"> <a href="#">忘记密码</a>
							</span>

							<button class="s_hover" data-form="submit">登录</button>
						</div>
					</form>
					<div class="other_login">
						<div class="log">
							<span>社交账号登录</span>
						</div>
						<div class="icon">
							<ul>
								<li data-log="icon" class="i_hover"><img data-icon="wx"
									src="img/register/wx.png" alt="" /> <span class="prompt">微信登录</span>
								</li>
								<li data-log="icon" class="i_hover"><img data-icon="qq"
									src="img/register/qq.png" alt="" /> <span class="prompt">QQ登录</span>
								</li>
								<li data-log="icon" class="i_hover"><img data-icon="wb"
									src="img/register/wb.png" alt="" /> <span class="prompt">微博登录</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<%@include file="/Footer.jsp"%>
</body>
</html>