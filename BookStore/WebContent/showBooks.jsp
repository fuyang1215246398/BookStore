<%@page import="java.util.*"%>
<%@page import="com.ustc.instance.*"%>
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
<title>所有书籍</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style1.css" rel="stylesheet" type="text/css"/>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<script type="text/javascript">
	function  showBooks(obj,currentpage){
		var content1="";
		var page="";
		//ajax根据点击内容更新书籍
		$.post(
			"/BookStore/getBooks",
			{"cid":obj,"method":"category","way":"yibu","currentPage":currentpage},
			function(data){
				var aId="a"+data.cid;
				 $('a[name="mode"]').removeClass("on"); 
				$("#"+aId+"").addClass("on");
				if(data!=null){
					var bookList=data.bookList;
					for(var i=0;i<bookList.length;i++){
						content1+="<div class='col-lg-3 clo-md-3 col-sm-4 col-xs-6' style='height: 370px;'>";
						content1+="<a href='/BookStore/getBooks?method=infomation&bid="+bookList[i].bid+"'> <img src='${pageContext.request.contextPath}"+bookList[i].picture+"'width='100%' height='83%' > </a>";
						content1+="<a   href='/BookStore/getBooks?method=infomation&bid="+bookList[i].bid+"'><font size='3px' color='green'>"+bookList[i].name+"</font></a><br>";
						content1+="<a href='/BookStore/getBooks?method=infomation&bid="+bookList[i].bid+"'><font size='3px' color='red'>价格：￥ "+bookList[i].price+" </font></a>";
						content1+="</div>";
					}
					if(data.currentPage==1){
						page+="<li class='disabled'><a href='#' aria-label='Previous' ><span aria-hidden='true'>&laquo;</span></a></li>";
					}
					else{
						page+="<li ><a href='javascript:void(0)' onclick='showBooks("+data.cid+","+(data.currentPage-1)+")' aria-label='Previous' ><span aria-hidden='true'>&laquo;</span></a></li>";
					}
					for(var i=1;i<=data.totalPage;i++){
						/*/BookStore/getBooks?cid=${cid}&currentPage=${page}&method=category">${page }  */
						
						if(i==data.currentPage)
							page+="<li class='active'><a href='javascript:void(0)' onclick='showBooks("+data.cid+","+i+")'>"+i+"</a></li>";
						else{
							page+="<li ><a href='javascript:void(0)' onclick='showBooks("+data.cid+","+i+")'>"+i+"</a></li>";
						}
					}
					if(data.currentPage==data.totalPage)
						page+="<li  class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
					else
						page+="<li  ><a href='javascript:void(0)' onclick='showBooks("+data.cid+","+(data.currentPage+1)+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
				$("#bookContainer").html(content1);
				$("#pageContainer").html(page);
			},
			"json"
		
		);
		
	}
	$(function(){
		//ajax获取类别
		$.post(
		"/BookStore//getCategory",		
		function(data){
			var content="";
			var all=0;
			 if("${cid}"==0)
				  content="<font  ><a id='a0'  style='border-right: 1px solid #e0e0e0;' name='mode' class='all on' onclick='showBooks("+all+")' href='javascript:void(0)' >全部</a></font>";
				  else
					  content="<font  ><a id='a0' name='mode' style='border-right: 1px solid #e0e0e0;' class='all' onclick='showBooks("+all+")' href='javascript:void(0)' >全部</a></font>";
				  if(data.length>0){
					for(var i=0;i<data.length;i++){
						if(data[i].cid=="${cid}")
							content+=" <font > <a id='a"+(i+1)+"' style='border-right: 1px solid #e0e0e0;' name='mode' rel="+data[i].category+"  class='default on' onclick='showBooks("+data[i].cid+")' href='javascript:void(0)' >"+data[i].category+"</a> </font > ";
							else
								content+=" <font > <a id='a"+(i+1)+"' style='border-right: 1px solid #e0e0e0;' name='mode' rel="+data[i].category+"  class='default' onclick='showBooks("+data[i].cid+")' href='javascript:void(0)' >"+data[i].category+"</a> </font > ";	
					}
					$("#categoryContainer").html(content);
					
				}
		},
		"json"
		);
		
	});
	</script>


</head>
<body style="background: #F9F9F9;">
	<%@include file="/head.jsp"%>
	<div class="container">
		        <div class="cation-content" style="width:100%">
           
            <div class="cation-middle">
                <dl class="cation-list">
                    <dt>所有</dt>
                    <dd id="categoryContainer">
                       
                    </dd>
                </dl>
            </div>
        </div>
		
	</div>
	<br>
	<div class="container">
		<div class="row" align="center">
			<div class="row" align="center" id="bookContainer">
				<c:forEach items="${bookBean.bookList }" var="book">
					<div class="col-lg-3 clo-md-3 col-sm-4 col-xs-6"
						style="height: 370px;">
						<a href="/BookStore/getBooks?method=infomation&bid=${book.bid }">
							<img src="${pageContext.request.contextPath}${book.picture}"
							width="100%" height="83%">
						</a> <a href="/BookStore/getBooks?method=infomation&bid=${book.bid }"><font
							size="3px" color="green">${book.name}</font></a><br> <a
							href="/BookStore/getBooks?method=infomation&bid=${book.bid }"><font
							size="3px" color="red">价格：￥ ${book.price} </font></a>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>

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
	<%@include file="/Footer.jsp"%>
</body>
</html>