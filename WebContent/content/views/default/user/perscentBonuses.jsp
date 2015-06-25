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
				<dd>商品操作</dd>
				<dd>实付款（元）</dd>
				<dd>卖家已发货</dd>
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
									<fmt:formatNumber value="${commodity.price }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
								</dd>
								<dd>${commodity.quantity }</dd>
								<dd style="padding-top: 35px;">
									退款/退货<br />投诉卖家
								</dd>
								<dd style="padding-top: 35px;">
									<fmt:formatNumber value="${commodity.money }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
									<br />
								</dd>
								<dd style="padding-top: 35px;">
									卖家已发货<br /> <a href="#">订单详情</a><br /> <a href="#">查看物流</a>
								</dd>
								<dd>
									<div class="shouhuo">确认收货</div>
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