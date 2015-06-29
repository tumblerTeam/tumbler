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
<title>不倒翁</title>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/right.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/jw.css" />
</head>
<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<!--banner-->
	<div class="banner">
		<jsp:include page="../frontDesk/cate.jsp" />
		<!--banner内容-->
		<div class="banner_box"></div>
	</div>
	<!--品牌专区-->
	<div class="main_box">
		<div class="content">
			<div class="all1">
				<div class="title1">
					<div class="z1">
						<h2>洋酒专区 Wine Zone</h2>
					</div>
					<a href="#"><div class="z2">查看更多>></div></a>
				</div>
				<ul>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
				</ul>
			</div>

			<div class="all1">
				<div class="title1">
					<div class="z1" style="margin-top: 0px;">
						<h2>红酒专区 Red wine Zone</h2>
					</div>
					<a href="#"><div class="z2" style="margin-top: 15px;">查看更多>></div></a>
				</div>
				<ul>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="all1">
				<div class="title1">
					<div class="z1" style="margin-top: 0px;">
						<h2>白酒专区 White spirit Zone</h2>
					</div>
					<a href="#"><div class="z2" style="margin-top: 15px;">查看更多>></div></a>
				</div>
				<ul>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="all1">
				<div class="title1">
					<div class="z1" style="margin-top: 0px;">
						<h2>啤酒专区 Beer Zone</h2>
					</div>
					<a href="#"><div class="z2" style="margin-top: 15px;">查看更多>></div></a>
				</div>
				<ul>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
					<li class="bannerdh">
						<div class="img">
							<a href="bander_class.html"><img src="images/b1.jpg" /></a>
							<div class="yy">尊尼获加</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>