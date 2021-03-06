<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css"/>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<script src="content/static/js/datetime/jquery-1.11.1.min.js"></script>
<title>不倒翁</title>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index">首页</a> > <a>我的评价</a>
		</div>
	</div>
	<div class="personal">
		<jsp:include page="../frontDesk/left.jsp" />
		<div class="my_rating">
			<div class="rating_class">
				<ul>
					<li class="p1" id="p1" onClick="pingjia1()">买家的评价</li>
					<li class="p2" id="p2" onClick="pingjia2()">商家的回复</li>
				</ul>
				<hr />
			</div>

			<div id="text" style="display: inline;">
				<div class="nav">
					<ul>
						<li style="width: 220px;"><select>
								<option>评价</option>
								<option>好评</option>
								<option>中评</option>
								<option>差评</option>
						</select> <select>
								<option>评论</option>
								<option>有评论内容</option>
								<option>无评论内容</option>
								<option>有追加评论内容</option>
						</select></li>
						<li>评论人</li>
						<li>商品信息</li>
						<li style="margin-left: 25px;">操作</li>
					</ul>
				</div>
				<c:forEach items="${list }" var="reviews">
					<div class="nav1">
						<ul>
							<li class="hp"><c:if test="${reviews.reviewsRank == 'good'}">好评</c:if>
								<c:if test="${reviews.reviewsRank == 'better'}">中评</c:if> <c:if
									test="${reviews.reviewsRank == 'bad'}">差评</c:if>
								<div class="zi1">${reviews.reviews }
									<c:if test="${reviews.additionalReviews != null }">
										追加：${reviews.additionalReviews }
									</c:if>
								</div>
								<div class="zi2">[${reviews.reviewsdate }${reviews.reviewTime }]</div></li>
							<li class="plr">
								<div class="zi1">买家 ：${reviews.user.userName }</div>
							</li>
							<li class="sp"><a
								href="proscenium/shopItem?commID=${reviews.shopscommodity.commCode }&category=${reviews.shopscommodity.shopCategory.categoryID }&shopID=${reviews.shopscommodity.belongTo.id }&commoName=${reviews.shopscommodity.commoidtyName }"><div
										class="zi1">${reviews.shopscommodity.commoidtyName }</div></a>
								<div class="zi2">
									￥
									<c:if test="${reviews.shopscommodity.isSpecial }">
										<fmt:formatNumber
											value="${reviews.shopscommodity.unitPrice * reviews.shopscommodity.special  }"
											pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
									</c:if>
									<c:if test="${!reviews.shopscommodity.isSpecial }">
										<fmt:formatNumber value="${reviews.shopscommodity.unitPrice }"
											pattern="##.##" minFractionDigits="2">
										</fmt:formatNumber>
									</c:if>
								</div></li>
							<li class="cz"><c:if
									test="${reviews.additionalReviews == null }">
									<span class="pingjia">追加评论</span>
								</c:if></li>
						</ul>
					</div>
				<div class="ping" style="display: none;">
				<form action="user/reviews" method="post">
					<div class="content" style="height: 250px; width:100%;margin-top:50px; background-color:#ededed; border:none;">
						<div style="text-align: center;">
							<input type="hidden" name="userId" value="${reviews.user.id}" />
							<input type="hidden" name="orderFormID" value="${reviews.orderForm.orderFormID}" />
							<input type="hidden" name="commCode"
								value="${reviews.shopscommodity.commCode}" /> 评价： <input type="radio"
								name="reviewsRank" value="good" checked="checked" />好评 <input
								type="radio" name="reviewsRank" value="better" />中评 <input
								type="radio" name="reviewsRank" value="bad" />差评
						</div>
						<div class="box" style="width:100%; height:120px;margin-left:0px; background-color:#ededed">
							<textarea name="businessreply" style=" margin-left:100px;width:600px; height:100px;resize: none;"></textarea>
						</div>
						<input type="submit" id="fa" style="border:none; background-color:#901531; cursor:pointer; color:#fff; font-size:16px; width:100px; height:30px; margin-bottom:60px; border-radius:2px; margin-left:200px;" value="发表评论" /> <span class="bu"
							id="bu">暂不评论</span>
					</div>
				</form>
			</div>
				</c:forEach>
			</div>
			<script>
			<!--第一个-->
				$("#ping").children($("#ping")).hover(
						function() {
							//索引
							var index = $("#ping").children($("#ping")).index(
									this);
							$(this).css("backgroundPosition", "0px 15px");
							for (var i = 0; i <= index; i++) {
								$("#ping").children($("#ping")).eq(i).css(
										"backgroundPosition", "0px 15px");
							}
							for (var j = index + 1; j <= 5; j++) {
								$("#ping").children($("#ping")).eq(j).css(
										"backgroundPosition", "0px 0px");
							}

						}, function() {
							if (index == 5) {
								return;
							}
							$(this).css("backgroundPosition", "0px 0px");
						});
			</script>
			<div id="text2" style="display: none;">
				<div class="pingjia2_nav">
					<ul>
						<li style="width: 250px;">商品信息</li>

						<li style="width: 250px;">商家回复</li>
					</ul>
				</div>
				<c:forEach items="${list }" var="reviews">
					<div class="pingjia2_nav1">
						<ul>
							<li class="sp"><img
								src="${reviews.shopscommodity.shopCommImages[0].imagePath }"
								width="50px" height="50px" /> <a
								href="proscenium/shopItem?commID=${reviews.shopscommodity.commCode }&category=${reviews.shopscommodity.shopCategory.categoryID }&shopID=${reviews.shopscommodity.belongTo.id }&commoName=${reviews.shopscommodity.commoidtyName }">
									<div class="zi1">${reviews.shopscommodity.commoidtyName }</div>
							</a>
								<div class="zi2">
									￥
									<c:if test="${reviews.shopscommodity.isSpecial }">
										<fmt:formatNumber
											value="${reviews.shopscommodity.unitPrice * reviews.shopscommodity.special  }"
											pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
									</c:if>
									<c:if test="${!reviews.shopscommodity.isSpecial }">
										<fmt:formatNumber value="${reviews.shopscommodity.unitPrice }"
											pattern="##.##" minFractionDigits="2">
										</fmt:formatNumber>
									</c:if>
								</div></li>
							<li class="sj">${reviews.businessreply }</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="../frontDesk/right.jsp" />
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
	<script type="text/javascript">
		var change1 = document.getElementById("change1");
		var change2 = document.getElementById("change2");
		var all1 = document.getElementById("all1");
		var all2 = document.getElementById("all2");
		function shoucang1() {
			all1.style.display = "inline";
			all2.style.display = "none";
			change1.style.backgroundColor = "#A40459";
			change1.style.color = "#fff";
			change2.style.backgroundColor = "#fff";
			change2.style.color = "#000";
			change1.style.cursor = "text";
			change2.style.cursor = "pointer";
		}
		function shoucang2() {
			all2.style.display = "inline";
			all1.style.display = "none";
			change2.style.backgroundColor = "#A40459";
			change2.style.color = "#fff";
			change1.style.backgroundColor = "#fff";
			change1.style.color = "#000";
			change2.style.cursor = "text";
			change1.style.cursor = "pointer";
		}
		var text = document.getElementById("text");
		var text2 = document.getElementById("text2");
		var text3 = document.getElementById("text3");
		var p1 = document.getElementById("p1");
		var p2 = document.getElementById("p2");
		var p3 = document.getElementById("p3");
		function pingjia1() {
			text.style.display = "inline";
			text2.style.display = "none";
			text3.style.display = "none";
			p1.style.backgroundColor = "#901531";
			p1.style.color = "#fff";
			p2.style.backgroundColor = "#ccc";
			p2.style.color = "#000";
			p3.style.backgroundColor = "#ccc";
			p3.style.color = "#000";
			p1.style.cursor = "text";
			p2.style.cursor = "pointer";
			p3.style.cursor = "pointer";
		}
		function pingjia2() {
			text.style.display = "none";
			text2.style.display = "inline";
			text3.style.display = "none";
			p2.style.backgroundColor = "#901531";
			p2.style.color = "#fff";
			p1.style.backgroundColor = "#ccc";
			p1.style.color = "#000";
			p3.style.backgroundColor = "#ccc";
			p3.style.color = "#000";
			p2.style.cursor = "text";
			p1.style.cursor = "pointer";
			p3.style.cursor = "pointer";
		}
		function pingjia3() {
			text.style.display = "none";
			text2.style.display = "none";
			text3.style.display = "inline";
			p3.style.backgroundColor = "#901531";
			p3.style.color = "#fff";
			p2.style.backgroundColor = "#ccc";
			p2.style.color = "#000";
			p1.style.backgroundColor = "#ccc";
			p1.style.color = "#000";
			p3.style.cursor = "text";
			p2.style.cursor = "pointer";
			p1.style.cursor = "pointer";
		}
		window.onload=function(){
			$(".pingjia").click(event,function(){
				for(var i=0;i<$(".pingjia").length;i++){
					if(i==$(".pingjia").index($(this))){
						$(".ping").eq(i).css("transition","all 0.5s").css("display","block");
					}else{
						$(".ping").eq(i).css("transition","all 0.5s").css("display","none");
					}
					
				}
			});
			$(".bu").click(event,function(){
				for(var i=0;i<$(".bu").length;i++){
					if(i==$(".bu").index($(this))){
						$(".ping").eq(i).css("transition","all 0.5s").css("display","none");
					}
				}
			});
		}
	</script>
</body>
</html>