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
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">
<script type="text/javascript" src="layer/layer.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	function changeBooKNum(type, bid) {
		var bookNum = $("#bookNum" + bid + "").val();
		var num = parseInt(bookNum);
		if (type == 1)
			num += 1;
		if (type == 2)
			num -= 1;
		if (num > 0)
			$.post("/BookStore/cart?method=changeBookNum", {
				"newNum" : num,
				"bid" : bid
			}, function(data) {

			}, "json"

			);
	}
	function delFromCart(bid) {
		if (confirm("您是否删除该项？")) {
			location.href = "/BookStore/cart?method=delectBookFromCart&bid="
					+ bid;
		}
	}
	function clearAll() {
		if (confirm("您是否要清空购物车？")) {
			location.href = "/BookStore/cart?method=clearAllOfCart";
		}
	}
</script>
</head>
<body style="background: #F9F9F9;">
	<%@include file="/head.jsp"%>
	<div class="container">
		<div class="row" style="text-align: center; padding-bottom: 5px">
			<h3>
				<font size="5px" color="#989898">购物车</font>
			</h3>
		</div>

		<section class="cartMain" style="width: 1140px">
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
					<li class="list_op">操作</li>
				</ul>
			</div>
			<c:forEach items="${cart.cartItem }" var="cartItem">
				<div class="cartBox">
					<div class="order_content" style="background-color: #F0F0F0">
						<ul class="order_lists">
							<li class="list_chk"><input checked="checked"
								type="checkbox" id="checkbox_2" class="son_check"
								style="display: none; top: 50px; left: 10px"></li>
							<li class="list_con">
								<div class="list_img" style="margin-top:10px">
									<a
										href="/BookStore/getBooks?method=infomation&bid=${cartItem.value.book.bid  }"><img
										src="/BookStore${cartItem.value.book.picture }" height="110px"
										width="90px" alt=""></a>
								</div>
								<div class="list_text" align="center">
									<br>
									<br>
									<a
										href="/BookStore/getBooks?method=infomation&bid=${cartItem.value.book.bid  }">${cartItem.value.book.name }</a>
								</div>
							</li>
							<li class="list_info"><br>
							<br>
								<p>分类：${categoryList[cartItem.value.book.cid-1].category}</p>
								<p>作者：${cartItem.value.book.writer }</p></li>
							<li class="list_price"><br>
							<br>
								<p class="price">￥${cartItem.value.book.price }</p></li>
							<li class="list_amount"><br>
							<br>
								<div class="amount_box">

									<a href="javascript:;" class="reduce reSty"
										onclick="changeBooKNum('2','${cartItem.value.book.bid }')">-</a>
									<input type="text"
										onchange="changeBooKNum('3','${cartItem.value.book.bid }')"
										id="bookNum${cartItem.value.book.bid }"
										value="${cartItem.value.num }" class="sum"
										style="width: 40px; height: 23px"> <a
										href="javascript:;"
										onclick="changeBooKNum('1','${cartItem.value.book.bid }')"
										class="plus">+</a>
								</div></li>
							<li class="list_sum"><br>
							<br>
								<p class="sum_price">￥${cartItem.value.subTotal }</p></li>
							<li class="list_op"><br>
							<br>
								<p class="del">
									<a href="javascript:;"
										onclick="delFromCart('${cartItem.value.book.bid }')"><span class=" glyphicon glyphicon-trash"></span>移除商品</a>
								</p></li>
						</ul>

					</div>
				</div>

			</c:forEach>
			<c:if test="${!empty cart.cartItem }">
				<div class="order_content" style="background-color: #F8F8F8">
					<ul class="order_lists">
						<li class="list_chk"></li>
						<li class="list_con"></li>
						<li class="list_info"></li>
						<li class="list_price"></li>
						<li class="list_amount"></li>
						<li class="list_sum"></li>
						<li class="list_op">
							<p class="del">
								<a href="javascript:;" onclick="clearAll()" class="delBtn"
									style="color: #337ab7"><span class=" glyphicon glyphicon-shopping-cart"></span>清空购物车</a>
							</p>
						</li>
					</ul>

				</div>
				<div class="bar-wrapper" style="width: 1140px">
					<div class="bar-right">
						<div class="piece">
							已选商品<strong class="piece_num">${cart.totalNum }</strong>件
						</div>
						<div class="totalMoney">
							共计: <strong class="total_text">￥${cart.totalPrice }&nbsp;&nbsp;&nbsp;</strong>
						</div>
						<div class="calBtn">
							<a class="btn_sty"
								href="${pageContext.request.contextPath}/order?method=submitOrder"><font
								size="3px">去购买</font></a>
						</div>
					</div>
				</div>
			</c:if>
			<!--底部-->

		</section>

	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/carts.js"></script>
</body>
</html>