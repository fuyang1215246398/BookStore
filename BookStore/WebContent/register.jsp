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
<title>注册</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/register.css" />
<style type="text/css">
.error {
	color: red
}

input {
	color: black
}
</style>
<script type="text/javascript">
	$.validator.addMethod("isExist", function(value, element, params) {
		var flag = true;
		$.ajax({
			"async" : false,
			"data" : {
				"username" : value
			},
			"url" : "/BookStore/user?method=checkUsername",
			"dataType" : "json",
			"type" : "POST",
			"success" : function(data) {

				flag = data.isExist;

			}
		});
		return !flag;
	});
	$.validator.addMethod("checkVertifyImg", function(value, element, params) {
		var flag = false;

		$.ajax({
			"async" : false,
			"data" : {
				"method" : "vertifyCode",
				"code" : value
			},
			"url" : "/BookStore/vertify",
			"dataType" : "json",
			"type" : "POST",
			"success" : function(data) {
				flag = data.isequal;
			}
		});
		return flag;
	}

	);

	$(function() {

		$("#myform").validate({
			rules : {
				"username" : {
					"required" : true,
					"isExist" : true
				},
				"password" : {
					"required" : true,
					"rangelength" : [ 6, 12 ]
				},
				"repassword" : {
					"required" : true,
					"rangelength" : [ 6, 12 ],
					"equalTo" : "#password"
				},
				"name" : {
					"required" : true
				},
				"email" : {
					"required" : true,
					"email" : true
				},
				"telephone" : {
					"required" : true
				},
				"vertify" : {
					"checkVertifyImg" : true
				}
			},
			messages : {
				"username" : {
					"required" : "用户名不能为空",
					"isExist" : "用户名已存在"
				},
				"password" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位"

				},
				"repassword" : {
					"required" : "确认密码不能为空",
					"rangelength" : "确认密码长度6-12位",
					"equalTo" : "两次密码不一致"
				},
				"name" : {
					"required" : "姓名不能为空"
				},
				"email" : {
					"required" : "邮箱不能为空",
					"email" : "邮箱格式不正确"
				},
				"telephone" : {
					"required" : "电话不能为空"
				},
				"vertify" : {
					"checkVertifyImg" : "验证码错误"
				}
			}

		});

	});
</script>

</head>
<body style="background: #F9F9F9;">
	<jsp:include page="/head.jsp"></jsp:include>

	<div class="container" style="height: 670px">
		<div class="row" style="height: 100%;">

			<div class="container1" style="width: 100%;">
				<div class="bgPic">
					<img src="img/register/b2_1.jpg" alt="" width="100%" height="620px" />
				</div>
				<div class="register" style="height: 495px;">
					<div class="title" style="padding-left: 5px">
						<span>注册</span> <a href="demo.html">去登录</a>
					</div>
					<!-- /BookStore/user?method=register -->
					<form autocomplete="off" id="myform"
						action="/BookStore/user?method=register" method="post">
						<div class="default">

							<input style="color: black" autocomplete="off" data-form="uname"
								id="username" name="username" type="text" placeholder=" 用户名" />

						</div>
						<div class="default" style="padding-top: 5px">

							<input style="color: black" id="password" name="password"
								data-form="upwd" type="password" placeholder="密码" />

						</div>

						<div class="default" style="padding-top: 7px">

							<input style="color: black" id="repassword" name="repassword"
								data-form="upwd_2" type="password" placeholder="确认密码" />

						</div>
						<div class="default" style="padding-top: 10px">

							<input style="color: black" id="name" name="name" type="text"
								placeholder="姓名" />

						</div>
						<div class="default" style="padding-top: 13px">

							<input style="color: black" id="email" name="email" type="text"
								placeholder="邮箱" />

						</div>
						<div class="default" style="padding-top: 16px">

							<input style="color: black" id="telephone" name="telephone"
								data-form="phone" type="text" placeholder="电话" />

						</div>
						<div class="default" style="padding-top: 19px">

							<input style="color: black; width: 210px;" id="vertify_input"
								name="vertify" type="text" placeholder="验证码" /> <img alt=""
								src="/BookStore/vertify?method=vertifyImg" id="vertify"
								onclick="changeImg('this')"> <label
								id="vertify_input-error" class="error" for="vertify_input"
								style="display: none">验证码错误</label>
						</div>
						<script>
							var i = 0;
							function changeImg(obj) {
								var E = document.getElementById("vertify");
								E.src = "/BookStore/vertify?method=vertifyImg&i="
										+ i;
								i++;
							}
						</script>
						<div class="submit" style="padding-top: 22px">
							<span class="notice">点击"注册"代表您同意遵守 <a href="#">用户协议</a> 和
								<a href="#">隐私条款</a>
							</span>
							<!--  <input type="submit" value="注册"> -->
							<button class="s_hover" data-form="submit">注册</button>
						</div>
					</form>

				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/Footer.jsp"></jsp:include>

</body>

</html>