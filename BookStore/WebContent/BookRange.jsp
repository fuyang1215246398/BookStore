<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    <link href="css/style1.css" rel="stylesheet" type="text/css"/>
	    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">
  </head>
  <body style="background: #F9F9F9;">
<%@include file="/head.jsp"%>

<div class="container">
 <div class="cation-content" style="width:100%">
         
            <div class="cation-middle">
                <dl class="cation-list">
                    <dt>分类</dt>
                    <dd>
                    	<c:if test="${cid=='0' }">
                        <a href="javascript:;" onclick="change(this,'mode')" name="mode" class="all on">全部</a>
                        </c:if>
                        <c:if test="${cid!='0' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="all">全部</a>
                        </c:if>
                        
                        <c:if test="${cid=='1' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">教育</a>
                        </c:if>
                        <c:if test="${cid!='1' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">教育</a>
                        </c:if>
                        
                        <c:if test="${cid=='2' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">小说</a>
                        </c:if>
                        <c:if test="${cid!='2' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">小说</a>
                        </c:if>
                        
                       <c:if test="${cid=='3' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">文学</a>
                        </c:if>
                        <c:if test="${cid!='3' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">文学</a>
                        </c:if>
                        
                        <c:if test="${cid=='4' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">青春</a>
                        </c:if>
                        <c:if test="${cid!='4' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">青春</a>
                        </c:if>
                        
                        <c:if test="${cid=='5' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">动漫</a>
                        </c:if>
                        <c:if test="${cid!='5' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">动漫</a>
                        </c:if>
                        
                        <c:if test="${cid=='6' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">童书</a>
                        </c:if>
                        <c:if test="${cid!='6' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">童书</a>
                        </c:if>
                        
                        <c:if test="${cid=='7' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">人文</a>
                        </c:if>
                        <c:if test="${cid!='7' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">人文</a>
                        </c:if>
                        
                        <c:if test="${cid=='8' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">经管</a>
                        </c:if>
                        <c:if test="${cid!='8' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">经管</a>
                        </c:if>
                        
                        <c:if test="${cid=='9' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">励志</a>
                        </c:if>
                        <c:if test="${cid!='9' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">励志</a>
                        </c:if>
                        
                        <c:if test="${cid=='10' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">生活</a>
                        </c:if>
                        <c:if test="${cid!='10' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">生活</a>
                        </c:if>
                        
                        <c:if test="${cid=='11' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">科技</a>
                        </c:if>
                        <c:if test="${cid!='11' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">科技</a>
                        </c:if>
                        
                        <c:if test="${cid=='12' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default on">名著</a>
                        </c:if>
                        <c:if test="${cid!='12' }">
                        <a href="javascript:;" onclick="change(this,'mode')"  name="mode" class="default">名著</a>
                        </c:if>
                        
                    </dd>
                </dl>
                <dl class="cation-list">
                    <dt>价格</dt>
                    <dd>
                        <c:if test="${priceLow=='0' && priceHigh=='1000' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="all on">全部</a>
                        </c:if>
                        <c:if test="${priceLow!='0' || priceHigh!='1000' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="all">全部</a>
                        </c:if>
                          <c:if test="${priceLow=='0' && priceHigh=='30' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default on">0-30</a>
                        </c:if>
                        <c:if test="${priceLow!='0' || priceHigh!='30' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default">0-30</a>
                        </c:if>
                        <c:if test="${priceLow=='30' && priceHigh=='60' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default on">30-60</a>
                        </c:if>
                        <c:if test="${priceLow!='30' || priceHigh!='60' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default">30-60</a>
                        </c:if>
                        
                        <c:if test="${priceLow=='60' && priceHigh=='90' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default on">60-90</a>
                        </c:if>
                        <c:if test="${priceLow!='60' || priceHigh!='90' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default">60-90</a>
                        </c:if>
                  
                  		<c:if test="${priceLow=='90' && priceHigh=='120' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default on">90-120</a>
                        </c:if>
                        <c:if test="${priceLow!='90' || priceHigh!='120' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default">90-120</a>
                        </c:if>
                        
                        <c:if test="${priceLow=='120' && priceHigh=='1000' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default on">120以上</a>
                        </c:if>
                        <c:if test="${priceLow!='120' || priceHigh!='1000' }">
                        <a href="javascript:;" onclick="change(this,'theme')"  name="theme" class="default">120以上</a>
                        </c:if>
                       
                       
                    </dd>
                </dl>
                <dl class="cation-list">
                    <dt>排行</dt>
                    <dd>
                    	<c:if test="${rangeType=='hot' }">
                        <a href="javascript:;" onclick="change(this,'system')" name="system" class="all on">热度</a>
                         </c:if>
                         <c:if test="${rangeType!='hot' }">
                        <a href="javascript:;" onclick="change(this,'system')" name="system" class="all">热度</a>
                         </c:if>
                         
                         <c:if test="${rangeType=='price' }">
                        <a href="javascript:;" onclick="change(this,'system')" name="system" class="default on">价格</a>
                        </c:if>
                        <c:if test="${rangeType!='price' }">
                        <a href="javascript:;" onclick="change(this,'system')" name="system" class="default ">价格</a>
                        </c:if>
                        
                        <c:if test="${rangeType=='soldout' }">
                        <a href="javascript:;" onclick="change(this,'system')" name="system" class="default on">销售量</a>
                        </c:if>
                        <c:if test="${rangeType!='soldout' }">
                        <a href="javascript:;" onclick="change(this,'system')" name="system" class="default ">销售量</a>
                        </c:if>
                        
                     
                    </dd>
                </dl>
                
            </div>
        </div>
 <script type="text/javascript">
 var categoryMap={};
 categoryMap['全部']='0';
 categoryMap['教育']='1';
 categoryMap['小说']='2';
 categoryMap['文学']='3';
 categoryMap['青春']='4';
 categoryMap['动漫']='5';
 categoryMap['童书']='6';
 categoryMap['人文']='7';
 categoryMap['经管']='8';
 categoryMap['励志']='9';
 categoryMap['生活']='10';
 categoryMap['科技']='11';
 categoryMap['名著']='12';
 var priceMap={};
 priceMap['全部']=[0,1000];
 priceMap['0-30']=[0,30];
 priceMap['30-60']=[30,60];
 priceMap['60-90']=[60,90];
 priceMap['90-120']=[90,120];
 priceMap['120以上']=[120,1000];
 var rangeMap={};
 rangeMap['热度']='hot';
 rangeMap['价格']='price';
 rangeMap['销售量']='soldout';
 
 function change(obj,name){
	 $('a[name="'+name+'"]').removeClass("on"); 
	 $(obj).addClass("on");
	 
	var categoryContent= $('a[name="mode"].on').html();
	var priceContent= $('a[name="theme"].on').html();
	var rangeContent= $('a[name="system"].on').html();
	var cid=categoryMap[categoryContent];
	var priceLow=priceMap[priceContent][0];
	var priceHigh=priceMap[priceContent][1];
	var rangeType=rangeMap[rangeContent];
	location.href="/BookStore/range?cid="+cid+"&priceLow="+priceLow+"&priceHigh="+priceHigh+"&rangeType="+rangeType;
 }
 function  showBooks(obj,currentpage){
	 var categoryContent= $('a[name="mode"].on').html();
		var priceContent= $('a[name="theme"].on').html();
		var rangeContent= $('a[name="system"].on').html();
		var cid=categoryMap[categoryContent];
		var priceLow=priceMap[priceContent][0];
		var priceHigh=priceMap[priceContent][1];
		var rangeType=rangeMap[rangeContent];
		location.href="/BookStore/range?currentPage="+currentpage+"&cid="+cid+"&priceLow="+priceLow+"&priceHigh="+priceHigh+"&rangeType="+rangeType;
	}


 
 </script>
    
 <div class="container" style="padding-top:20px">
<div class="row">
			
			<c:forEach items="${bookBean.bookList }" var="book">
				<div class="cartBox" style="width:1140px;margin-bottom:5px">
					<div class="order_content" style="background-color:#F5F5F5">
						<ul class="order_lists">
							<li class="list_chk" style="padding-left:20px">
							<br><br><br><br><br>
							
							<p class="sum_price" style="color: #333"><font size="3px"></font></p>
							</li>
							<li class="list_con">
								<div class="list_img" style="margin-top:10px">
									<a
										href="/BookStore/getBooks?method=infomation&bid=${book.bid  }"><img
										src="/BookStore${book.picture }" height="110px"
										width="90px" alt=""></a>
								</div>
								<div class="list_text" align="center">
									<br>
									<br>
									<a
										href="/BookStore/getBooks?method=infomation&bid=${book.bid  }" style="font-size: 14px;color: #1a66b3;">${book.name }</a>
								</div>
							</li>
							<li class="list_info"><br>
							<br>
							
								<p>分类：${categoryList[book.cid-1].category}</p>
								<p>作者：${book.writer }</p></li>
							<li class="list_price"><br>
							<br>
							<br>
								<p class="price" style="color: #ff0000">￥${book.price }</p></li>
							<li class="list_sum"><br>
							<br>
							<br>
								<div class="amount_box" style="">
								<p class="sum_price" style="color:#FF6600;margin-top: 20px;" ><span class="glyphicon glyphicon-fire"></span>热度：${book.hot }</p>
									
								</div></li>
							<li class="list_sum"><br>
							<br>
							
								<p class="sum_price" style="color: #333">已售出：${book.soldout }件</p>
								<p class="sum_price" style="color: #333">库存：${book.storage }件</p>
								</li>
							<li class="list_op"><br>
							
								<p class="del" style="padding-top:0px">
									<a href="javascript:;" style="background-attachment: scroll;background-clip: border-box;background-color: rgb(255, 40, 50);background-image: none;background-origin: padding-box;background-position: 0% 0%;background-position-x: 0%;background-position-y: 0%;background-repeat: repeat;background-size: auto;border-bottom-left-radius: 3px;
									border-bottom-right-radius: 3px;
									border-top-left-radius: 3px;
									border-top-right-radius: 3px;
									color: rgb(255, 255, 255);
									display: inline-block;
									font-size: 14px;
									height: 28px;
									line-height: 28px;
									list-style-image: none;
									list-style-position: outside;
									list-style-type: none;
									margin-right: 10px;
									outline-color: rgb(255, 255, 255);
									outline-style: none;
									outline-width: 0px;
									text-align: center;
									text-decoration: none;
									text-decoration-color: rgb(255, 255, 255);
									text-decoration-line: none;
									text-decoration-style: solid;
									width: 100px;"   onclick="addToCart('${book.bid}')" >加入购物车</a>
								</p>
								<p class="del" >
									<a href="javascript:;" style="background-attachment: scroll;background-clip: border-box;background-color: rgb(255, 40, 50);background-image: none;background-origin: padding-box;background-position: 0% 0%;background-position-x: 0%;background-position-y: 0%;background-repeat: repeat;background-size: auto;border-bottom-left-radius: 3px;
									border-bottom-right-radius: 3px;
									border-top-left-radius: 3px;
									border-top-right-radius: 3px;
									color: rgb(255, 255, 255);
									display: inline-block;
									font-size: 14px;
									height: 28px;
									line-height: 28px;
									list-style-image: none;
									list-style-position: outside;
									list-style-type: none;
									margin-right: 10px;
									outline-color: rgb(255, 255, 255);
									outline-style: none;
									outline-width: 0px;
									text-align: center;
									text-decoration: none;
									text-decoration-color: rgb(255, 255, 255);
									text-decoration-line: none;
									text-decoration-style: solid;
									width: 100px;"  onclick="buyNow('${book.bid}')">立即购买</a>
								</p></li>
						</ul>

					</div>
				</div>

			</c:forEach>
			

		
 </div>
 
 </div>

</div>
<script type="text/javascript">
	function addToCart(obj) {
		

		$.ajax({
			type : "POST",
			url : "/BookStore/cart?method=addBookToCart",
			data : {
				"bid" : obj,
				"buyNum" : 1
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
	function buyNow(bid) {
		
		location.href = "/BookStore/order?method=buyNow&bid="
				+ bid + "&buyNum=" + 1;
	}
</script>


<div class="container">
		<div class="row" align="center">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pageContainer">
					<c:if test="${bookBean.currentPage==1 }">
						<li class="disabled"><a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${bookBean.currentPage!=1 }">
						<li><a href="javascript:void(0)"
							onclick="showBooks(${bookBean.cid},${bookBean.currentPage-1 })"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach begin="1" end="${bookBean.totalPage }" var="page">
						<c:if test="${page==bookBean.currentPage }">
							<li class="active"><a href="javascript:void(0)"
								onclick="showBooks(${bookBean.cid},${page})">${page }</a></li>
						</c:if>
						<c:if test="${page!=bookBean.currentPage }">
							<li><a href="javascript:void(0)"
								onclick="showBooks(${bookBean.cid},${page })">${page }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${bookBean.currentPage==bookBean.totalPage }">
						<li class="disabled"><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${bookBean.currentPage!=bookBean.totalPage }">
						<li><a href="javascript:void(0)"
							onclick="showBooks(${bookBean.cid},${bookBean.currentPage+1 })"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>


<script type="text/javascript">



</script>

















<br><br>
	<%@include file="/Footer.jsp"%>
  </body>
</html>