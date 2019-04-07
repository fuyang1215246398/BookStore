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
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<script type="text/javascript" src="layer/layer.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/comment.css">
<script type="text/javascript" src="js/jquery.flexText.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var showproduct = {
			"boxid" : "showbox",
			"sumid" : "showsum",
			"boxw" : 400,//宽度,该版本中请把宽高填写成一样
			"boxh" : 450,//高度,该版本中请把宽高填写成一样
			"sumw" : 60,//列表每个宽度,该版本中请把宽高填写成一样
			"sumh" : 60,//列表每个高度,该版本中请把宽高填写成一样
			"sumi" : 7,//列表间隔
			"sums" : 5,//列表显示个数
			"sumsel" : "sel",
			"sumborder" : 1,//列表边框，没有边框填写0，边框在css中修改
			"lastid" : "showlast",
			"nextid" : "shownext"
		};//参数定义	  
		$.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
	});
</script>

<script type="text/javascript">
	function addToCart(obj) {
		var buyNum = $("#text_box").val();
		var storage = $("#storage").html();
		if (parseInt(buyNum) > parseInt(storage)) {
			layer.msg('库存不足');
			return;
		}

		$.ajax({
			type : "POST",
			url : "/BookStore/cart?method=addBookToCart",
			data : {
				"bid" : obj,
				"buyNum" : buyNum
			},
			async : true,
			dataType : "text",
			success : function(data) {

				if (data == "1") {
					layer.msg('添加购物车成功');
				} else {
					layer.msg('添加购物车失败');

				}
			}
		});
	}
</script>

</head>
<body style="background: #F9F9F9;">
	<%@include file="/head.jsp"%>
	<div class="container">
		<div class="showall" style="width: 100%">
			<!--left -->
			<div class="showbot">
				<div id="showbox">

					<img src="/BookStore${book.picture }" width="400" height="400" />

				</div>
				<!--展示图片盒子-->
				<div id="showsum">
					<!--展示图片里边-->
				</div>
				<p class="showpage">
					<a href="javascript:void(0);" id="showlast"> < </a> <a
						href="javascript:void(0);" id="shownext"> > </a>
				</p>
			</div>
			<!--conet -->
			<div class="tb-property">
				<div class="tr-nobdr">
					<h3>${book.name }</h3>
				</div>
				<div class="txt" style="background: #E8E8E8">

					<span class="nowprice"> &nbsp;&nbsp;&nbsp;&nbsp;￥<a href="">${book.price }</a></span>
					<div class="cumulative">
						<span class="number ty1" style="color: black">热度&nbsp;&nbsp;&nbsp;<br />
						<em id="add_sell_num_363">${book.hot }&nbsp;&nbsp;&nbsp;</em></span> <span
							class="number ty1" style="color: black">累计售出<br />
						<em id="add_sell_num_363">${book.soldout }</em></span> <span
							class="number tyu" style="color: black">累计评价<br />
						<em id="add_sell_num_363">25</em></span> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>
				<div class="txt-h">
					<span class="tex-o">分类</span>
					<ul class="glist" id="glist"
						data-monitor="goodsdetails_fenlei_click">
						<li><a
							href="/BookStore/getBooks?cid=${book.cid}&method=category">${category.category}</a></li>

					</ul>
				</div>
				<script>
					$(document).ready(function() {

						var t = $("#text_box");

						$('#min').attr('disabled', true);

						$("#add").click(function() {
							t.val(parseInt(t.val()) + 1)
							if (parseInt(t.val()) != 1) {
								$('#min').attr('disabled', false);
							}

						})

						$("#min").click(function() {
							t.val(parseInt(t.val()) - 1);
							if (parseInt(t.val()) == 1) {
								$('#min').attr('disabled', true);
							}

						})
					});
				</script>
				<div class="gcIpt">
					<span class="guT">数量</span> <input id="min" name="" type="button"
						value="-" /> <input id="text_box" name="" type="text" value="1"
						style="width: 50px; text-align: center; color: #0F0F0F;" /> <input
						id="add" name="" type="button" value="+" /> <span class="Hgt">库存（<font
						id="storage">${book.storage }</font>）
					</span>
				</div>
				<div class="nobdr-btns" align="center">

					<button class="addcart hu" onclick="addToCart('${book.bid}')">
						<img src="images/shop.png" width="25" height="25" />加入购物车
					</button>

					<button class="addcart yh" onclick="buyNow('${book.bid}')">
						<img src="images/ht.png" width="25" height="25" />立即购买
					</button>
				</div>
				<script type="text/javascript">
					function buyNow(bid) {
						var buyNum = $("#text_box").val();
						location.href = "/BookStore/order?method=buyNow&bid="
								+ bid + "&buyNum=" + buyNum;
					}
				</script>
				<div class="guarantee">
					<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img
							src="images/me.png" /></a></span>
				</div>
			</div>

		</div>
	</div>

	<!-- 推荐搭配 -->


	<!-- 商品介紹 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="aside "
					style="border: #ebebeb solid 1px; width: 100%; height: 830px">
					<h3>
						类似推荐<span><img src="images/fod.png" width="22" height="22" />换一批</span>
					</h3>
					<c:forEach items="${sameCateGoryBook }" var="book">
						<dl class="ac-mod-list">
							<dt>
								<a href="/BookStore/getBooks?method=infomation&bid=${book.bid }"><img
									src="/BookStore${book.picture }" style="height: 190px" /></a>
							</dt>
							<dd>
								${book.name } <span>￥${book.price }</span>
							</dd>
						</dl>
					</c:forEach>
				</div>

			</div>
			<div class="col-lg-9">
				<!-- right -->
				<script>
					var detail = document.querySelector('.detail');
					var origOffsetY = detail.offsetTop;
					function onScroll(e) {
						window.scrollY >= origOffsetY ? detail.classList
								.add('sticky') : detail.classList
								.remove('sticky');
					}
					document.addEventListener('scroll', onScroll);
				</script>
				<div class="detail" style="width: 100%">
					<div class="active_tab" id="outer" style="width: 100%">
						<ul class="act_title_left" id="tab">

							<li class="act_active"><a href="#">商品介绍</a></li>
							<li id="comment"><a href="#">商品评价</a></li>
							<li><a href="#">售后保障</a></li>
						</ul>

						<div class="clear"></div>
					</div>
					<div id="content" class="active_list" style="width: 100%">
						<!--商品规格-->
						<div style="width: 850px">
							<ul>
								<li><font size="3px">作者：${book.writer} </font></li>
								<br>
								<li>出版社：中科大软件学院出版社</li>
								<br>
								<li>厂家地址：江苏省苏州市工业园区文荟人才公寓</li>
								<br>
								<li>简介：&nbsp; ${book.introduce}</li>
							</ul>
						</div>

						<!--商品评价-->

						<div id="ui-c" class="ui-c" style="width: 100%">
							<ul style="display: none;">
								<li style="padding-left: 0px">
									<div class="commentAll">
										<!--评论区域 begin-->
										<div class="reviewArea clearfix">
											<textarea class="content comment-input"
												placeholder="请输入你的评论&hellip;" onkeyup="keyUP(this)"></textarea>
											<a href="javascript:;" class="plBtn">评论</a>
										</div>
										<!--评论区域 end-->
										<!--回复区域 begin-->

										<div class="comment-show">
											<c:forEach items="${commentList }" var="comment">
												<div class="comment-show-con clearfix">
													<div class="comment-show-con-img pull-left">
														<img src="images/touxiang.jpg" width="50px" height="50px"
															alt="">
													</div>
													<div class="comment-show-con-list pull-left clearfix">
														<div class="pl-text clearfix">
															<a href="#" class="comment-size-name">${comment.commentOwner.username }: </a> <span class="my-pl-con">&nbsp;${comment.content}</span>
														</div>
														<div class="date-dz">
															<span class="date-dz-left pull-left comment-time">${comment.time }</span>
															<div class="date-dz-right pull-right comment-pl-block">
																<a href="javascript:;" class="removeBlock"
																	onclick="deleteComment(this,'${comment.comid}','${comment.commentOwner.id }')">删除</a>
																<a href="javascript:;"
																	class="date-dz-pl pl-hf hf-con-block pull-left"
																	onclick="reply(this,'${comment.comid}','${comment.commentOwner.id }')">回复</a>
																<span class="pull-left date-dz-line">|</span> <a
																	href="javascript:;" class="date-dz-z pull-left"
																	onclick="clickLikes(this,'${comment.comid}')"><i
																	class="date-dz-z-click-red"></i>赞 (<i class="z-num">${comment.likes}</i>)</a>
															</div>
														</div>
														<div class="hf-list-con">
															<c:forEach items="${comment.replyComment }" var="reply">
																<div class="all-pl-con">
																	<div class="pl-text hfpl-text clearfix">
																		<a href="#" class="comment-size-name">${reply.commentOwner.username  }: </a> <span class="my-pl-con">回复<a href="#"
																			class="atName">@${reply.userReplyTo.username }</a>
																			:${reply.content }
																		</span>
																	</div>
																	<div class="date-dz">
																		<span class="date-dz-left pull-left comment-time">${reply.time}</span>
																		<div class="date-dz-right pull-right comment-pl-block">
																			<a href="javascript:;" class="removeBlock"
																				onclick="deleteComment(this,'${reply.comid}','${reply.commentOwner.id }')">删除</a>
																			<a href="javascript:;"
																				class="date-dz-pl pl-hf hf-con-block pull-left"
																				onclick="reply(this,'${comment.comid}','${reply.commentOwner.id }')">回复</a>
																			<span class="pull-left date-dz-line">|</span> <a
																				href="javascript:;" class="date-dz-z pull-left"
																				onclick="clickLikes(this,'${reply.comid}')"><i
																				class="date-dz-z-click-red"></i>赞 (<i class="z-num">${reply.likes }</i>)</a>
																		</div>
																	</div>
																</div>
															</c:forEach>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>

										<!--回复区域 end-->
									</div>
								</li>

							</ul>
						</div>
						<!--售后保障-->
						<div id="uid" class="uid" style="width: 100%">
							<ul style="display: none;">
								<li><img alt="" src="images/aftersale1.png"></li>
							</ul>

						</div>
					</div>
					<script>
						$(function() {
							window.onload = function() {
								var $li = $('#tab li');
								var $ul = $('#content ul');

								$li.mouseover(function() {
									var $this = $(this);
									var $t = $this.index();
									$li.removeClass();
									$this.addClass('act_active');
									$ul.css('display', 'none');
									$ul.eq($t).css('display', 'block');
								});
							}
						});
					</script>
				</div>
			</div>

		</div>
	</div>




	<!--textarea高度自适应-->
	<script type="text/javascript">
		$(function() {
			$('.content').flexText();
		});
	</script>
	<!--textarea限制字数-->
	<script type="text/javascript">
		function keyUP(t) {
			var len = $(t).val().length;
			if (len > 139) {
				$(t).val($(t).val().substring(0, 140));
			}
		}
	</script>
	<!--点击评论创建评论条-->
	<script type="text/javascript">
		$('.commentAll')
				.on(
						'click',
						'.plBtn',
						function() {
							var user = "${user.id}";
							if (user == 0) {

								layer.msg('请登录后再评论');
								return;
							}

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
							var now = year + '-' + month + "-" + date + " " + h
									+ ':' + m + ":" + s;
							//获取输入内容
							var oSize = $(this).siblings('.flex-text-wrap')
									.find('.comment-input').val();
							console.log(oSize);
							var flag = "0";
							//动态创建评论模块
							$.ajax({
								type : "POST",
								url : "/BookStore/comment?method=addComment",
								data : {
									"content" : oSize,
									"time" : now,
									"bid" : "${book.bid}",
									"id" : "${user.id}",
									"replynum" : 0,
									"likes" : 0,
									"blt_comment" : 0,
									"replyuid" : 0
								},
								async : false,
								dataType : "json",
								success : function(data) {
									flag = data;

								}
							});
							if (flag != "") {
								oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/touxiang.jpg" width="50px" height="50px" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">${user.username} : </a> <span class="my-pl-con">&nbsp;'
										+ oSize
										+ '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
										+ now
										+ '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock"  onclick="deleteComment(this,'
										+ flag.comid
										+ ','
										+ flag.id
										+ ')">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="reply(this,'
										+ flag.comid
										+ ','
										+ flag.id
										+ ')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red" onclick="clickLikes(this,'
										+ flag.comid
										+ ')"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
								if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
									$(this).parents('.reviewArea ').siblings(
											'.comment-show').prepend(oHtml);
									$(this).siblings('.flex-text-wrap').find(
											'.comment-input').prop('value', '')
											.siblings('pre').find('span').text(
													'');
								}
							} else {

							}

						});
	</script>
	<!--点击回复动态创建回复块-->
	<script type="text/javascript">
		function reply(obj, blt_comment, replyuid) {

			//获取回复人的名字
			var fhName = $(obj).parents('.date-dz-right').parents('.date-dz')
					.siblings('.pl-text').find('.comment-size-name').html();
			//回复@
			var fhN = '回复@' + fhName;
			
			//var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
			var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" onclick="submitReply(this,'
					+ blt_comment
					+ ','
					+ replyuid
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
		/*  $('.comment-show').on('click','.hf-pl',function(){ */
		function submitReply(obj, blt_comment, replyuid) {
			
			var user = "${user.id}";
			if (user == 0) {

				layer.msg('请登录后再评论');
				return;
			}

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
						"bid" : "${book.bid}",
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
							+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock" onclick="deleteComment(this,'
							+ flag.comid
							+ ','
							+ flag.id
							+ ')">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="reply(this,'
							+ comid
							+ ','
							+ flag.id
							+ ')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" onclick="clickLikes(this,'
							+ flag.comid
							+ ')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
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

		function deleteComment(obj, comid, id) {

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
		function clickLikes(obj, comid) {
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
	<%@include file="/Footer.jsp"%>

</body>
</html>