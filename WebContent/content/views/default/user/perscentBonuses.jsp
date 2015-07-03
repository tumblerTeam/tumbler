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
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<script src="content/static/js/datetime/jquery-1.11.1.min.js"></script>
<title>不倒翁</title>
<style>
.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 40%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
<style type="text/css">
ul {
	font-size: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index">首页</a> > <a>我的酒翁</a>
		</div>
	</div>
	<div class="personal">

		<jsp:include page="../frontDesk/left.jsp" />
		<div class="personal_center2">
			<div class="nav">
				<dd style="width: 204px;">商品名称</dd>
				<dd>单价（元）</dd>
				<dd>数量</dd>
				<dd>实付款（元）</dd>
				<dd>交易状态</dd>
				<dd>交易操作</dd>
			</div>
			<c:forEach items="${orderForms }" var="orderForm" varStatus="loop">
				<div class="all" id="all${loop.count }">
					<div class="all_nav">
						<form>
							<input type="checkbox" />
						</form>
						<div class="zi1">${orderForm.orderDate }&nbsp;${orderForm.orderTime }</div>
						<div class="zi2">订单号：${orderForm.orderFormID }</div>
						<div class="zi3">${orderForm.commodities[0].shopCommodity.belongTo.shopName }</div>
						<c:if test="${orderForm.orderstatus =='transitGoods'}">
								<div class="zi3" style="margin-left: 228px;" onclick="queren('${orderForm.orderFormID}');">确认收货</div>
						</c:if>
						<c:if test="${orderForm.orderstatus =='waitPayment' || orderForm.orderstatus =='BuyersHavePaid' || orderForm.orderstatus =='waitDelivery'}">
							<div class="shouhuo" onclick="quxiao('${orderForm.orderFormID}');">取消订单</div>
						</c:if>
					</div>
					<div class="all_class1">
						<div class="nav1">
							<c:forEach items="${orderForm.commodities }" var="commodity">
								<a
									href="proscenium/shopItem?commID=${commodity.shopCommodity.commCode }&category=${commodity.shopcategory.categoryID }&shopID=${commodity.seller.id }&commoName=${commodity.shopCommodity.commoidtyName }"><dd
										style="width: 202px; padding-top: 20px;">
										<div class="img">
											<img
												src="${commodity.shopCommodity.shopCommImages[0].imagePath }" />
										</div>
										<div class="name">
											<c:if
												test="${fn:length(commodity.shopCommodity.commoidtyName)<=7}">${commodity.shopCommodity.commoidtyName }</c:if>
											<c:if
												test="${fn:length(commodity.shopCommodity.commoidtyName)>7}">${fn:substring(commodity.shopCommodity.commoidtyName, 0, 7)}...</c:if>
										</div>
									</dd></a>
								<dd>
									￥
									<fmt:formatNumber value="${commodity.price }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
									元
								</dd>
								<dd>${commodity.quantity }</dd>
								<dd style="padding-top: 35px;">
									￥
									<fmt:formatNumber value="${commodity.money }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
									元 <br />
								</dd>
								<dd style="padding-top: 35px;">
									<c:choose>
										<c:when test="${orderForm.orderstatus =='BuyersHavePaid'}">买家已付款</c:when>
										<c:when test="${orderForm.orderstatus =='waitPayment'}">等待买家付款</c:when>
										<c:when test="${orderForm.orderstatus =='waitDelivery'}">等待卖家发货</c:when>
										<c:when test="${orderForm.orderstatus =='transitGoods'}">卖家已发货</c:when>
										<c:when
											test="${orderForm.orderstatus =='ApplicationForRefund'}">退货申请中</c:when>
										<c:when
											test="${orderForm.orderstatus =='completionTransaction'}">完成交易</c:when>
										<c:when test="${orderForm.orderstatus =='closeTransaction'}">关闭交易</c:when>
										<c:when test="${orderForm.orderstatus =='refundOrderForm'}"> 退款中的订单</c:when>
										<c:when test="${orderForm.orderstatus =='refundSuccess'}">退款成功</c:when>
										<c:when test="${orderForm.orderstatus =='refundFailed'}">退款失败</c:when>
									</c:choose>
								</dd>
								<dd>
									<c:choose>
										<c:when test="${orderForm.orderstatus =='waitPayment'}">
											<div class="shouhuo" >立即付款</div>
										</c:when>
										<c:when
											test="${orderForm.orderstatus =='completionTransaction'}">
											<c:if test="${empty orderForm.reviews }">
												<a>退货申请</a>&nbsp;&nbsp;
											<span class="pingjia">评论</span>
											</c:if>
											<c:if test="${not empty orderForm.reviews }">
												<c:set value="true" var="isok"></c:set>
												<c:forEach items="${orderForm.reviews }" var="reviews">
													<c:if
														test="${reviews.shopscommodity.commCode == commodity.shopCommodity.commCode && reviews.additionalReviews == null}">
														<a>退货申请</a>&nbsp;&nbsp;<span class="pingjia">追加评论</span>
														<c:set value="false" var="isok"></c:set>
													</c:if>
													<c:if
														test="${reviews.shopscommodity.commCode == commodity.shopCommodity.commCode && reviews.additionalReviews != null}">
														<a
															href="proscenium/shopItem?commID=${commodity.shopCommodity.commCode }&category=${commodity.shopcategory.categoryID }&shopID=${commodity.seller.id }&commoName=${commodity.shopCommodity.commoidtyName }">再次购买</a>
														<c:set value="false" var="isok"></c:set>
													</c:if>
												</c:forEach>
												<c:if test="${isok == true }">
													<a>退货申请</a>&nbsp;&nbsp;<span class="pingjia">追加评论</span>
												</c:if>
												<c:set value="true" var="isok"></c:set>
											</c:if>
										</c:when>
									</c:choose>
								</dd>
								<div class="ping" style="display: none;">
									<form action="user/reviews" method="post">
										<div class="content"
											style="height: 250px; width: 100%; margin-top: 50px; background-color: #ededed; border: none;">
											<div style="text-align: center;">
												<input type="hidden" name="userId"
													value="${orderForm.orderUser.id}" /> <input type="hidden"
													name="orderFormID" value="${orderForm.orderFormID}" /> <input
													type="hidden" name="commCode"
													value="${commodity.shopCommodity.commCode}" /> 评价： <input
													type="radio" name="reviewsRank" value="good"
													checked="checked" />好评 <input type="radio"
													name="reviewsRank" value="better" />中评 <input type="radio"
													name="reviewsRank" value="bad" />差评
											</div>
											<div class="box"
												style="width: 100%; height: 120px; margin-left: 0px; background-color: #ededed">
												<textarea name="businessreply"
													style="margin-left: 100px; width: 600px; height: 100px; resize: none;"></textarea>
											</div>
											<input type="submit" id="fa"
												style="border: none; background-color: #901531; cursor: pointer; color: #fff; font-size: 16px; width: 100px; height: 30px; margin-bottom: 60px; border-radius: 2px; margin-left: 200px;"
												value="发表评论" /> <span class="bu" id="bu">暂不评论</span>
										</div>
									</form>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					function queren(id){
						window.location.href = "user/comitComm?id="+id;
					}
					$(".pingjia").click(
							event,
							function() {
								for (var i = 0; i < $(".pingjia").length; i++) {
									if (i == $(".pingjia").index($(this))) {
										$(".ping").eq(i).css("transition",
												"all 0.5s").css("display",
												"block");
									} else {
										$(".ping").eq(i).css("transition",
												"all 0.5s").css("display",
												"none");
									}

								}
							});
					<!--第一个-->
					$("#ping").children($("#ping")).hover(
							function() {
								//索引
								var index = $("#ping").children($("#ping"))
										.index(this);
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
					window.onload = function() {
						$(".pingjia")
								.click(
										event,
										function() {
											for (var i = 0; i < $(".pingjia").length; i++) {
												if (i == $(".pingjia").index(
														$(this))) {
													$(".ping").eq(i).css(
															"transition",
															"all 0.5s").css(
															"display", "block");
												} else {
													$(".ping").eq(i).css(
															"transition",
															"all 0.5s").css(
															"display", "none");
												}

											}
										});
						$(".bu").click(
								event,
								function() {
									for (var i = 0; i < $(".bu").length; i++) {
										if (i == $(".bu").index($(this))) {
											$(".ping").eq(i).css("transition",
													"all 0.5s").css("display",
													"none");
										}
									}
								});
					}
				</script>
				<div class="nav"></div>
			</c:forEach>
		</div>
		<jsp:include page="../frontDesk/right.jsp" />
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>