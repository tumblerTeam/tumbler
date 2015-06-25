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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
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
		<div class="personal_center">
			<div class="center_class">
				<ul>
					<li><img src="images/shangjialogo.jpg"
						style="margin-top: 8px;" /></li>
					<li>
						<div class="zi" style="margin-top: 55px;">红魔鬼赤霞珠</div>
						<div class="zi">红魔鬼赤霞珠</div>
					</li>
					<li><img class="quan" src="images/quan.jpg" />
						<div class="dai">待付款</div></li>
					<li><img class="quan" src="images/quan.jpg" />
						<div class="dai">待收货</div></li>
					<li><img class="quan" src="images/quan.jpg" />
						<div class="dai">待评价</div></li>
				</ul>
			</div>
			<div class="center_class2">
				<div class="all1">
					<div class="tuijian" style="float: left; margin-left: 40px;">我的收藏</div>
					<a href="shoucang.html"><div class="chakan">查看全部收藏</div></a>
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