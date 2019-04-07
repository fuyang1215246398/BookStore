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


<link rel="stylesheet" href="css/main.css" />
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
	$(function() {

		$("#listform").validate({
			submitHandler : function(form) {
				var ii = layer.load();
				var time = setTimeout(function() {
					layer.close(ii);
				}, 2000);
				setTimeout(function() {
					form.submit();
				}, 2000);
			},
			rules : {
				"address" : {
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
				"address" : {
					"required" : "收货人地址不能为空！"
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
.Caddress{width: 1210px;margin: auto;position: relative;height: 160px;}
			.Caddress .add_mi{height: 106px;float: left;margin-right: 5px; padding: 6px 17px;}
			.Caddress .add_mi p{font-size: 12px;line-height: 20px;margin-bottom: 5px;color: #666;width: 203px;}
</style>
</head>
<body style="background: #F9F9F9;">
	<jsp:include page="/head.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="text-align: center; padding-bottom: 20px">
			<h3>
				<font size="5px" color="#989898">提交订单</font>
			</h3>
		</div>
		<p style="padding-left: 77px; pddding-bottom: 5px">
			<font size="4px"> 订单编号:${order.oid }</font>
		</p>
		<br>
		<section class="cartMain" style="width: 1000px; padding-bottom: 50px">


			<div class="cartMain_hd" style="background-color: #B8B8B8">
				<ul class="order_lists cartTop">

					<li class="list_chk" align="center">
						<!--所有商品全选--> <input checked="checked" type="checkbox" id="all"
						class="whole_check" style="display: none; top: 15px; left: 10px">

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片
					</li>
					<li class="list_con">商品信息</li>
					<li class="list_info">商品参数</li>
					<li class="list_price">单价</li>
					<li class="list_amount">数量</li>
					<li class="list_sum">金额</li>

				</ul>
			</div>
			<c:forEach items="${order.orderItems }" var="orderItem">
				<div class="cartBox">
					<div class="order_content" style="background-color: #F0F0F0">
						<ul class="order_lists">
							<li class="list_chk"><input checked="checked"
								type="checkbox" id="checkbox_2" class="son_check"
								style="display: none; top: 50px; left: 10px"></li>
							<li class="list_con">
								<div class="list_img" style="margin-top:10px">
									<a
										href="/BookStore/getBooks?method=infomation&bid=${orderItem.book.bid  }"><img
										src="/BookStore${orderItem.book.picture }" height="110px"
										width="90px" alt=""></a>
								</div>
								<div class="list_text" align="center">
									<br>
									<br>
									<a
										href="/BookStore/getBooks?method=infomation&bid=${orderItem.book.bid  }">${orderItem.book.name }</a>
								</div>
							</li>
							<li class="list_info"><br>
							<br>
								<p>分类：${categoryList[orderItem.book.cid-1].category}</p>
								<p>作者：${orderItem.book.writer }</p></li>
							<li class="list_price"><br>
							<br>
								<p class="price">￥${orderItem.book.price }</p></li>
							<li class="list_amount"><br>
							<br>
								<div class="amount_box">

									<p>&nbsp;&nbsp;${orderItem.count }</p>

								</div></li>
							<li class="list_sum"><br>
							<br>
								<p class="sum_price">￥${orderItem.subtotal }</p></li>

						</ul>

					</div>
				</div>

			</c:forEach>
			<div class="totalMoney" style="float: right">
				<font size="4px" color="#ff0000"><font color="black">共计:</font>
					<strong class="total_text">￥${order.totalprice }</strong></font>
			</div>

		</section>
		<hr style="height: 1px; border: none; border-top: 1px solid #D8D8D8;" />
	</div>
	<c:if test="${empty addressList }">
	<div class="container"  style="padding-left:100px;margin-top:10px">
	<p>
	<a href="/BookStore/address?method=getAddress"><font color="red" size="4px"> 暂无地址，赶紧去设置地址吧！</font></a>
	</p>
	</div>
	</c:if>
	<c:if test="${!empty addressList }">
	<div class="container"  >
	<div class="row" style="padding-left:100px">
	<p style="margin-top:10px"><font size="4px">收货地址：</font></p>
	<div class="Caddress">
			<c:forEach items="${addressList }" var="address">
			<c:if test="${address.isdefault==1 }">
			<div class="add_mi" onclick="setAddress('${address.name }','${address.address }','${address.telephone }',this)" style="cursor:pointer;margin-top:10px;margin-right:20px;background: url(img/mail_1.jpg) no-repeat;">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">${address.name }(收)</p>
				<p>${address.address } ${address.telephone }</p>
			</div>
			</c:if>
			<c:if test="${address.isdefault!=1 }">
			<div class="add_mi" onclick="setAddress('${address.name }','${address.address }','${address.telephone }',this)" style="cursor:pointer;margin-top:10px;margin-right:20px;background: url(img/mail.jpg) no-repeat;">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">${address.name }(收)</p>
				<p>${address.address } ${address.telephone }</p>
			</div>
			</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
	</c:if>
	<script type="text/javascript">
	function setAddress(name,address,telephone,obj){
		
		$(".add_mi").css("background","url(img/mail.jpg) no-repeat");
	$(obj).css("background","url(img/mail_1.jpg) no-repeat");
	$("#address").val(address);
	$("#name").val(name);
	$("#telephone").val(telephone);
	}
	
	</script>
	<form id="listform" action="/BookStore/order?method=confirmOrder"
		method="post">
		<div class="container" style="padding-top: 30px">
			<div class="content">
				<div class="register-box">
					<div class="wrap">
						<div class="register-box-con2">
							<p style="padding-left: 90px">
								<font size="3px">请填写收货人信息：</font>
							</p>
							<div class="register-box-con2-box clearfix mar-bottom20"
								style="padding-top: 20px; width: 800px">
								<label class="register-box-con2-box-left"
									style="border: 0px; width: 150px"><em class="bitian"></em>地址：</label>
								<div class="register-box-con2-box-right" style="width: 600px">
									<input type="text" name="address" id="address"
										class="login-box-cen-form-input w358" placeholder="请输入收货人地址" value="${addressList[0].address }" />

								</div>
							</div>
							<div class="register-box-con2-box clearfix mar-bottom20"
								style="width: 800px">
								<label class="register-box-con2-box-left"
									style="border: 0px; width: 150px"><em class="bitian"></em>收货人：</label>
								<div class="register-box-con2-box-right" style="width: 600px">
									<input type="text" id="name" name="name"
										class="login-box-cen-form-input w358" placeholder="请输入收货人姓名" value="${addressList[0].name }"/>

								</div>
							</div>
							<div class="register-box-con2-box clearfix mar-bottom20"
								style="width: 800px">
								<label class="register-box-con2-box-left"
									style="border: 0px; width: 150px"><em class="bitian"></em>电话：</label>
								<div class="register-box-con2-box-right" style="width: 600px">
									<input type="text" id="telephone" name="telephone"
										class="login-box-cen-form-input w358" placeholder="请输入收货人电话" value="${addressList[0].telephone }" />

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="container">
		<hr style="height: 1px; border: none; border-top: 1px solid #D8D8D8;" />
		</div>
		
		<div class="container" style="padding-top: 20px; padding-bottom: 50px">
		
			<div style="float: right; padding-right: 75px">
				<a href="javascript:;" onclick="deleteOrder('${order.oid}')"><font
					size="3px">取消订单</font></a> &nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-danger"
					style="background-color: #FF6600; border-color: #FF6600;">提交订单</button>

			</div>
		</div>
	</form>
	<script type="text/javascript">
		function deleteOrder(oid) {
			if (confirm("您确定取消订单吗？")) {

				$.ajax({
					type : "POST",
					url : "/BookStore/order?method=deleteOrder",
					data : {
						"oid" : oid
					},
					async : true,
					dataType : "text",
					success : function(data) {

						if (data == "1") {
							layer.msg('取消成功，将返回购物车页面');
							setTimeout(function() {
								location = "/BookStore/cart.jsp";
							}, 1000);

						} else {
							layer.msg('取消失败');

						}
					}
				});
			}
		}
	</script>
</body>
</html>