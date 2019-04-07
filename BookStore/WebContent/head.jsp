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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/comment.css">
<script type="text/javascript" src="js/jquery.flexText.js"></script>
<script type="text/javascript">
	function overFn(obj) {
		$(obj).css("background", "#DBEAF9");

	}
	function outFn(obj) {
		$(obj).css("background", "white");

	}
	function clickFn(obj) {
		$("#searchBook").val($(obj).html());
		$("#showDiv").css("display", "none");

	}
	function hidethis(){
		$("#showDiv").css("display", "none");
	}
	
	/*ajax进行搜索数据库的匹配的书名框的提示*/
	function search(obj) {
		var word = $(obj).val();

		$
				.post(
						"/BookStore/getBooks?method=word",
						{
							"word" : word
						},
						function(data) {
							var content = "";
							if (data.length > 0) {
								for (var i = 0; i < data.length; i++) {
									content += "<div  style='cursor:pointer;padding:5px;' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)'>"
											+ data[i] + "</div>";
								}
								$("#showDiv").html(content);
								$("#showDiv").css("display", "block");
							} else {
								$("#showDiv").css("display", "none");
							}
						}, "json"

				);
	}
</script>
<script type="text/javascript">
	$(function() {
		/*获得书的 类别*/
		$
				.post(
						"/BookStore//getCategory",
						function(data) {
							var content = "";
							for (var i = 0; i < data.length; i++) {
								content += "<li> <a href='/BookStore/getBooks?cid="
										+ data[i].cid
										+ "&method=category'><img src='img/logo"
										+ (i + 1)
										+ ".png' width='30px'height='30px'><font size='3px' color=''>"
										+ data[i].category
										+ "&nbsp;</font></a></li>";

							}
							$("#liContainer").html(content);
						}, "json");

	});
</script>
<style type="text/css">
#welcome {
	font: 12px/1 Tahoma, Helvetica, Arial, "宋体", sans-serif;
	font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
	font-style: normal;
	font-variant-caps: normal;
	font-weight: normal;
	font-stretch: normal;
	font-size: 12px;
	line-height: 1;
	font-family: Tahoma, Helvetica, Arial, "宋体", sans-serif;
	font-size-adjust: none;
	font-kerning: auto;
	font-optical-sizing: auto;
	font-variant-alternates: normal;
	font-variant-east-asian: normal;
	font-variant-ligatures: normal;
	font-variant-numeric: normal;
	font-variant-position: normal;
	font-language-override: normal;
	font-feature-settings: normal;
	font-variation-settings: normal;
}
</style>
</head>
<body style="background: #F9F9F9;">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-xs-6">
				<img src="img/logo.jpg" width="270px" height="70px">
			</div>
			<div class="col-lg-5 col-md-4 hidden-xs">
				<img src="img/header.png" width="350px" height="70px">
			</div>
			<div class="col-lg-3 col-md-4 col-xs-6" id="welcome"
				style="padding-top: 30px; position: relative">
				<c:if test="${empty user }">
					<a href="/BookStore/login.jsp" style="color: #337ab7;"><span class="glyphicon glyphicon-user"></span>登录</a>
					&nbsp;&nbsp;&nbsp;
					<a href="/BookStore/register.jsp" style="color: #337ab7;"><span class=" glyphicon glyphicon-pencil"></span>注册</a>
					&nbsp;&nbsp;&nbsp;
					<a href="/BookStore/cart.jsp" style="color: #337ab7;"><span class=" glyphicon glyphicon-shopping-cart"></span>购物车</a>
				</c:if>
				<c:if test="${!empty user }">
					
					<div class="btn-group">
						<button class="btn btn-default btn-sm dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
						<span class="glyphicon glyphicon-user"></span>	${user.username } <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="/BookStore/address?method=getAddress"><span class="glyphicon glyphicon-user"></span>个人资料</a></li>
							<li><a href="javascript:;" onclick="changePassword()"><span class=" glyphicon glyphicon-copyright-mark"></span>修改密码</a></li>

							<li><a href="/BookStore/order?method=showAllOrder"><span class=" glyphicon glyphicon-list-alt"></span>查看订单</a></li>
							<li><a href="/BookStore/user?method=logout"><span class=" glyphicon glyphicon-remove-circle"></span>注销</a></li>
						</ul>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:;" onmouseover="showMessages()"
						style="color: #337ab7;"><span class=" glyphicon glyphicon-comment "></span> 查看消息</a>

					<!-- <a href="/BookStore/user?method=logout" style="color:#337ab7;">注销</a> -->
					&nbsp;&nbsp;&nbsp;
					<a href="/BookStore/cart.jsp" style="color: #337ab7;"><span class=" glyphicon glyphicon-shopping-cart "></span>购物车</a>
				</c:if>
				<div onmouseleave="hideDiv()" id="messageBox"
					style="margin-left: 60px; display: none; position: absolute; background: #fff; width: 200px; z-index: 1000;"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function showAllMessages(){
		var content = "";
		$.ajax({
					type : "POST",
					url : "/BookStore/comment?method=showAllMessage",
					async : false,
					dataType : "json",
					success : function(data) {
						if(data.length==0){
							content+="<div  style='cursor:pointer;padding:10px;'><span style='font-size: 12px;color: #8b8b8b'>暂时没有收到消息</span></div>";
							$("#messageBox").html(content);
							$("#messageBox").css("display", "block");
						}
						if (data.length!=0) {
							for (var i = 0; i < data.length; i++) {
								content += "<div  style='cursor:pointer;padding:10px;' onclick='showComment("
										+ data[i].blt_comment
										+ ","
										+ data[i].bid
										+ ")' onmouseover='overFn(this)' onmouseout='outFn(this)'>"
										+ "<a><span style='font-size: 12px;color:#339b53'>"
										+ data[i].commentOwner.username
										+ "</a></span>"
										+ "回复了你：<span style='font-size: 12px;color: #8b8b8b'>"
										+ data[i].content + "</span></div>";
								
							}
							$("#messageBox").html(content);
							$("#messageBox").css("display", "block");
						}
					}
				});
	}
	
	
		/*隐藏消息的div*/
		function hideDiv() {
			$("#messageBox").css("display", "none");
		}
		/*ajax获得别人回复我的消息*/
		function showMessages() {

			var content = "";
			$.ajax({
						type : "POST",
						url : "/BookStore/comment?method=showMessage",
						async : false,
						dataType : "json",
						success : function(data) {
							if(data.length==0){
								content+="<div  style='cursor:pointer;padding:10px;'><span style='font-size: 12px;color: #8b8b8b'>暂时没有收到消息</span></div>";
								$("#messageBox").html(content);
								$("#messageBox").css("display", "block");
							}
							if (data.length!=0) {
								for (var i = 0; i < data.length; i++) {
									content += "<div  style='cursor:pointer;padding:10px;' onclick='showComment("
											+ data[i].blt_comment
											+ ","
											+ data[i].bid
											+ ")' onmouseover='overFn(this)' onmouseout='outFn(this)'>"
											+ "<a><span style='font-size: 12px;color:#339b53'>"
											+ data[i].commentOwner.username
											+ "</a></span>"
											+ "回复了你：<span style='font-size: 12px;color: #8b8b8b'>"
											+ data[i].content + "</span></div>";
									
								}
								content+="<div onclick='showAllMessages()' style='cursor:pointer;padding:10px;text-align:center;background-color: 	#F0F0F0'  onmouseover='overFn(this)' onmouseout='outFn(this)'> <span style='font-size: 12px;color:black'>查看所有消息<span class='glyphicon glyphicon-menu-right'></span><span class='glyphicon glyphicon-menu-right'></span></span></div>";
								$("#messageBox").html(content);
								$("#messageBox").css("display", "block");
							}
						}
					});

		}

		function changePassword() {
			layer.open({
						id : 1,
						type : 1,
						title : '修改密码',
						skin : 'layui-layer-rim',
						area : [ '450px', 'auto' ],

						content : ' <div class="row" style="width: 420px;  margin-left:7px; margin-top:10px;">'
								+ '<div class="col-sm-12">'
								+ '<div class="input-group">'
								+ '<span class="input-group-addon"> 新 密 码   :</span>'
								+ '<input id="firstpwd" type="password" class="form-control" placeholder="请输入密码">'
								+ '</div>'
								+ '</div>'
								+ '<div class="col-sm-12" style="margin-top: 10px">'
								+ '<div class="input-group">'
								+ '<span class="input-group-addon">确认密码:</span>'
								+ '<input id="secondpwd" type="password" class="form-control" placeholder="请再输入一次密码">'
								+ '</div>' + '</div>' + '</div>',
						btn : [ '保存', '取消' ],
						btn1 : function(index, layero) {
							var newpassword = $("#firstpwd").val();
							var newpassword1 = $("#secondpwd").val();
							if (newpassword.length < 6
									|| newpassword1.length < 6) {
								layer.msg('密码长度位6-12位');
								return;
							}
							if (newpassword != newpassword1) {
								layer.msg('两次密码输入不一致');
								return;
							}
							$.ajax({
								type : "POST",
								url : "/BookStore/user?method=changePassword",
								data : {
									"newpassword" : newpassword
								},
								async : true,
								dataType : "text",
								success : function(data) {

									if (data == "1") {
										layer.msg('修改成功');

									} else {
										layer.msg('修改失败');

									}
								}

							});
							setTimeout(function() {
								layer.close(index);
							}, 2000);

						},
						btn2 : function(index, layero) {
							layer.close(index);
						}

					});
		}

		/*点击对应的消息，可以弹出该条评论所属的评论的模块框，可以对应的进行评论、删除点赞，也可以点到对应书籍的评论区去*/
		function showComment(blt_comment, bid) {
			$("#messageBox").css("display", "none");
			$('#goTOSeeComment').attr(
					'href',
					'/BookStore/getBooks?method=infomation&bid=' + bid
							+ '#comment');

			var data;
			$.ajax({
						type : "POST",
						url : "/BookStore/comment?method=getCommentByComid",
						data : {
							"comid" : blt_comment
						},
						async : false,
						dataType : "json",
						success : function(com) {

							if (com != null) {
								data = com;
								var content = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/touxiang.jpg" width="50px" height="50px" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">'
										+ com.commentOwner.username
										+ ' : </a> <span class="my-pl-con">&nbsp;'
										+ com.content
										+ '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
										+ com.time
										+ '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock" onclick="deleteComment1(this,'
										+ com.comid
										+ ','
										+ com.id
										+ ')" >删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="reply1(this,'
										+ com.comid
										+ ','
										+ com.id
										+ ','
										+ com.bid
										+ ')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" onclick="clickLikes1(this,'
										+ com.comid
										+ ')"><i class="date-dz-z-click-red" ></i>赞 (<i class="z-num">'
										+ com.likes
										+ '</i>)</a> </div> </div><div class="hf-list-con">';

								var replyList = com.replyComment;
								for (var i = 0; i < replyList.length; i++) {
									content += '<div class="all-pl-con" ><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">'
											+ replyList[i].commentOwner.username
											+ ' : </a><span class="my-pl-con">回复'
											+ '<a href="#" style="color: #339b53;">@'
											+ replyList[i].userReplyTo.username
											+ '</a>:'
											+ replyList[i].content
											+ '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
											+ replyList[i].time
											+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock" onclick="deleteComment1(this,'
											+ replyList[i].comid
											+ ','
											+ replyList[i].id
											+ ')">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="reply1(this,'
											+ replyList[i].blt_comment
											+ ','
											+ replyList[i].id
											+ ','
											+ replyList[i].bid
											+ ')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" onclick="clickLikes1(this,'
											+ replyList[i].comid
											+ ')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">'
											+ replyList[i].likes
											+ '</i>)</a> </div> </div></div>';
								}
								content += '</div></div> </div>';
								$("#commentshow").html(content);
							}

						}
					});
			/* var content = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/touxiang.jpg" width="50px" height="50px" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">'data.commentOwner.username' : </a> <span class="my-pl-con">&nbsp;'+ data.content +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+data.time+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock"  >删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" >回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red" ></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
			 */
			$("#myModal").modal();
		}
	</script>


	<div class="container">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand "
						href="/BookStore/getBooks?method=bookofHotandNew" id="mainpage">&nbsp;&nbsp;<span class="glyphicon glyphicon-home"></span>首页&nbsp;&nbsp;</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class=""><a
							href="/BookStore/getBooks?cid=0&method=category" id="all"><span class="glyphicon glyphicon-book"></span>全部作品
								<span class="sr-only">(current)</span>
						</a></li>
						<li><a href="/BookStore/range"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span>作品排行</a></li>
						<li><a
							href="/BookStore/getBooks?method=bookofHotandNew#hotBook"><span class="glyphicon glyphicon-fire"></span>热门作品</a></li>
						<li><a
							href="/BookStore/getBooks?method=bookofHotandNew#newBook"><span class="glyphicon glyphicon-cd"></span>新书推荐</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><span class="glyphicon glyphicon-th-list"></span>所有分类<span class="caret"></span></a>
							<ul class="dropdown-menu" id="liContainer">
							</ul></li>
					</ul>
					<form class="navbar-form navbar-right"
						action="/BookStore/getBooks?method=bookName" method="post">
						<div class="form-group" style="position: relative">
							<input type="text" name="bookname" id="searchBook"
								class="form-control" onkeyup="search(this)"
								placeholder="搜索你想要的书籍" autocomplete="off">
							<div id="showDiv" onmouseleave='hidethis()'
								style="display: none; background: #fff; width: 170px; z-index: 1000; position: absolute"></div>
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<div class="container" style="display: none">

		<ul class="breadcrumb"
			style="padding-bottom: 0px; margin-bottom: 0px; display: none">
			<li><a href="#">Home</a></li>
			<li><a href="#">2013</a></li>
			<li class="active">十一月</li>
		</ul>

	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<a id="goTOSeeComment">去该评论区看看</a>
					</h4>
				</div>
				<div class="modal-body" style="">
					<div>
						<div class="comment-show" id="commentshow">

							<div class="hf-list-con" id="replyContainer"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!--点击回复动态创建回复块-->
	<script type="text/javascript">
		function reply1(obj, blt_comment, replyuid, bid) {

			//获取回复人的名字
			var fhName = $(obj).parents('.date-dz-right').parents('.date-dz')
					.siblings('.pl-text').find('.comment-size-name').html();
			//回复@
			var fhN = '回复@' + fhName;
			//var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
			var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" onclick="submitReply1(this,'
					+ blt_comment
					+ ','
					+ replyuid
					+ ','
					+ bid
					+ ')" class="hf-pl">评论</a></div>';
			//显示回复
			if ($(obj).is('.hf-con-block')) {
				$(obj).parents('.date-dz-right').parents('.date-dz').append(
						fhHtml);
				$(obj).removeClass('hf-con-block');
				$('.content').flexText();
				$(obj).parents('.date-dz-right').siblings('.hf-con').find(
						'.pre').css('padding', '6px 15px');
				//console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
				//input框自动聚焦
				$(obj).parents('.date-dz-right').siblings('.hf-con').find(
						'.hf-input').val('').focus().val(fhN);
			} else {
				$(obj).addClass('hf-con-block');
				$(obj).parents('.date-dz-right').siblings('.hf-con').remove();
			}
		}
	</script>
	<!--评论回复块创建-->
	<script type="text/javascript">
		function submitReply1(obj, blt_comment, replyuid, bid) {
			var oThis = $(obj);
			var myDate = new Date();
			//获取当前年
			var year = myDate.getFullYear();
			//获取当前月
			var month = myDate.getMonth() + 1;
			//获取当前日
			var date = myDate.getDate();
			var h = myDate.getHours(); //获取当前小时数(0-23)
			var m = myDate.getMinutes(); //获取当前分钟数(0-59)
			if (m < 10)
				m = '0' + m;
			var s = myDate.getSeconds();
			if (s < 10)
				s = '0' + s;
			var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":"
					+ s;
			//获取输入内容
			var flag = "";
			var oHfVal = $(obj).siblings('.flex-text-wrap').find('.hf-input')
					.val();
			console.log(oHfVal)
			var oHfName = $(obj).parents('.hf-con').parents('.date-dz')
					.siblings('.pl-text').find('.comment-size-name').html();
			var oAllVal = '回复@' + oHfName;
			if (oHfVal.replace(/^ +| +$/g, '') == '' || oHfVal == oAllVal) {

			} else {
				oHfVal = oHfVal.replace(oAllVal, '');
				$.ajax({
					type : "POST",
					url : "/BookStore/comment?method=addComment",
					data : {
						"content" : oHfVal,
						"time" : now,
						"bid" : bid,
						"id" : "${user.id}",
						"replynum" : 0,
						"likes" : 0,
						"blt_comment" : blt_comment,
						"replyuid" : replyuid
					},
					async : false,
					dataType : "json",
					success : function(data) {
						flag = data;

					}
				});
				if (flag != "") {

					var comid
					if (flag.blt_comment != 0)
						comid = flag.blt_comment;
					else
						comid = flag.comid;
					var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">${user.username} : </a><span class="my-pl-con">回复'
							+ '<a href="#" style="color: #339b53;">@'
							+ oHfName
							+ '</a>'
							+ oHfVal
							+ '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
							+ now
							+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock" onclick="deleteComment1(this,'
							+ flag.comid
							+ ','
							+ flag.id
							+ ')">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="reply1(this,'
							+ comid
							+ ','
							+ flag.id
							+ ')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" onclick="clickLikes1(this,'
							+ flag.comid
							+ ')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
					var content = $("#commentshow").val();
					oThis.parents('.hf-con').parents('.comment-show-con-list')
							.find('.hf-list-con').css('display', 'block')
							.prepend(oHtml)
							&& oThis.parents('.hf-con').siblings(
									'.date-dz-right').find('.pl-hf').addClass(
									'hf-con-block')
							&& oThis.parents('.hf-con').remove();

				}

			}
		}
	</script>
	<!--删除评论块-->
	<script type="text/javascript">
		/*  $('.commentAll').on('click','.removeBlock',function(){ */

		function deleteComment1(obj, comid, id) {

			var uid = "${user.id}";
			if (uid != id) {
				layer.msg('您不能删除他人的评论');
				return;
			}
			$.ajax({
				type : "POST",
				url : "/BookStore/comment?method=deleteComment",
				data : {
					"comid" : comid
				},
				async : false,
				dataType : "json",
				success : function(data) {
					flag = data;

				}
			});

			if (flag != "") {
				var oT = $(obj).parents('.date-dz-right').parents('.date-dz')
						.parents('.all-pl-con');
				if (oT.siblings('.all-pl-con').length >= 1) {
					oT.remove();
				} else {
					$(obj).parents('.date-dz-right').parents('.date-dz')
							.parents('.all-pl-con').parents('.hf-list-con')
							.css('display', 'none')
					oT.remove();
				}
				$(obj).parents('.date-dz-right').parents('.date-dz').parents(
						'.comment-show-con-list').parents('.comment-show-con')
						.remove();
			}
			layer.msg('删除成功');
		}
	</script>
	<!--点赞-->
	<script type="text/javascript">
		/*   $('.comment-show').on('click','.date-dz-z',function(){ */
		function clickLikes1(obj, comid) {
			var zNum = $(obj).find('.z-num').html();
			var like = "false";
			if ($(obj).is('.date-dz-z-click')) {
				zNum--;
				like = "false";

				$(obj).removeClass('date-dz-z-click red');
				$(obj).find('.z-num').html(zNum);
				$(obj).find('.date-dz-z-click-red').removeClass('red');
			} else {
				zNum++;
				like = "true";
				$(obj).addClass('date-dz-z-click');
				$(obj).find('.z-num').html(zNum);
				$(obj).find('.date-dz-z-click-red').addClass('red');
			}
			$.ajax({
				type : "POST",
				url : "/BookStore/comment?method=clickLikes",
				data : {
					"comid" : comid,
					"like" : like
				},
				async : false,
				dataType : "json",
				success : function(data) {
					flag = data;

				}
			});

		}
	</script>
</body>
</html>