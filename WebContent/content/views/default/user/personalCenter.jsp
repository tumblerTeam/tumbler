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
<script src="content/static/js/lib/jquery.min.js"></script>
<title>不倒翁</title>
<script>
	$(function() {
		$("input[name='judge']").next().css("text-decoration", "none").css(
				"color", "#444");
	});
</script>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index.html">首页</a> <a>我的酒翁</a>
		</div>
	</div>
	<div class="personal">

		<jsp:include page="../frontDesk/left.jsp" />
		<div class="personal_center">
			<div class="center_class">
				<ul>
					<li><img src="images/shangjialogo.jpg"
						style="margin-top: 8px;" /></li>
					<li>
						<div class="zi" style="margin-top: 55px;">
							<c:if test="${user.userName==null}">
                                   ${user.phone}
                         </c:if>
							<c:if test="${user.userName!=null}">
                                   ${user.userName}
                         </c:if>
						</div>
						<div class="zi">${user.email}</div>
					</li>
					<li><img class="quan" src="images/quan.jpg" />
						<div class="dai">待付款</div></li>
					<li><img class="quan" src="images/quan.jpg" />
						<div class="dai">待收货</div></li>
					<li><img class="quan" src="images/quan.jpg" />
						<div class="dai">待评价</div></li>
				</ul>
			</div>
			<div class="center_class1">
				<div class="all1">
					<div class="tuijian" style="float: left; margin-left: 40px;">我的订单</div>
					<a href="user/perscentBonuses?orderDate=-1&orderStatus=-1"><div
							class="chakan">查看全部订单</div></a>
				</div>
				<div class="all2">
					<ul>
						<c:if test="${fn:length(orderForm.commodities)>3}">
							<c:forEach items="${orderForm.commodities}" begin="1" end="3"
								var="commodity">
								<a
									href="proscenium/shopItem?commID=${commodity.shopCommodity.commCode }&category=${commodity.shopcategory.categoryID }&shopID=${commodity.seller.id }&commoName=${commodity.shopCommodity.commoidtyName }"><li><img
										src=" ${commodity.shopCommodity.shopCommImages[0].imagePath}"
										style="width: 60px; height: 80px" /></li></a>
							</c:forEach>
						</c:if>
						<c:if test="${fn:length(orderForm.commodities)<=3}">
							<c:forEach items="${orderForm.commodities}" var="commodity">
								<a href="proscenium/shopItem?commID=${commodity.shopCommodity.commCode }&category=${commodity.shopcategory.categoryID }&shopID=${commodity.seller.id }&commoName=${commodity.shopCommodity.commoidtyName }"><li><img
										src=" ${commodity.shopCommodity.shopCommImages[0].imagePath}"
										style="width: 60px; height: 80px" /></li></a>
							</c:forEach>
						</c:if>
						<a href="user/perscentBonuses?orderDate=-1&orderStatus=-1"><li><img
								src="content/static/images/dian.jpg" /></li></a>
						<li><div style="margin-top: 33px;">
								<c:if test="${orderForm.orderUser.userName==null}">
                                   ${orderForm.orderUser.phone}
                         </c:if>
								<c:if test="${orderForm.orderUser.userName!=null}">
                                   ${orderForm.orderUser.userName}
                         </c:if>
							</div></li>
						<c:set var="total" value="${0}"></c:set>
						<c:forEach items="${orderForm.commodities}" var="commodity">
							<c:set var="total" value="${total + (commodity.money)}" />
						</c:forEach>
						<li><div style="margin-top: 20px;">
								<p>
									￥
									<fmt:formatNumber value="${total}" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
								</p>
								<p>在线支付</p>
							</div></li>
						<li><div style="margin-top: 20px;">
								<p>${orderForm.orderTime}</p>
							</div></li>
						<li><div style="margin-top: 20px;">
								<p>
									<c:choose>
										<c:when test="${orderForm.orderstatus =='BuyersHavePaid'}">买家已付款</c:when>
										<c:when test="${orderForm.orderstatus =='waitPayment'}">等待买家付款</c:when>
										<c:when test="${orderForm.orderstatus =='waitDelivery'}">等待卖家发货</c:when>
										<c:when test="${orderForm.orderstatus =='transitGoods'}">	卖家已发货</c:when>
										<c:when test="${orderForm.orderstatus =='consigneeSigning'}">等待收货人签单</c:when>
										<c:when
											test="${orderForm.orderstatus =='completionTransaction'}">完成交易</c:when>
										<c:when test="${orderForm.orderstatus =='closeTransaction'}">关闭交易</c:when>
										<c:when test="${orderForm.orderstatus =='refundOrderForm'}"> 退款中的订单</c:when>
										<c:when test="${orderForm.orderstatus =='refundSuccess'}">退款成功</c:when>
										<c:when test="${orderForm.orderstatus =='refundFailed'}">退款失败</c:when>
									</c:choose>
								</p>
								<p>跟踪</p>
							</div></li>
						<li><div style="margin-top: 20px;">查看</div></li>
					</ul>
				</div>
			</div>
			<div class="center_class2">
				<div class="all1">
					<div class="tuijian" style="float: left; margin-left: 40px;">我的收藏</div>
					<a href="user/collection"><div class="chakan">查看全部收藏</div></a>
				</div>
				<div class="all3">
					<ul>
						<c:forEach items="${collections}" var="collection">
							<li><img
								src="${collection.shopCommodity.shopCommImages[0].imagePath}"
								style="width: 150px; height: 160px;" />
								<div class="mask">
									<div class="name">${collection.shopCommodity.commoidtyName}</div>
									<c:if test="${collection.shopCommodity.isSpecial==true}">
										<div class="price1">
											￥
											<fmt:formatNumber
												value="${collection.shopCommodity.special*collection.shopCommodity.unitPrice}"
												pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
											/
										</div>
										<div class="price2">
											￥
											<fmt:formatNumber
												value="${collection.shopCommodity.unitPrice}"
												pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
										</div>
									</c:if>
									<c:if test="${collection.shopCommodity.isSpecial==false}">
										<input type="hidden" value="flag" name="judge"></input>
										<div class="price2">
											￥
											<fmt:formatNumber
												value="${collection.shopCommodity.unitPrice}"
												pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
										</div>
									</c:if>
									<br />
									<div class="time">${collection.shopCommodity.brand.brandName}</div>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="center_class3">
				<div class="all1">
					<div class="tuijian" style="float: left; margin-left: 40px;">热门商品</div>
				</div>
				<div class="all3">
					<ul>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>

						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
						<li><img src="images/jiu5.jpg" />
							<div class="mask">
								<div class="name">奔富蔻兰山西拉子...</div>
								<div class="price1">￥69/</div>
								<div class="price2">￥90</div>
								<div class="time">2013年产</div>
							</div></li>
					</ul>
				</div>

			</div>
		</div>
		<jsp:include page="../frontDesk/right.jsp" />
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>