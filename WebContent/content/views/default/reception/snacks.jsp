<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小食品</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />

<link rel="stylesheet" type="text/css" href="content/static/css/sf.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/right.css" />

<!--全部分类js-->
<script>
	window.onload = function() {
		var fen = document.getElementById("fen");
		var fen_class = document.getElementById("fen_class");
		var timer = null;
		fen_class.onmouseover = fen.onmouseover = function() {
			clearTimeout(timer);
			fen_class.style.display = "block";
		};
		fen_class.onmouseout = fen.onmouseout = function() {
			timer = setTimeout(function() {
				fen_class.style.display = "none";
			}, 500);
		};
	}
</script>
</head>

<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<div class="banner">
		<jsp:include page="../frontDesk/cate.jsp" />
		<!--banner内容-->
		<div class="banner_box"></div>
	</div>
	<!--小食品列表-->
	<div class="content">
		<div class="main_sf">
			<div class="item_1">
				<div class="item_1_left">
					<a href="#"><img src="content/static/img/sf_01.jpg" /></a>
				</div>
				<div class="item_1_right">
					<a href="#"><img src="content/static/img/sf_02.jpg" /></a>
				</div>
			</div>
			<div class="item_2">
				<div style="width: 344px; height: 300px; float: left; background: url(content/static/img/sf_bg.jpg); padding-top: 30px;">
					<div class="img1">
						<a href="#"><img src="content/static/img/sf_03.png" /></a>
					</div>
					<div class="inf">
						<h3>
							<a href="#">美国进口Kirkland整粒蓝莓干</a>
						</h3>
						<div class="price">
							零售参考价:<span>¥120</span>
						</div>
						<div class="sale">
							<em>不倒翁价：</em> <span>¥89</span>
						</div>
					</div>

				</div>
				<div style="width: 423px; height: 300px; float: left; margin-left: 5px; background: url(content/static/img/sf_bg.jpg); padding-top: 30px;">
					<div class="img1">
						<a href="#"><img src="content/static/img/sf_03.png"></a>
					</div>
					<div class="inf">
						<h3>
							<a href="#">美国进口Kirkland整粒蓝莓干</a>
						</h3>
						<div class="price">
							零售参考价:<span>¥120</span>
						</div>
						<div class="sale">
							<em>不倒翁价：</em> <span>¥89</span>
						</div>
					</div>
				</div>
				<div
					style="width: 423px; height: 300px; float: right; margin-left: 5px; background: url(content/static/img/sf_bg.jpg); padding-top: 30px;">
					<div class="img1">
						<a href="#"><img src="content/static/img/sf_03.png" /></a>
					</div>
					<div class="inf">
						<h3>
							<a href="#">美国进口Kirkland整粒蓝莓干</a>
						</h3>
						<div class="price">
							零售参考价:<span>¥120</span>
						</div>
						<div class="sale">
							<em>不倒翁价：</em> <span>¥89</span>
						</div>
					</div>
				</div>
			</div>

			<ul class="item_3">
				<c:forEach items="${snacksList}" var="snacks">
					<li style="margin-left: 5px;">
						<div class="img_3">
							<a href="#"><img src="${snacks.shopCommImages[0].imagePath}" /></a>
						</div>
						<div class="inf_3">
							<h3>
								<a href="#">${snacks.commoidtyName}</a>
							</h3>
							<div class="price">
								零售参考价：<span>¥${snacks.unitPrice}</span>
							</div>
							<div class="sale">
								<em>不倒翁价</em> <span>¥${snacks.unitPrice}</span>
							</div>
							<a href="#" class="shopcar"><img
								src="content/static/images/sc.png" /></a>
						</div>
					</li>
				</c:forEach>

			</ul>


		</div>

	</div>

	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />

</body>
</html>
