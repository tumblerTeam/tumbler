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
<title>不倒翁</title>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index">首页</a> > <a>我的收藏</a>
		</div>
	</div>
	<div class="personal">
		<jsp:include page="../frontDesk/left.jsp" />
		<div class="shoucang">
			<div class="all3">
				<div class="change1" id="change1" onClick="shoucang1()">商品收藏</div>
				<div class="change2" id="change2" onClick="shoucang2()">店铺收藏</div>
			</div>
			<div class="all2" id="all1" style="display: inline;">
				<ul>
					<c:forEach items="${collections }" var="collection">
						<c:if test="${collection.collectionType == 'commodity' }">
							<li><img
								src="${collection.shopCommodity.shopCommImages[0].imagePath }" />
								<div class="mask">
									<div class="name">
										<c:if
											test="${fn:length(collection.shopCommodity.commoidtyName)<=7}">${collection.shopCommodity.commoidtyName }</c:if>
										<c:if
											test="${fn:length(collection.shopCommodity.commoidtyName)>7}">${fn:substring(collection.shopCommodity.commoidtyName, 0, 7)}...</c:if>
									</div>
									<div class="price1">
										￥
										<c:if test="${collection.shopCommodity.isSpecial }">
											<fmt:formatNumber
												value="${collection.shopCommodity.unitPrice * collection.shopCommodity.special  }"
												pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
										</c:if>
										<c:if test="${!collection.shopCommodity.isSpecial }">
											<fmt:formatNumber
												value="${collection.shopCommodity.unitPrice }"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if>
										/
									</div>
									<div class="price2">￥${collection.shopCommodity.unitPrice }</div>
									<div class="time">${fn:split(fn:substring(collection.shopCommodity.commsPecs.commSpec,fn:indexOf(collection.shopCommodity.commsPecs.commSpec,',年份'),fn:indexOf(collection.shopCommodity.commsPecs.commSpec,'年,')),'-')[1]}年</div>
									<div class="btn1">
										<img src="content/static/images/sc.png" />
									</div>
									<a href="user/deleteCollection?collectionID=${collection.id }"><div
											class="btn2">取消收藏</div></a>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="all2" id="all2" style="display: none;">
				<ul>
					<c:forEach items="${collections }" var="collection">
						<c:if test="${collection.collectionType == 'shop' }">
							<li style="height: 270px;"><img
								src="${collection.shopCommodity.belongTo.shopLogo }" />
								<div class="mask">
									<div class="name">
										<c:if
											test="${fn:length(collection.shopCommodity.belongTo.shopName)<=7}">${collection.shopCommodity.belongTo.shopName }</c:if>
										<c:if
											test="${fn:length(collection.shopCommodity.belongTo.shopName)>7}">${fn:substring(collection.shopCommodity.belongTo.shopName, 0, 7)}...</c:if>
									</div>

									<a href="${collection.shopCommodity.belongTo.linkURL}"><div
											class="btn3">进入店铺</div></a> <a
										href="user/deleteCollection?collectionID=${collection.id }"><div
											class="btn2">取消收藏</div></a>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
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
	</script>
</body>
</html>