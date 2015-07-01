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
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<title>不倒翁</title>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index.html">首页</a> > <a>我的酒翁</a>
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
					</div>
					<div class="all_class1">
						<div class="nav1">
							<c:forEach items="${orderForm.commodities }" var="commodity">
								<a
									href="proscenium/shopItem?commID=${commodity.shopCommodity.commCode }&category=${commodity.shopcategory.categoryID }&shopID=${commodity.seller.id }&commoName=${commodity.shopCommodity.commoidtyName }"><dd
										style="width: 202px; padding-top: 20px;">
										<div class="img">
											<img src="${commodity.shopCommodity.shopCommImages[0].imagePath }" />
										</div>
										<div class="name">
											<c:if
												test="${fn:length(commodity.shopCommodity.commoidtyName)<=7}">${commodity.shopCommodity.commoidtyName }</c:if>
											<c:if
												test="${fn:length(commodity.shopCommodity.commoidtyName)>7}">${fn:substring(commodity.shopCommodity.commoidtyName, 0, 7)}...</c:if>
										</div>
									</dd></a>
								<dd>
									￥<fmt:formatNumber value="${commodity.price }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>元
								</dd>
								<dd>${commodity.quantity }</dd>
								<dd style="padding-top: 35px;">
									￥<fmt:formatNumber value="${commodity.money }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>元
									<br />
								</dd>
								<dd style="padding-top: 35px;">
									<c:choose>
										<c:when test="${orderForm.orderstatus =='BuyersHavePaid'}">买家已付款</c:when>
										<c:when test="${orderForm.orderstatus =='waitPayment'}">等待买家付款</c:when>
										<c:when test="${orderForm.orderstatus =='waitDelivery'}">等待卖家发货</c:when>
										<c:when test="${orderForm.orderstatus =='transitGoods'}">卖家已发货</c:when>
										<c:when test="${orderForm.orderstatus =='ApplicationForRefund'}">退货申请中</c:when>
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
										<div class="shouhuo">立即付款</div><div class="shouhuo">取消订单</div>
									</c:when>
									<c:when test="${orderForm.orderstatus =='BuyersHavePaid'}"><div class="shouhuo">取消订单</div></c:when>
									<c:when test="${orderForm.orderstatus =='waitDelivery'}"><div class="shouhuo">取消订单</div></c:when>
									<c:when test="${orderForm.orderstatus =='transitGoods'}"><div class="shouhuo">确认收货</div></c:when>
									<c:when test="${orderForm.orderstatus =='completionTransaction'}">
										<c:if test="${empty orderForm.reviews }">
											<a>退款/退货</a>&nbsp;&nbsp;<a >点评</a>
										</c:if>
										<c:if test="${not empty orderForm.reviews }">
											<c:set value="true" var="isok"></c:set>
											<c:forEach items="${orderForm.reviews }" var="reviews">
												<c:if test="${reviews.shopscommodity.commCode == commodity.shopCommodity.commCode && reviews.additionalReviews == null}">
													<a>退款/退货</a>&nbsp;&nbsp;<a >追加点评</a>
													<c:set value="false" var="isok"></c:set>
												</c:if>
												<c:if test="${reviews.shopscommodity.commCode == commodity.shopCommodity.commCode && reviews.additionalReviews != null}">
													<a href="proscenium/shopItem?commID=${commodity.shopCommodity.commCode }&category=${commodity.shopcategory.categoryID }&shopID=${commodity.seller.id }&commoName=${commodity.shopCommodity.commoidtyName }">再次购买</a>
													<c:set value="false" var="isok"></c:set>
												</c:if>
											</c:forEach>
											<c:if test="${isok == true }"><a>退款/退货</a>&nbsp;&nbsp;<a >点评</a></c:if>
											<c:set value="true" var="isok"></c:set>
										</c:if>
									</c:when>
								</c:choose>
								</dd>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="nav"></div>
			</c:forEach>
		</div>
		<jsp:include page="../frontDesk/right.jsp" />
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>