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
<title>扶杨书城首页</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<style type="text/css">
</style>
</head>
<body style="background: #F9F9F9;">
	<%@include file="/head.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="">
				<table class="table table-striped table-hover" cellpadding=""
					height="350px">
					<c:forEach begin="1" end="6" var="i">
						<tr>
							<td class="table-hover"><a
								href="/BookStore/getBooks?cid=${i*2-1 }&method=category"><img
									src="img/logo${i*2-1 }.png" width="30px" height="30px"><font
									size="3px" color="">${categoryList[i*2-2].category}</font></a></td>
							<td><a
								href="/BookStore/getBooks?cid=${i*2 }&method=category"><img
									src="img/logo${i*2 }.png" width="30px" height="30px"><font
									size="3px" color="">${categoryList[i*2-1].category}</font></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-lg-8">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active" style="height: 350px;">
							<img src="img/book1.jpg" alt="..." class="img-responsive"
								height="100% " width="100%">
							<div class="carousel-caption"></div>
						</div>
						<div class="item" style="height: 350px;">
							<img src="img/book2.jpg" class="img-responsive" alt="..."
								height="100% " width="100%">
							<div class="carousel-caption"></div>

						</div>
						<div class="item" style="height: 350px;">
							<img src="img/book3.jpg" class="img-responsive" alt="..."
								height="100% " width="100%">
							<div class="carousel-caption"></div>

						</div>

					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

			</div>
			<div class="col-lg-2" class="list-group" style="height: 350px;">
				<a href="#" class="list-group-item active"
					style="background: #ADADAD; text-align: center;"> 最新资讯 </a> <a
					href="#" class="list-group-item">[资讯] 忘语新书发售</a> <a href="#"
					class="list-group-item">[资讯] 会员将打九折</a> <a href="#"
					class="list-group-item">[公告] 举报违规有奖励</a> <a href="#"
					class="list-group-item">[公告] 账号安全提示</a> <a href="#"
					class="list-group-item">[公告] 合同审核会员招聘</a> <a href="#"
					class="list-group-item">[公告] 现在加入作家有奖</a>

			</div>
		</div>
	</div>
	<div class="container" id="hotBook">
		<div class="row">
			<span style="font-size: 30px;">热门作品&nbsp&nbsp&nbsp</span> <img
				src="img/1.jpg" style="padding-bottom: 15px;">
		</div>
		<div class="row">
			<div class="col-lg-3  list-group">
				<a href="#" class="list-group-item " style="text-align: center;">
					<b>全部</b>
				</a>
				<c:forEach items="${bookofAllHot }" var="book">
					<a href="/BookStore/getBooks?method=infomation&bid=${book.bid }"
						class="list-group-item">[${categoryList[book.cid-1].category}]
						&nbsp;${book.name}</a>
				</c:forEach>
			</div>
			<!-- items="${ hotBookListofCategory}" -->
			<c:forEach begin="1" end="6" var="i">
				<div class="col-lg-3  list-group">
					<a href="#" class="list-group-item" style="text-align: center;">
						<b>${categoryList[i*2-2].category}·${categoryList[i*2-1].category}</b>
					</a>
					<c:forEach items="${hotBookListofCategory[i-1] }" var="book">
						<a href="/BookStore/getBooks?method=infomation&bid=${book.bid }"
							class="list-group-item">[${categoryList[book.cid-1].category}]
							${book.name}</a>
					</c:forEach>
				</div>
			</c:forEach>
			<div class="">
				<a href=""><img src="img/ad.jpg" width="100%"></a>
			</div>
			<br>
		</div>
	</div>
	<div class="container" id="newBook">
		<div class="row">
			<span style="font-size: 30px;">新书推荐&nbsp&nbsp&nbsp</span> <img
				src="img/1.jpg" style="padding-bottom: 15px;">
		</div>
		<div class="row">
			<div class="col-lg-3  list-group">
				<a href="#" class="list-group-item " style="text-align: center;">
					<b>全部</b>
				</a>
				<c:forEach items="${bookListOfNew}" var="book">
					<a href="/BookStore/getBooks?method=infomation&bid=${book.bid }"
						class="list-group-item">[${categoryList[book.cid-1].category}]
						&nbsp;${book.name }</a>
					</span>
				</c:forEach>
			</div>
			<c:forEach begin="1" end="6" var="i">
				<div class="col-lg-3  list-group">
					<a href="#" class="list-group-item" style="text-align: center;">
						<b>${categoryList[i*2-2].category}·${categoryList[i*2-1].category}</b>
					</a>
					<c:forEach items="${newBookListofCategory[i-1] }" var="book">
						<a href="/BookStore/getBooks?method=infomation&bid=${book.bid }"
							class="list-group-item">[${categoryList[book.cid-1].category}]
							${book.name}</a>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<a href=""><img src="img/ad2.jpg" width="100%"></a>
		</div>
	</div>
	</div>

	<br>
	<%@include file="/Footer.jsp"%>>
</body>
</html>