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
						layer.msg('取消成功');
						setTimeout(function() {
							location = "/BookStore/order?method=showAllOrder";
						}, 800);

					} else {
						layer.msg('取消失败');

					}
				}
			});
		}
	}
</script>
<style type="text/css">
a:link {
	color: #000000;
	text-decoration: none;
}

a:visited {
	color: #000000;
	text-decoration: none;
}

a:hover {
	color: #999999;
	text-decoration: underline;
}
</style>
</head>
<body style="background: #F9F9F9;">
	<jsp:include page="/head.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="text-align: center; padding-bottom: 5px">
			<h3>
				<font size="5px" color="#989898">个人订单</font>
			</h3>
		</div>
		<br>
		<section class="cartMain" style="width: 1000px; padding-bottom: 50px">
			<div class="cartMain_hd" style="background-color: #FFFFCC">
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
			<c:forEach items="${orderList }" var="order">
				<!--orderList  -->
				<div class="cartMain_hd" style="background-color: #B8B8B8">

					<p style="padding-left: 50px; pddding-bottom: 5px;">
						<font size="4px"> 订单编号:${order.oid }&nbsp;&nbsp;
							下单时间：${order.ordertime } &nbsp;&nbsp;&nbsp; <c:if
								test="${order.state==0 }">
								<a
									href="/BookStore/order?method=payForTheUnpayed&oid=${order.oid }"><font
									color="#FF6600">未付款,去付款</font></a>&nbsp; 
       <a href="javascript:;" onclick="deleteOrder('${order.oid}')">
									<font size="2px">删除订单</font>
								</a>
							</c:if> <c:if test="${order.state!=0 }">
   &nbsp;    已付款
       </c:if>

						</font>
					</p>

				</div>
				<c:forEach items="${order.orderItems}" var="orderItem">
					<div class="cartBox" style="margin-bottom: 0px">
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

			</c:forEach>
		</section>
	</div>
</body>
</html>