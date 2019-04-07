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
<title>Bootstrap 101 Template</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.3.1.min.js"></script>

<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/register.css" />

<link rel="stylesheet" href="css/main.css" />
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
	$(function() {

		$("#listform").validate({
			submitHandler : function(form) {
				layer.msg('修改成功');
				setTimeout(function() {
					form.submit();
				}, 1000);

			},
			rules : {
				"email" : {
					"required" : true
				},
				"telephone" : {
					"required" : true
				},
				"name" : {
					"required" : true
				}
			},
			messages : {
				"email" : {
					"required" : "邮箱不能为空！"
				},
				"telephone" : {
					"required" : "收货人电话不能为空！"
				},
				"name" : {
					"required" : "收货人姓名不能为空！"
				}
			}

		});

	});
</script>
<style type="text/css">
label.error {
	padding-top: 10px;
	width: 150px;
	color: red;
	border: 0px
}

th{
background-attachment: scroll;
background-clip: border-box;
background-color: rgb(235, 236, 240);
background-image: none;
background-origin: padding-box;
background-position: 0% 0%;
background-position-x: 0%;
background-position-y: 0%;
background-repeat: repeat;
background-size: auto;
border-bottom-color: rgb(220, 222, 227);
border-bottom-style: solid;
border-bottom-width: 1px;
border-collapse: collapse;
border-image-outset: 0;
border-image-repeat: stretch;
border-image-slice: 100%;
border-image-source: none;
border-image-width: 1;
border-left-color: rgb(220, 222, 227);
border-left-style: solid;
border-left-width: 0px;
border-right-color: rgb(220, 222, 227);
border-right-style: solid;
border-right-width: 1px;
border-spacing: 0px 0px;
border-top-color: rgb(220, 222, 227);
border-top-style: solid;
border-top-width: 0px;
box-sizing: border-box;
color: rgb(51, 51, 51);
font-family: "arial, sans-serifbody tahoma, arial, \"Hiragino Sans GB\", 宋体, sans-serifbody, button, input, select, textarea tahoma,arial,宋体,sans-serifhtml, button, input, select, textarea";
font-feature-settings: normal;
font-kerning: auto;
font-language-override: normal;
font-optical-sizing: auto;
font-size: 12px;
font-size-adjust: none;
font-stretch: 100%;
font-style: normal;
font-variant: normal;
font-variant-alternates: normal;
font-variant-caps: normal;
font-variant-east-asian: normal;
font-variant-ligatures: normal;
font-variant-numeric: normal;
font-variant-position: normal;
font-variation-settings: normal;
font-weight: 400;
line-height: 16px;
margin-bottom: 0px;
margin-left: 0px;
margin-right: 0px;
margin-top: 0px;
padding-bottom: 0px;
padding-left: 0px;
padding-right: 0px;
padding-top: 0px;
text-align: left;
padding:10px;
}
.defultAdd{
background-attachment: scroll;
background-clip: border-box;
background-color: rgb(255, 214, 204);
background-image: none;
background-origin: padding-box;
background-position: 0% 0%;
background-position-x: 0%;
background-position-y: 0%;
background-repeat: repeat;
background-size: auto;
border-bottom-color: rgb(255, 80, 0);
border-bottom-left-radius: 3px;
border-bottom-right-radius: 3px;
border-bottom-style: solid;
border-bottom-width: 1px;
border-collapse: collapse;
border-image-outset: 0;
border-image-repeat: stretch;
border-image-slice: 100%;
border-image-source: none;
border-image-width: 1;
border-left-color: rgb(255, 80, 0);
border-left-style: solid;
border-left-width: 1px;
border-right-color: rgb(255, 80, 0);
border-right-style: solid;
border-right-width: 1px;
border-spacing: 0px 0px;
border-top-color: rgb(255, 80, 0);
border-top-left-radius: 3px;
border-top-right-radius: 3px;
border-top-style: solid;
border-top-width: 1px;
box-sizing: border-box;
color: rgb(255, 51, 0);
display: block;
font-family: "arial, sans-serifbody tahoma, arial, \"Hiragino Sans GB\", 宋体, sans-serifbody, button, input, select, textarea tahoma,arial,宋体,sans-serifhtml, button, input, select, textarea";
font-feature-settings: normal;
font-kerning: auto;
font-language-override: normal;
font-optical-sizing: auto;
font-size: 12px;
font-size-adjust: none;
font-stretch: 100%;
font-style: normal;
font-variant: normal;
font-variant-alternates: normal;
font-variant-caps: normal;
font-variant-east-asian: normal;
font-variant-ligatures: normal;
font-variant-numeric: normal;
font-variant-position: normal;
font-variation-settings: normal;
font-weight: 400;
height: 30px;
line-height: 30px;
margin-bottom: 0px;
margin-left: 0px;
margin-right: 0px;
margin-top: 0px;
padding-bottom: 0px;
padding-left: 0px;
padding-right: 0px;
padding-top: 0px;
text-align: center;
width: 80px;
word-break: break-all;
}
.Caddress{width: 1210px;margin: auto;position: relative;height: 160px;}
			.Caddress .add_mi{height: 106px;float: left;margin-right: 5px; background: url(img/mail_1.jpg) no-repeat;padding: 6px 17px;}
			.Caddress .add_mi p{font-size: 12px;line-height: 20px;margin-bottom: 5px;color: #666;width: 203px;}
</style>
</head>
<body style="background: #F9F9F9;">
	<jsp:include page="/head.jsp"></jsp:include>
	<div class="container" style="position: relative">
		<div class="row" style="padding-top: 0px">
			<img alt="" src="images/bg.jpg" width="100%" height="650px">
		</div>

		<form id="listform" action="/BookStore/user?method=changeInformation"
			method="post">
			<div class="container"
				style="padding-top: 30px; position: absolute; top: 30px; left: 80px; background: white; width: 550px">

				<div class="content">
					<div class="register-box">
						<div class="wrap">
							<div class="register-box-con2">
								<p style="padding-left: 220px;">
									<font size="3px">个人信息</font>
								</p>
								<div class="register-box-con2-box clearfix mar-bottom20"
									style="padding-top: 20px; width: 800px">
									<label class="register-box-con2-box-left"
										style="border: 0px; width: 70px"><em class="bitian"></em>姓名：</label>
									<div class="register-box-con2-box-right" style="width: 600px">
										<input type="text" name="name" id="name"
											class="login-box-cen-form-input w358" placeholder="请输入姓名"
											value="${user.name }" />

									</div>
								</div>
								<div class="register-box-con2-box clearfix mar-bottom20"
									style="width: 800px">
									<label class="register-box-con2-box-left"
										style="border: 0px; width: 70px"><em class="bitian"></em>email：</label>
									<div class="register-box-con2-box-right" style="width: 600px">
										<input type="text" id="email" name="email"
											class="login-box-cen-form-input w358" placeholder="请输入电子邮箱"
											value="${user.email }" />

									</div>
								</div>
								<div class="register-box-con2-box clearfix mar-bottom20"
									style="width: 800px">
									<label class="register-box-con2-box-left"
										style="border: 0px; width: 70px"><em class="bitian"></em>电话：</label>
									<div class="register-box-con2-box-right" style="width: 600px">
										<input type="text" id="telephone" name="telephone"
											class="login-box-cen-form-input w358" placeholder="请输入电话"
											value="${user.telephone }" />

									</div>
								</div>
								<div style="padding-left: 200px; padding-bottom: 10px;">
									<input type="submit"
										style="background: linear-gradient(to bottom, #2ea8e3, #1086d1) !important; display: block; width: 130px; margin-top: 4px; line-height: 38px; outline: none; border: none; text-align: center; border-radius: 3px; background: linear-gradient(to bottom, #0aa1ed, #0088e4); font-size: 16px; color: #fff; cursor: pointer;"
										value="保存修改">
								</div>
								<hr style="width:520px;height: 1px; border: none; border-top: 1px solid #D8D8D8;" />
								<div class="container" style="padding-bottom: 30px;">
								<div class="row" >
									<div style="margin-left:10px;margin-top:5px;padding:8px;background-color: rgb(227, 242, 253);width:500px">
								
									<p style="color:gray"><span class="  glyphicon glyphicon-exclamation-sign "></span>每人最多能保存4条地址信息！</p></div>
									<table id="tableContainer" style="width:500px;margin-left:10px;margin-top:10px;" >
									<colgroup>
									<col style="width: 70px;">
							
									<col style="width: 150px;">
									<col style="width: 100px;">
									<col style="width: 80px;">
									<col style="width: 100px;">
									
									</colgroup>
									<thead>
									<tr style="background-color: rgb(235, 236, 240);">
									<th style="border:1px solid black">
									收货人
									</th>
									<th style="border:1px solid black">
									所在地址
									</th>
									<th style="border:1px solid black">
									电话号码
									</th>
									<th style="border:1px solid black">
									操作
									</th>
									<th style="border:1px solid black">
									<a href="javascript:;" onclick="addAdress()" style="color:red">添加地址</a>
									</th>
									</tr>
									</thead>
									<tbody id="addressContainer">
									<c:forEach items="${addressList }" var="address">
									<tr>
									<td style="padding:11px;border:1px solid rgb(235, 236, 240)">
									${address.name }
									</td>
									<td style="padding:11px;border:1px solid rgb(235, 236, 240)">
									${address.address }
									</td>
									<td style="padding:11px;border:1px solid rgb(235, 236, 240)">
									${address.telephone }
									</td>
									<td style="padding:11px;border:1px solid rgb(235, 236, 240)">
									<a href="javascript:;" onclick="deleteAdd('${address.addinfoid}',this)">删除</a>|
									<a href="javascript:;" onclick="EditAdd('${address.name }','${address.address }','${address.telephone }','${address.addinfoid}')">编辑</a>
									</td>
									<c:if test="${address.isdefault==1 }">
									<td style="padding:11px;border:1px solid rgb(235, 236, 240)">
									<div><span class="defultAdd" >默认地址</span></div>
									</td>
									</c:if>
									<c:if test="${address.isdefault!=1 }">
									<td style="padding:11px;border:1px solid rgb(235, 236, 240)">
									<div><a href="javascript:;" onclick="setDefault('${address.addinfoid}')">设为默认</a></div>
									</td>
									</c:if>
									</tr>
									</c:forEach>
									</tbody>
									</table>
								</div>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>

			</div>

		</form>
	</div>
<script type="text/javascript">
function EditAdd(name,address,telephone,addinfoid){
	layer.open({
		id : 1,
		type : 1,
		title : '编辑地址',
		skin : 'layui-layer-rim',
		area : [ '450px', 'auto' ],

		content : ' <div class="row" style="width: 420px;  margin-left:7px; margin-top:10px;">'
				+ '<div class="col-sm-12">'
				+ '<div class="input-group">'
				+ '<span class="input-group-addon"> 姓名:</span>'
				+ '<input id="receivername" type="text" class="form-control" placeholder="请输入收货人姓名" value="'+name+'">'
				+ '</div>'
				+ '</div>'
				+ '<div class="col-sm-12" style="margin-top: 10px">'
				+ '<div class="input-group">'
				+ '<span class="input-group-addon">电话:</span>'
				+ '<input id="receiverphone" type="text" class="form-control" placeholder="请输入收货人电话号码" value="'+telephone+'">'
				+ '</div>' + '</div>'
				+ '<div class="col-sm-12" style="margin-top: 10px">'
				+ '<div class="input-group">'
				+ '<span class="input-group-addon">地址:</span>'
				+ '<input id="receiveradd" type="text" class="form-control" placeholder="请输入收货人地址" value="'+address+'">'
				+ '</div>' + '</div>' + '</div>',
		btn : [ '保存', '取消' ],
		btn1 : function(index, layero) {
			var name=$("#receivername").val();
			var phone=$("#receiverphone").val();
			var address=$("#receiveradd").val();
		
			if(name==""||phone==""||address==""){
				layer.msg('输入不能为空');
				return;
			}
			if(confirm("您确定修改吗？")){
			
				location.href="/BookStore/address?method=changeAddress&addinfoid="+addinfoid+"&name="+name+"&address="+address+"&telephone="+phone;
				layer.close(index);
			}
			
			
		},
		btn2 : function(index, layero) {
			layer.close(index);
		}

	});
}


function setDefault(addId){
	if(confirm("您确定将它设为默认地址吗？")){
		 window.location.href="/BookStore/address?method=changeDefaultAddress&addinfoid="+addId;
	}
}
function deleteAdd(addId,obj){
	if(confirm("您确定删除吗？")){
	$.ajax({
		type : "POST",
		url : "/BookStore/address?method=deleteAddress",
		data : {
			"addinfoid" : addId
			
		},
		async : true,
		dataType : "text",
		success : function(data) {
			var content="";
			if (data !=null) {
				
				layer.msg('删除成功');
				layer.close(index);

			} else {
				layer.msg('修改失败');

			}
		}

	});
	
	
	$(obj).parent().parent().remove();
	}
}


function addAdress(){
	layer.open({
		id : 1,
		type : 1,
		title : '添加地址',
		skin : 'layui-layer-rim',
		area : [ '450px', 'auto' ],

		content : ' <div class="row" style="width: 420px;  margin-left:7px; margin-top:10px;">'
				+ '<div class="col-sm-12">'
				+ '<div class="input-group">'
				+ '<span class="input-group-addon"> 姓名:</span>'
				+ '<input id="receivername" type="text" class="form-control" placeholder="请输入收货人姓名">'
				+ '</div>'
				+ '</div>'
				+ '<div class="col-sm-12" style="margin-top: 10px">'
				+ '<div class="input-group">'
				+ '<span class="input-group-addon">电话:</span>'
				+ '<input id="receiverphone" type="text" class="form-control" placeholder="请输入收货人电话号码">'
				+ '</div>' + '</div>'
				+ '<div class="col-sm-12" style="margin-top: 10px">'
				+ '<div class="input-group">'
				+ '<span class="input-group-addon">地址:</span>'
				+ '<input id="receiveradd" type="text" class="form-control" placeholder="请输入收货人地址">'
				+ '</div>' + '</div>' + '</div>',
		btn : [ '保存', '取消' ],
		btn1 : function(index, layero) {
			var name=$("#receivername").val();
			var phone=$("#receiverphone").val();
			var address=$("#receiveradd").val();
			
			if(name==""||phone==""||address==""){
				layer.msg('输入不能为空');
				return;
			}
		  var rows=	$("#tableContainer").find("tr").length ;
			if(rows>=5){
				layer.msg('地址信息最多保存4条！');
				return;
			}
			$.ajax({
				type : "POST",
				url : "/BookStore/address?method=addAddress",
				data : {
					"name" : name,
					"phone":phone,
					"address":address
				},
				async : true,
				dataType : "json",
				success : function(data) {
					var content="";
					if (data !=null) {
						content='<tr>'
							+'<td style="padding:11px;border:1px solid rgb(235, 236, 240)">'
						+name
						+'</td>'
						+'<td style="padding:11px;border:1px solid rgb(235, 236, 240)">'
						+address
						+'</td>'
						+'<td style="padding:11px;border:1px solid rgb(235, 236, 240)">'
						+phone
						+'</td>'
						+'<td style="padding:11px;border:1px solid rgb(235, 236, 240)">'
						+'<a href="javascript:;" onclick="deleteAdd(\''+data.addinfoid+'\',this)">删除</a>|'
						+'<a href="javascript:;" onclick="EditAdd(\''+data.name+'\',\''+data.address+'\',\''+data.telephone+'\',\''+data.addinfoid+'\')">编辑</a>'
						+'</td>'
						+'<td style="padding:11px;border:1px solid rgb(235, 236, 240)">'
						+'<div><a href="javascript:;" onclick="setDefault(\''+data.addinfoid+'\')">设为默认</a></div>'
						+'</td>'
						+'</tr>';
						$("#addressContainer").append(content);
						layer.msg('添加成功');
						layer.close(index);

					} else {
						layer.msg('修改失败');

					}
				}

			});
			
			
		},
		btn2 : function(index, layero) {
			layer.close(index);
		}

	});
	
}


</script>
</body>
</html>