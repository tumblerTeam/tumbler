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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>不倒翁</title>
<meta name="description"
	content="CSS3 Full Screen Vertical Scroller with jQuery animation fallback" />
<meta name="viewport" content="width=device-width, user-scalable=no" />
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/right.css" />
<link href="content/static/css/daxuewen1012.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/animation.css" />
<link href="content/static/css/b_style.css" rel="stylesheet"
	type="text/css" />
<style>
.left li.ysli {
	background: url(content/static/images/tab.png) scroll 0px 25px no-repeat;
	font-weight: bold;
}

.yslia {
	background: url(content/static/images/tab.png) scroll 0px 25px no-repeat;
}
</style>
<!--搜索框-->
<script>
	window.onload = function() {
		var d1 = document.getElementById("hj");
		d1.onclick = function() {
			d1.placeholder = "";
		}

	}
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#csdiv").animate({
				width : 290
			}, 5000).css("transition", "all 0.5s").css("right", "350px");

			$(".prev,.next").hover(function() {
				$(this).stop(true, false).fadeTo("show", 0.9);
			}, function() {
				$(this).stop(true, false).fadeTo("show", 0.4);
			});

			$(".banner-box").slide({
				titCell : ".hd ul",
				mainCell : ".bd ul",
				effect : "fold",
				interTime : 3500,
				delayTime : 500,
				autoPlay : true,
				autoPage : true,
				trigger : "click"
			});

		});
	</script>
	<style>
.bgimg {
	opacity: 0.3;
}
</style>
	<script>
		$(function() {
			$("#csdiv")
					.children(this)
					.hover(
							function() {
								var index = $("#csdiv").children(this).index(
										this); //当前鼠标悬停索引
								$(this).css("position", "all 1s").css(
										"marginLeft", "1px");

								var a = new Array(3);
								a[0] = 0;
								a[1] = 1;
								a[2] = 2;
								for (var i = 0; i < a.length; i++) {
									if (index == i) {
									} else {
										$("#csdiv").children(this).eq(i).text(
												"");
										$("#csdiv")
												.children(this)
												.eq(i)
												.html(
														"<img class='bgimg' src='content/static/images/bgblack.jpg'/>");
									}
								}
							},
							function() {
								$(this).css("position", "all 0.1s").css(
										"marginLeft", "0px");
								$("#csdiv").children(this).html(" ");
							});

		});
	</script>
	<!--顶部内容-->
	<jsp:include page="frontDesk/header.jsp" />
	<!--banner-->
	<div class="banner">
		<div id="csdiv"
			style="border: 0px solid red; width: 290px; height: 570px; float: left; position: absolute; z-index: 9999; right: -300px;">
			<div
				style="width: 100%; height: 185px; margin-top: 5px; background: url(images/chushi1.jpg)"></div>
			<div
				style="width: 100%; height: 185px; margin-top: 5px; background: url(images/chushi2.jpg)"></div>
			<div
				style="width: 100%; height: 185px; margin-top: 5px; background: url(images/chushi3.jpg)"></div>
		</div>
		<div class="menu_nav" id="menu_nav">
			<div class="showdivs">1</div>

			<div class="showdivs">2</div>

			<div class="showdivs">3</div>

			<div class="showdivs">4</div>

			<div class="showdivs">5</div>
			<div class="menu_left" style="z-index: 999;">
				<c:forEach items="${categories }" var="category">
					<c:if test="${category.categoryID != 3 }">
						<div class="list">
							<h2>
								<a href="search/result?cateid=${category.categoryID }">${category.category }</a>
							</h2>
							<div class="list_con">
								<c:set value="0" var="loop"></c:set>
								<c:forEach items="${category.children }" var="cate2">
									<c:if test="${cate2.parentLevel.categoryID == category.categoryID}">
										<c:forEach items="${cate2.children }" var="cate3">
											<c:set var="loop" value="${loop + 1 }"></c:set>
											<c:if test="${loop < 12 }">
												<a href="search/result?id=${cate3.categoryID }">${cate3.category }</a>
											</c:if>
										</c:forEach>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:if>
					<c:if test="${category.categoryID == 3 }">
						<div class="list">
							<h2>
								<a href="search/result?cateid=${category.categoryID }">${category.category }</a>
							</h2>
							<div class="list_con">
								<c:forEach items="${category.brands }" var="brand"
									varStatus="loop">
									<c:if test="${loop.index < 10 }">
										<a
											href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<script>
		$(document).ready(function(){ $(".list").hover(function(){
		$(this).animate({width:192},300) .css("backgroundColor","#A71234");
		$(".showdivs").eq($(".list").index(this)).animate({width:500},300)
		.css("display","block"); /*鼠标移入右边*/ var
		listindex=$(".list").index(this); //当前悬停list索引
		$(".showdivs").hover(function(){
		$(this).eq($(".list").index(this)).animate({width:500},300)
		.css("display","block");
		$(".list").eq($(".showdivs").index(this)).css("backgroundColor","#A71234");
		},function(){

		$(this).eq($(".list").index(this)).animate({width:500},300)
		.css("display","none");
		$(".list").eq($(".showdivs").index(this)).css("backgroundColor","#901531");
		}); },function(){ $(this).animate({width:192},300)
		.css("backgroundColor","#901531");
		$(".showdivs").eq($(".list").index(this)).animate({width:500},300)
		.css("display","none"); }); });

		</script>
		<!--banner内容-->
		<div class="banner_box">
			<div class="bd">
				<ul>
					<li style="">
						<div class="m-width"
							style="width: 100%; height: 571px; background: url(images/img1.jpg) center center;"></div>
					</li>
					<li style="background: #B01415">
						<div class="m-width"
							style="width: 100%; height: 571px; background: url(images/img2.jpg) center center;">
						</div>
					</li>
					<li style="background: #C49803;">
						<div class="m-width"
							style="width: 100%; height: 571px; background: url(images/img1.jpg) center center;">
						</div>
					</li>
					<li style="background: #FDFDF5">
						<div class="m-width"
							style="width: 100%; height: 571px; background: url(images/img2.jpg) center center;">
						</div>
					</li>
				</ul>
			</div>
			<div class="banner-btn">
				<a class="prev" href="javascript:void(0);"></a> <a class="next"
					href="javascript:void(0);"></a>
			</div>
			<div class="hd">
				<ul></ul>
			</div>
		</div>
	</div>
	<!--酒品内容-->
	<div class="main_box">
		<div class="main">
			<div class="left">
				<ul class="tab_menu">
					<li><a href="javascript:void(0);">
							<h3>名庄特卖</h3>
					</a></li>
					<li>
						<h3>每日精选</h3>
					</li>
					<li>
						<h3>超值整箱购</h3>
					</li>
				</ul>
				<dl class="tab_list">
					<dd>
						<div class="list_box"></div>
					</dd>
					<dd>
						<div class="list_box"></div>
					</dd>
					<dd>
						<div class="list_box"></div>
					</dd>
					<dd>
						<div class="list_box"></div>
					</dd>
					<dd>
						<div class="list_box"></div>
					</dd>
					<dd style="border-right: 0;">
						<div class="list_box"></div>
					</dd>
				</dl>


			</div>
			<div class="right">
				<ul class="news">
					<li>促销活动</li>
					<li>最新公告</li>
				</ul>
				<dl class="news_con">
					<c:set var="loop" value="0"></c:set>
					<c:forEach items="${newsList }" var="ns">
						<c:if test="${ns.announType == 'news' && loop < 6}">
							<dd>
								<a href="javascript:void(0);">${ns.title }</a>
							</dd>
							<c:set var="loop" value="${loop +1 }"></c:set>
						</c:if>
					</c:forEach>
				</dl>
				<dl class="news_con" style="display: none;">
					<c:set var="loop" value="0"></c:set>
					<c:forEach items="${newsList }" var="ns">
						<c:if test="${ns.announType == 'activity' && loop < 6}">
							<dd>
								<a href="javascript:void(0);">${ns.title }</a>
							</dd>
							<c:set var="loop" value="${loop +1 }"></c:set>
						</c:if>
					</c:forEach>
				</dl>
				<div class="news_banner"></div>
			</div>
		</div>

		<!--世界名庄-->
		<div class="column">
			<div class="column_tt">
				<div class="column_h1">
					<b>世界名庄</b> <span>World Wine</span>
				</div>
				<ul class="more">
					<c:forEach items="${famouss }" var="famous" varStatus="loop">
						<c:if test="${loop.index<5 }">
							<c:choose>
								<c:when test="${loop.index%2==0 }">
									<li><a
										href="search/result?cateid=1&famousid=famousid-${famous.id }">${famous.manorName }</a></li>
								</c:when>
								<c:otherwise>
									<li class="site-nav-pipe">|</li>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${loop.index==4 }">
							<li><a href="famousManor/index"><b>更多></b></a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>

			<ul class="column_01">
				<c:forEach items="${famouss }" var="famous" varStatus="loop">
					<c:if test="${loop.index <8  }">
						<c:choose>
							<c:when test="${loop.index%4==0 }">
								<li style="margin-right: 0px;">
							</c:when>
							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>
						<a href="search/result?cateid=1&famousid=famousid-${famous.id }"><img
							src="${famous.logoPath }" />
							<h1>
								<span style="margin-right: 0.5em"></span>${famous.manorName }
							</h1></a>
						<p>
							<a href="search/result?cateid=1&famousid=famousid-${famous.id }">${famous.title }</a>
						</p>

						</li>
					</c:if>
				</c:forEach>

			</ul>
		</div>
		<!--酒馆-->
		<div class="column_02">
			<div class="column_tt">
				<div class="column_h1">
					<b>红酒馆</b> <span>Red Wine</span>
				</div>
				<div class="more_tt">
					<a href="search/result?cateid=1"><b>进入红酒馆></b></a>
				</div>
			</div>

			<div class="main_02">
				<div class="jg1">
					<div class="list_01">
						<p>
							<b>红酒类型</b>
						</p>
					</div>
					<ul class="jg_list1">
						<li style="margin-top: 10px;"><a href="javascript:void(0);">干红</a></li>
						<li style="margin-top: 10px;"><a href="javascript:void(0);">半干红</a></li>
						<li><a href="javascript:void(0);">甜红</a></li>
						<li><a href="javascript:void(0);">半甜红</a></li>
						<li><a href="javascript:void(0);">干白</a></li>
						<li><a href="javascript:void(0);">半干白</a></li>
						<li><a href="javascript:void(0);">甜白</a></li>
						<li><a href="javascript:void(0);">贵腐</a></li>
					</ul>
					<div class="list_02">
						<p>
							<b>红酒产区</b>
						</p>
					</div>
					<ul class="jg_list2">
						<li><a href="search/result?cateid=1&spec=,原产地-罗讷河谷">罗讷河谷</a></li>
						<li><a href="javascript:void(0);">香槟</a></li>
						<li><a href="javascript:void(0);">波尔多</a></li>
						<li><a href="javascript:void(0);">勃艮第</a></li>
					</ul>
				</div>
				<div class="jg2">
					<a href="javascript:void(0);"><img
						src="content/static/img/jg_banner.jpg" /></a>
				</div>
				<ul class="jg3">
					<c:forEach var="hong" items="${hongjiu }" varStatus="loop">
						<c:if test="${loop.index == 5 }">
							<li style="margin: 0px; width: 200px;">
						</c:if>
						<c:if test="${loop.index != 5 }">
							<li>
						</c:if>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="${hong.shopCommImages[0].imagePath }" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>${hong.commoidtyName }</p> <span>¥ <c:if
											test="${!hong.isSpecial }">
											<fmt:formatNumber value="${hong.unitPrice}" pattern="##.##"
												minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> <c:if test="${hong.isSpecial }">
											<fmt:formatNumber value="${hong.unitPrice * hong.special}"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> /<del style="color: #b0b0b0;">${hong.unitPrice}</del></span>
								</a>
							</div>
						</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!--白酒馆-->
		<div class="column_03">
			<div class="column_tt">
				<div class="column_h1">
					<b>白酒馆</b> <span>Red Wine</span>
				</div>
				<div class="more_tt">
					<a href="search/result?cateid=2"><b>进入白酒馆></b></a>
				</div>
			</div>

			<div class="main_02">
				<div class="jg1">
					<div class="list_01">
						<p>
							<b>白酒类型</b>
						</p>
					</div>
					<ul class="jg_list1">
						<li style="margin-top: 20px;"><a href="javascript:void(0);">茅台</a></li>
						<li style="margin-top: 20px;"><a href="javascript:void(0);">五粮液</a></li>
						<li><a href="javascript:void(0);">汾酒</a></li>
						<li style="padding: 0px 15px;"><a href="javascript:void(0);">泸州老窖</a></li>
						<li><a href="javascript:void(0);">酱香型</a></li>
						<li style="padding: 0px 15px;"><a href="javascript:void(0);">浓香型</a></li>
					</ul>
					<div class="list_02">
						<p>
							<b>白酒产区</b>
						</p>
					</div>
					<ul class="jg_list2">
						<li><a href="javascript:void(0);">贵州</a></li>
						<li><a href="javascript:void(0);">四川</a></li>
						<li><a href="javascript:void(0);">山西</a></li>
						<li><a href="javascript:void(0);">北京</a></li>
					</ul>
				</div>
				<div class="jg2">
					<a href="javascript:void(0);"><img
						src="content/static/img/jg_banner2.jpg" /></a>
				</div>
				<ul class="jg3">
					<c:forEach var="bai" items="${baijiu }" varStatus="loop">
						<c:if test="${loop.index == 5 }">
							<li style="margin: 0px; width: 200px;">
						</c:if>
						<c:if test="${loop.index != 5 }">
							<li>
						</c:if>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="${bai.shopCommImages[0].imagePath }" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>${bai.commoidtyName }</p> <span>¥ <c:if
											test="${!bai.isSpecial }">
											<fmt:formatNumber value="${bai.unitPrice}" pattern="##.##"
												minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> <c:if test="${bai.isSpecial }">
											<fmt:formatNumber value="${bai.unitPrice * bai.special}"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> /<del style="color: #b0b0b0;">${bai.unitPrice}</del></span>
								</a>
							</div>
						</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--洋酒馆-->
		<div class="column_04">
			<div class="column_tt">
				<div class="column_h1">
					<b>洋酒馆</b> <span>Red Wine</span>
				</div>
				<div class="more_tt">
					<a href="search/result?cateid=4"><b>进入洋酒馆></b></a>
				</div>
			</div>

			<div class="main_02">
				<div class="jg1">
					<div class="list_01">
						<p>
							<b>洋酒类型</b>
						</p>
					</div>
					<ul class="jg_list1">
						<li style="margin-top: 20px;"><a href="javascript:void(0);">威士忌</a></li>
						<li style="margin-top: 20px;"><a href="javascript:void(0);">伏特加</a></li>
						<li><a href="javascript:void(0);">力娇酒</a></li>
						<li><a href="javascript:void(0);">白兰地</a></li>
						<li><a href="javascript:void(0);">朗姆酒</a></li>
						<li><a href="javascript:void(0);">干邑</a></li>
					</ul>
					<div class="list_02">
						<p>
							<b>洋酒产区</b>
						</p>
					</div>
					<ul class="jg_list2">
						<li><a href="javascript:void(0);">美国</a></li>
						<li><a href="javascript:void(0);">苏格兰</a></li>
						<li><a href="javascript:void(0);">俄罗斯</a></li>
						<li><a href="javascript:void(0);">法国</a></li>
					</ul>
				</div>
				<div class="jg2">
					<a href="javascript:void(0);"><img
						src="content/static/img/yjg_banner.jpg" /></a>
				</div>
				<ul class="jg3">
					<c:forEach var="yang" items="${yangjiu }" varStatus="loop">
						<c:if test="${loop.index == 5 }">
							<li style="margin: 0px; width: 200px;">
						</c:if>
						<c:if test="${loop.index != 5 }">
							<li>
						</c:if>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="${yang.shopCommImages[0].imagePath }" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>${yang.commoidtyName }</p> <span>¥ <c:if
											test="${!yang.isSpecial }">
											<fmt:formatNumber value="${yang.unitPrice}" pattern="##.##"
												minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> <c:if test="${yang.isSpecial }">
											<fmt:formatNumber value="${yang.unitPrice * yang.special}"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> /<del style="color: #b0b0b0;">${yang.unitPrice}</del></span>
								</a>
							</div>
						</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--啤酒馆-->
		<div class="column_05">
			<div class="column_tt">
				<div class="column_h1">
					<b>啤酒馆</b> <span>Red Wine</span>
				</div>
				<div class="more_tt">
					<a href="search/result?cateid=3"><b>进入啤酒馆></b></a>
				</div>
			</div>

			<div class="main_02">
				<div class="jg1">
					<div class="list_01">
						<p>
							<b>啤酒品牌</b>
						</p>
					</div>
					<ul class="jg_list1">
						<li style="margin-top: 20px;"><a href="javascript:void(0);">青岛</a></li>
						<li style="margin-top: 20px;"><a href="javascript:void(0);">瓦伦丁</a></li>
						<li><a href="javascript:void(0);">奥丁格</a></li>
						<li style="padding: 0px 15px;"><a href="javascript:void(0);">百威</a></li>
						<li><a href="javascript:void(0);">雪花</a></li>
						<li style="padding: 0px 15px;"><a href="javascript:void(0);">喜力</a></li>
					</ul>
					<div class="list_02">
						<p>
							<b>啤酒类型</b>
						</p>
					</div>
					<ul class="jg_list2">
						<li><a href="javascript:void(0);">黄啤酒</a></li>
						<li><a href="javascript:void(0);">黑啤酒</a></li>
						<li><a href="javascript:void(0);">白啤酒</a></li>
					</ul>
				</div>
				<div class="jg2">
					<a href="javascript:void(0);"><img
						src="content/static/img/jg_banner2.jpg" /></a>
				</div>
				<ul class="jg3">
					<c:forEach var="pi" items="${pijiu }" varStatus="loop">
						<c:if test="${loop.index == 5 }">
							<li style="margin: 0px; width: 200px;">
						</c:if>
						<c:if test="${loop.index != 5 }">
							<li>
						</c:if>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="${pi.shopCommImages[0].imagePath }" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>${pi.commoidtyName }</p> <span>¥ <c:if
											test="${!pi.isSpecial }">
											<fmt:formatNumber value="${pi.unitPrice}" pattern="##.##"
												minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> <c:if test="${pi.isSpecial }">
											<fmt:formatNumber value="${pi.unitPrice * pi.special}"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if> /<del style="color: #b0b0b0;">${pi.unitPrice}</del></span>
								</a>
							</div>
						</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!--banner2-->
		<div class="banner2">
			<a href="javascript:void(0);"><img
				src="content/static/img/banner3.jpg" /></a>
		</div>


		<!--其他-->
		<div class="column_06">
			<div class="column_tt">
				<div class="column_h1">
					<b>其他</b> <span>Other</span>
				</div>
				<ul class="more">
					<li><a href="javascript:void(0);">醒酒器</a></li>
					<li class="site-nav-pipe">|</li>
					<li><a href="javascript:void(0);">酒柜</a></li>
					<li class="site-nav-pipe">|</li>
					<li><a href="javascript:void(0);">酒杯</a></li>
					<li class="site-nav-pipe">|</li>
					<li><a href="search/result?cateid=5"><b>更多></b></a></li>
				</ul>
			</div>

			<div class="main_02">
				<div class="jg1">
					<ul class="ot_list">
						<li><a href="javascript:void(0);">新潮</a></li>
						<li><a href="javascript:void(0);">新潮</a></li>
						<li><a href="javascript:void(0);">新潮</a></li>
						<li><a href="javascript:void(0);">新潮</a></li>
					</ul>
				</div>
				<div class="jg2">
					<a href="javascript:void(0);"><img
						src="content/static/img/ot_banner.jpg" /></a>
				</div>
				<ul class="jg3">
					<li>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="content/static/img/51483107351769163_MD.jpg" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>石岛牌3119型红酒杯</p> <span>¥29/<del
											style="color: #b0b0b0;">¥38</del></span>
									<p>2015年产</p>
								</a>
							</div>
						</div>
					</li>
					<li>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="content/static/img/20473653226472527_MD.jpg" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>52°五粮液(股份)唐王宴珍品750ml</p> <span>¥158/<del
											style="color: #b0b0b0;">¥244</del></span>
									<p>2014年产</p>
								</a>
							</div>
						</div>
					</li>
					<li>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="content/static/img/11056210852146909_MD.jpg" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>52°五粮液(股份)唐王宴珍品750ml</p> <span>¥158/<del
											style="color: #b0b0b0;">¥244</del></span>
									<p>2014年产</p>
								</a>
							</div>
						</div>
					</li>
					<li>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="content/static/img/19241986366557447_MD.jpg" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>52°五粮液(股份)唐王宴珍品750ml</p> <span>¥158/<del
											style="color: #b0b0b0;">¥244</del></span>
									<p>2014年产</p>
								</a>
							</div>
						</div>
					</li>

					<li>
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="content/static/img/20050103564906169_MD.jpg" /></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>52°五粮液(股份)唐王宴珍品750ml</p> <span>¥158/<del
											style="color: #b0b0b0;">¥244</del></span>
									<p>2014年产</p>
								</a>
							</div>
						</div>
					</li>

					<li style="margin: 0px; width: 200px;">
						<div class="p_img">
							<a href="javascript:void(0);"><img
								src="content/static/img/3890622308968659_MD.jpg"></img></a>
						</div>
						<div class="p_name">
							<div class="p_name_text">
								<a href="javascript:void(0);">
									<p>52°五粮液(股份)唐王宴珍品750ml</p> <span>¥158/<del
											style="color: #b0b0b0;">¥244</del></span>
									<p>2014年产</p>
								</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--脚部-->
	<jsp:include page="frontDesk/foot.jsp" />
</body>
</html>
