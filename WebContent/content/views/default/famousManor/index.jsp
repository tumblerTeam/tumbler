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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>不倒翁</title>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/right.css" />
</head>
<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<!--banner-->
<div class="banner">
	<div class="menu_nav">
		<div class="menu_left">
		<c:forEach items="${categories }" var="category">
			<div class="list">
            	<h2><a href="#">${category.category }</a></h2>
            		<div class="list_con">
            		<c:forEach items="${category.brands }" var="brand">
	                	<a href="#">${brand.brandName }</a>
            		</c:forEach>
	                </div>
            </div>
		</c:forEach>
		</div>
	</div>
    
    <!--banner内容-->
    <div class="banner_box">
    	
    </div>
</div>
<!--酒内容-->
<div class="content">
  <div class="title"><b>名庄特卖</b><font> Chateau Sale</font></div>
  <c:forEach items="${maps }" var="map" >
  <c:if test="${fn:length(map.value)>0}">
  <div class="box">
	<div class="bander">
    	<a href="${fn:split(map.key, '<|>')[0] }"><img src="${fn:split(map.key, '<|>')[1] }"></a>
        <a href="${fn:split(map.key, '<|>')[0] }"><div class="bander_zi">${fn:split(map.key, '<|>')[2] }</div></a>
    </div>
    <c:forEach items="${map.value }" var="val" varStatus="loop">
    	<c:if test="${loop.index <2 }">
	    	<div class="bander_class" style="border-top:none;">
	    </c:if>
    	<c:if test="${loop.index >=2 }">
	    	<div class="bander_class" >
	    </c:if>
	    	<a href="#"><img src="${val.shopCommImages[0] }" /></a>
	        <a href="#"><div class="name">${val.commoidtyName }</div></a>
	        <a href="#"><div class="price1"><span>¥
									<c:if test="${!val.isSpecial }">
										<fmt:formatNumber
											value="${val.unitPrice}"
											pattern="##.##" minFractionDigits="2">
										</fmt:formatNumber>
									</c:if>
									<c:if test="${val.isSpecial }">
										<fmt:formatNumber
											value="${val.unitPrice * val.special}"
											pattern="##.##" minFractionDigits="2">
										</fmt:formatNumber>
									</c:if></div></a>
	        <a href="#"><div class="price2">￥${val.unitPrice}</div></a>
	    </div>
    </c:forEach>
    </c:if>
  </c:forEach>
  
</div>
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>