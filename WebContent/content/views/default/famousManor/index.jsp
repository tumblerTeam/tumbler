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
  <c:if test="${map.value !=null}">
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
	        <a href="#"><div class="price2">￥${hong.unitPrice}</div></a>
	    </div>
    </c:forEach>
    </c:if>
  </c:forEach>
  <div class="box">
	<div class="bander">
    	<a href="#"><img src="content/static/img/band2_03.jpg"></a>
        <a href="#"><div class="bander_zi">奔富酒庄的故事就是一部欧洲人一名澳洲分都有成功的历史，反映了澳洲过去二百年的发展。有荒芜的大陆成为现在稳站世界舞台的先进国家。创办人克里斯多夫.洛神.奔富医生一百六十多年期来到澳洲，开始了葡萄酒传奇之路</div></a>
    </div>
   <div class="bander_class" style="border-top:none; border-left:none;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class" style="border-top:none;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class" style="border-top:none; ">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡..</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
    <div class="bander_class" style=" border-left:none;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name" style="margin-left:20px;">奔富寇兰山西拉子解伯纳红葡..</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
    <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
    <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class" style="width:203px;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡..</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
  </div>
  <div class="box">
	<div class="bander">
    	<a href="#"><img src="content/static/img/band1_03.jpg"></a>
        <a href="#"><div class="bander_zi">拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。</div></a>
    </div>
    <div class="bander_class" style="border-top:none; border-left:none;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class" style="border-top:none;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class" style="border-top:none; ">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡..</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
    <div class="bander_class" style=" border-left:none;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name" style="margin-left:20px;">奔富寇兰山西拉子解伯纳红葡..</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
    <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
    <div class="bander_class">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡萄酒</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
     <div class="bander_class" style="width:203px;">
    	<a href="#"><img src="content/static/img/jiu1_03.jpg" /></a>
        <a href="#"><div class="name">奔富寇兰山西拉子解伯纳红葡..</div></a>
        <a href="#"><div class="price1">￥96</div></a>
        <a href="#"><div class="price2">￥155</div></a>
    </div>
  </div>
</div>
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>