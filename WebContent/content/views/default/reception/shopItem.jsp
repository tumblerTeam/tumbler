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
<title>不倒翁</title>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/right.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/shop.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/tpfd2.css" />
<link type="text/css" rel="stylesheet" href="content/static/css/aa.css"
	source="widget" />
<script type="text/javascript"
	src="content/static/js/tumbler/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/custom.js"></script>
<script src="content/static/js/tumbler/jquery.fly.min.js"></script>
<script src="content/static/js/tumbler/spfd.js"></script>
<script src="content/static/js/tumbler/jquery.jqzoom.js"></script>
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
<style type="text/css">
/* box */
.shop_box {
	width: 399px;
	margin: 20px auto;
}

.tb-pic a {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.tb-pic a img {
	vertical-align: middle;
}

.tb-pic a {
	*display: block;
	*font-family: Arial;
	*line-height: 1;
}

.tb-thumb {
	margin: 10px 0 0;
	overflow: hidden;
}

.tb-thumb li {
	background: none repeat scroll 0 0 transparent;
	float: left;
	height: 42px;
	margin: 0 6px 0 0;
	overflow: hidden;
	padding: 1px;
}

.tb-s310,.tb-s310 a {
	height: 310px;
	width: 400px;
}

.tb-s310,.tb-s310 img {
	max-height: 450px;
	max-width: 450px;
}

.tb-s310 a {
	*font-size: 271px;
}

.tb-s40 a {
	*font-size: 35px;
}

.tb-s40,.tb-s40 a {
	height: 40px;
	width: 40px;
}

.tb-booth {
	border: 1px solid #CDCDCD;
	position: relative;
	z-index: 1;
}

.tb-thumb .tb-selected div {
	background-color: #FFFFFF;
	border: medium none;
}

.tb-thumb li div {
	border: 1px solid #CDCDCD;
}

/* div.zoomDiv { */
/* 	z-index: 999; */
/* 	top: 0px; */
/* 	left: 0px; */
/* 	width: 200px; */
/* 	height: 200px; */
/* 	background: #ffffff; */
/* 	border: 1px solid #CCCCCC; */
/* 	display: none; */
/* 	text-align: center; */
/* 	overflow: hidden; */
/* } */

/* div.zoomMask { */
/* 	position: absolute; */
/* 	background: url("content/static/images/mask.png") repeat scroll 0 0 */
/* 		transparent; */
/* 	cursor: move; */
/* 	z-index: 1; */
/* } */
</style>

<style type="text/css">
.m-sidebar {
	z-index: 2000;
	width: 100px;
	height: 30px;
	margin-left: 310px;
	margin-top: -52px;
}

.cart {
	text-align: left;
	line-height: 20px;
	margin-top: -28px;
}

.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
}

.cart i {
	width: 35px;
	height: 35px;
	display: block;
}

#msg {
	position: fixed;
	top: 82px;
	right: 0px;
	z-index: 10000;
	width: 100px;
	height: 52px;
	line-height: 52px;
	font-size: 15px;
	text-align: center;
	color: #fff;
	background: url(content/static/images/cart_03.jpg) #901531 no-repeat;
}
</style>
<script>
	$(function() {
		var i = 0;
		var offset = $("#end").offset();
		$(".addcar")
				.click(
						function(event) {
							var addcar = $(this);
							var img = addcar.parent().find('img').attr('src');
							if (i % 2 == 0) {
								var flyer = $('<img class="u-flyer" src="'+img+'">');
							} else if (i % 2 != 0) {
								var flyer = $('<img class="u-flyer" style=" display:none;" src="'+img+'">');
							}
							flyer.fly({
								start : {
									left : event.pageX,
									top : event.pageY
								},
								end : {
									left : offset.left + 200,
									top : offset.top - 140,
									width : 50,
									height : 50
								},
								onEnd : function() {
									if (i % 2 == 0) {
										i++;
										djsc();
									} else if (i % 2 != 0) {
										i = 0;
										flyer.css("display", "none");
										qxsc();
									}
									this.destory();
								}
							});
						});

	});
	function djsc() {
		$("#msg").animate({
			width : '250px',
			fontSize : '20px',
			color : '#fff'
		}, 300).fadeOut(2000, function() {
			$("#msg").css("display", "block");
			document.getElementById("enda").style.display = "none";
			$("#msg").css("width", "100px");
		});
		document.getElementById("enda").style.display = "block";
		document.getElementById("enda").style.marginLeft = "15px";
		addcar.css("cursor", "default").removeClass('orange').unbind('click');
	}
	function qxsc() {

		$("#msg").animate({
			width : '250px',
			fontSize : '20px',
			color : '#fff'
		}, 300).fadeOut(2000, function() {

			$("#msg").css("display", "block");
			document.getElementById("endb").style.display = "none";
			$("#msg").css("width", "100px");

		});
		document.getElementById("endb").style.display = "block";
		document.getElementById("endb").style.marginLeft = "15px";
	}
</script>
</head>
<body onload="ready();">
	<!--回到顶部-->
	<a href="#header"><div class="back_top"
			style="position: fixed; bottom: 10%; width: 100px; height: 60px; font-size: 14px; right: 6%;">
			<img src="content/static/images/top.png" />
			<p style="margin-top: 10px; margin-left: -10px;">回到顶部</p>
		</div> </a>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb">
		<div class="con" id="navbar">
			<a href="index">首页</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var strs = '${nvabar}';
					var str = strs.split("|");
					var $guige = "";
					for (var j = 0; j < str.length; j++) {
						if (j == 0) {
							$guige = $guige
									+ "> <a href='search/result?cateid="
									+ str[j].split("-")[0] + "'>"
									+ str[j].split("-")[1] + "</a> ";
						} else if (j == 1) {
							$guige = $guige
									+ "> <a href='javascript:void(0);'>"
									+ str[j].split("-")[1] + "</a> ";
						} else {
							$guige = $guige + "> <a href='search/result?id="
									+ str[j].split("-")[0] + "'>"
									+ str[j].split("-")[1] + "</a> ";
						}
					}
					$('#navbar').append($guige);
				});
	</script>
	<!--商品详情-->
	<div class="content">
		<div class="shop_left">
			<div class="lanrenzhijia">
				<!--商品图预览-->
				<div id="preview" class="spec-preview">
					<span class="jqzoom"><img style="width: 400px; height: 310px;"
						jqimg="../${shopCommoidty.shopCommImages[0].imagePath }"					
						src="../${shopCommoidty.shopCommImages[0].imagePath }" /></span>
				</div>
				<div class="spec-scroll">
					<a class="prev">&lt;</a> <a class="next">&gt;</a>
					<div class="items">
						<ul>
							<c:forEach items="${shopCommoidty.shopCommImages }"
								var="imageCommo" varStatus="loop">
								<li><img style="width: 40px; height: 40px;"
										src="../${imageCommo.imagePath }"
									onmousemove="preview(this);" /></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			</div>
			<!-- 缩略图begin -->
			<!-- 缩略图end -->
			<script type="text/javascript">
				$(document).ready(
						function() {

							$(".jqzoom").imagezoom();

							$("#thumblist li a").click(
									function() {
										$(this).parents("li").addClass(
												"tb-selected").siblings()
												.removeClass("tb-selected");
										$(".jqzoom")
												.attr(
														'src',
														$(this).find("img")
																.attr("mid"));
										$(".jqzoom")
												.attr(
														'rel',
														$(this).find("img")
																.attr("big"));
									});

						});
			</script>



		
		<!--商品购买-->
		<div class="shop_main">
			<div class="preview">
				<div class="shop_right">
					<div class="shop_show">
						<div class="name">
							<h1>${shopCommoidty.commoidtyName }</h1>
							<input id="commID" type="hidden"
								value="${shopCommoidty.commCode }" />
							<h3>正品保障,十万分之一的破损几率,如有破损运费由我们承担！让您买的放心！</h3>
						</div>
						<div class="summary">
							<div class="s_box">
								<div class="box_left">
									<div class="jy">
										<div class="jy_price">
											<del>原 价：</del>
										</div>
										<div class="jy_value">
											<del>¥${shopCommoidty.unitPrice }</del>
										</div>
									</div>
									<div class="s">
										<div class="s_price">不倒翁价：</div>
										<div class="s_value">
											¥
											<c:if test="${shopCommoidty.isSpecial }">
												<span class="red"> <fmt:formatNumber
														value="${shopCommoidty.unitPrice * shopCommoidty.special  }"
														pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
											</c:if>
											<c:if test="${!shopCommoidty.isSpecial }">
												<span class="red"> <fmt:formatNumber
														value="${shopCommoidty.unitPrice }" pattern="##.##"
														minFractionDigits="2">
													</fmt:formatNumber>
												</span>
											</c:if>
										</div>
									</div>
									<div class="amount">
										<span>购买数量：</span> <a href="javascript:void(0);" hidefocus
											class="reduce">-</a> <input id="buyAmount" type="text"
											class="tb-text" value="1" maxlength="8" title="请输入购买量" /> <a
											href="javascript:void(0);" hidefocus class="add">+</a>
									</div>
								</div>
								<div class="box_right">
									<div class="comment">
										累计评价：<span>${fn:length(shopCommoidty.shopreviews) }</span>
									</div>
									<div class="workoff">
										累计售出：<span>${shopCommoidty.salesVolume }</span>
									</div>
									<div class="collection">
										<a href="javascript:void(0);"
											onclick="collectionClick('toJsonFmatUtil/addCollection?commID=${shopCommoidty.commCode }');"><img
											src="content/static/images/shoucang.jpg" />加入收藏</a>
									</div>
								</div>
							</div>
							<div class="s_service">
								<div class="ps">
									<span>配 送 至：</span>
									<div class="text">乌鲁木齐新市区</div>
									<strong
										style="margin-left: 10px; font-size: 14px; color: #666;">有货</strong>
								</div>
								<div class="fw">
									<span>服 务：</span>
									<div class="fw_p">
										由<a href="javascript:void(0);"> 网酒网官方旗舰店 </a>负责发货，并提供售后服务。
									</div>
								</div>
							</div>
						</div>
						<div class="choose">
							<a href="javascript:void(0);" onclick="buyCommodity();">立即购买</a>
							<a href="javascript:void(0);" class="button orange addcar"
								onclick="buyCat();">
								<div class="box_1">加入购物车</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function buyCommodity() {
					var commID = $('#commID').val();
					var buyAmount = $('#buyAmount').val();
					location.href = 'user/buyCommodity?shopCommId=' + commID
							+ '&buyAmount=' + buyAmount;
				}
				function buyCat() {
					var commID = $('#commID').val();
					var buyAmount = $('#buyAmount').val();
					jQuery
							.ajax({
								type : 'GET',
								contentType : 'application/json',
								url : 'toJsonFmatUtil/addBuyCar?shopCommId='
										+ commID + '&buyAmount=' + buyAmount,
								dataType : 'json',
								success : function(data) {
									if (data.message == 'success') {
										alert("添加成功");
										jQuery
												.ajax({
													type : 'GET',
													contentType : 'application/json',
													url : 'toJsonFmatUtil/getBuyCatNum',
													dataType : 'json',
													success : function(data) {
														if (data.success == 'true') {
															if (data.buyCar != '') {
																$('#buyCatNum')
																		.html(
																				"购物车("
																						+ data.num
																						+ ")");
																alert(data.buyCar.carCommodities);
																//						 						$.each(data.buyCars,function(i, buyCar) {

																//						 						});
															}
															$('#buyCatNum')
																	.html(
																			"购物车("
																					+ data.num
																					+ ")");
														}
													}
												});
									} else if (data.message == 'existed') {
										alert("再次添加成功");
										jQuery
												.ajax({
													type : 'GET',
													contentType : 'application/json',
													url : 'toJsonFmatUtil/getBuyCatNum',
													dataType : 'json',
													success : function(data) {
														if (data.success == 'true') {
															if (data.buyCar != '') {
																$('#buyCatNum')
																		.html(
																				"购物车("
																						+ data.num
																						+ ")");
																alert(data.buyCar.carCommodities);
																//						 						$.each(data.buyCars,function(i, buyCar) {

																//						 						});
															}
															$('#buyCatNum')
																	.html(
																			"购物车("
																					+ data.num
																					+ ")");
														}
													}
												});
									} else if (data.message == "nouser") {
										if (confirm('您还没有登录哦！')) {
											var url = "user/regist";
											window.location = url;
										}
									}
								}
							});
				}
			</script>
			<!--右侧商铺-->
			<div class="shop_sort">
				<div class="brand">
					<div class="brand_logo">
						<a href="${shopCommoidty.belongTo.linkURL}"><img
							src="${shopCommoidty.belongTo.shopLogo}" /></a>
					</div>
					<div class="brand_seller">
						<a href="${shopCommoidty.belongTo.linkURL}">${shopCommoidty.belongTo.shopName}</a>
					</div>
					<div class="shop_enter">
						<a href="${shopCommoidty.belongTo.linkURL}">进入店铺</a> <a
							href="javascript:void(0);"
							onclick="collectionClick('toJsonFmatUtil/addCollection?shopID=${shopCommoidty.belongTo.id }');">收藏店铺</a>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function collectionClick(paramUrl) {
					jQuery.ajax({
						type : 'GET',
						contentType : 'application/json',
						url : paramUrl,
						dataType : 'json',
						success : function(data) {
							if (data.success == "true") {
								alert('亲，已经加入收藏夹了哦！');
							}

							else if (data.success == "existed") {
								alert('收藏夹已经有这个宝贝了，亲是有多喜欢她啊！');
							}

							else if (data.success == "nouser") {
								if (confirm('您还没有登录哦！')) {
									var url = "user/regist";
									window.location = url;
								}
							}
						}
					});
				}
			</script>
			<!--商品参数详情-->
			<div class="shop_desc">
				<div class="desc_tt">
					<div class="desc_tab1">
						<a href="javascript:void(0);">商品详情</a>
					</div>
					<div class="desc_tab2">
						<a href="javascript:void(0);">商品评价</a>
					</div>
				</div>
				<div class="desc_main">
					<div class="parameter_list">
						<div class="shop_name">
							品牌名称：<span><a href="javascript:void(0);">${shopCommoidty.brand.brandName }</a></span>
						</div>
						<ul class="detail_list">
							<c:forEach items="${map }" var="keySet">
								<c:if test="${keySet.key == '颜色' }">
									<div class="choice_color">
										颜色：
										<c:forEach items="${keySet.value }" var="spec">
											<c:set var="index1" value="${fn:indexOf(spec, '$') }"></c:set>
											<c:set var="index2" value="${fn:length(spec) }"></c:set>
											<li><img src="${fn:substring(spec, index1+1, index2)}" /></span>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${keySet.key != '颜色' }">
									<div class="choice_cm">
										<c:forEach items="${keySet.value }" var="spec">
											<li>${keySet.key }：${spec }</li>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
							<c:if
								test="${shopCommoidty.probablyWeight != null && shopCommoidty.probablyWeight != ''}">
								<li>重量： ${shopCommoidty.probablyWeight }kg</li>
							</c:if>
							<c:if test="${shopCommoidty.commAttribute!=null}">
								<c:if
									test="${shopCommoidty.commAttribute.alcoholDegree != null}">
									<li>度数：${shopCommoidty.commAttribute.alcoholDegree}%</li>
								</c:if>
								<li>年份：${shopCommoidty.commAttribute.particularYear}年</li>
								<c:if
									test="${shopCommoidty.commAttribute.deadline != null && shopCommoidty.commAttribute.deadline !=''}">
									<li>保质期：${shopCommoidty.commAttribute.deadline}天</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.stockWay != null && shopCommoidty.commAttribute.stockWay !=''}">
									<li>储藏方法：${shopCommoidty.commAttribute.stockWay}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.foodAdditive != null && shopCommoidty.commAttribute.foodAdditive !=''}">
									<li>食品添加剂：${shopCommoidty.commAttribute.foodAdditive}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.productPlace != null && shopCommoidty.commAttribute.productPlace != ''}">
									<li>产地：${shopCommoidty.commAttribute.productPlace}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.productProvince != null && shopCommoidty.commAttribute.productProvince != ''}">
									<li>省份：${shopCommoidty.commAttribute.productProvince}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.packManner != null && shopCommoidty.commAttribute.packManner !=''}">
									<li>包装：${shopCommoidty.commAttribute.packManner}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.packManner != null && shopCommoidty.commAttribute.packManner !=''}">
									<li>配料：${shopCommoidty.commAttribute.packManner}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.soberTime != null && shopCommoidty.commAttribute.soberTime !=''}">
									<li>醒酒时间：${shopCommoidty.commAttribute.soberTime}h</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.drinkTemperature != null && shopCommoidty.commAttribute.drinkTemperature != ''}">
									<li>饮用温度：${shopCommoidty.commAttribute.drinkTemperature}℃</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.drinkTemperature != null && shopCommoidty.commAttribute.drinkTemperature != ''}">
									<li>生产许可编号：${shopCommoidty.commAttribute.drinkTemperature}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.productStddNum != null && shopCommoidty.commAttribute.productStddNum !=''}">
									<li>生产标准号：${shopCommoidty.commAttribute.productStddNum}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.productStddNum != null && shopCommoidty.commAttribute.productStddNum !=''}">
									<li>生产厂名：${shopCommoidty.commAttribute.productStddNum}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.productFactoryAddress != null && shopCommoidty.commAttribute.productFactoryAddress != ''}">
									<li>生产工厂地址：${shopCommoidty.commAttribute.productFactoryAddress}</li>
								</c:if>
								<c:if
									test="${shopCommoidty.commAttribute.productTime != null && shopCommoidty.commAttribute.productTime != ''}">
									<li>生产时期：${shopCommoidty.commAttribute.productTime}</li>
								</c:if>
							</c:if>
						</ul>
					</div>

					<div class="shop_banner">
						<!-- 						<img src="content/static/img/shop/1.jpg" /> <img -->
						<!-- 							src="content/static/img/shop/2.jpg" /> -->
						${shopCommoidty.describes}
					</div>
					<div class="description"></div>
				</div>
				<!--评价-->
				<c:set value="0" var="hao"></c:set>
				<c:set value="0" var="zhong"></c:set>
				<c:set value="0" var="cha"></c:set>
				<div class="eval">
					<div class="general feature_tour">
						<div class="middle">
							<div class="wrapper">
								<div class="tab">
									<a href="#" class="current" style="">全部（<c:out
											value="${hao+zhong+cha }"></c:out>）
									</a><a href="#">好评（${hao }）</a><a href="#">中评（${zhong }）</a><a
										href="#">差评（${cha }）</a>
								</div>
								<div class="mask">
									<div class="maskCon">
										<div id="con1" class="innerCon">
											<div class="eval_list">
												<c:forEach items="${reviewslist }" var="review">
													<ul class="comments-item">
														<li><label style="margin-left: 20px; float: left;">
																<c:if test="${review.reviewsRank == 'good' }">好评</c:if>
																<c:if test="${review.reviewsRank == 'better' }">中评</c:if>
																<c:if test="${review.reviewsRank == 'bad' }">差评</c:if>
														</label></li>
														<li>
															<div style="float: left;">${review.reviews }</div>
														</li>
														<li>
															<div>买家 ： ${review.user.userName }</div>
															<div
																style="float: left; margin-left: 100px; color: #ccc;">[${review.reviewsdate }
																${review.reviewTime }]</div>
														</li>
													</ul>
												</c:forEach>
											</div>
										</div>
										<div id="con2" class="innerCon">
											<div class="eval_list">
												<c:forEach items="${reviewslist }" var="review">
													<c:if test="${review.reviewsRank == 'good' }">
														<ul class="comments-item">
															<li><label style="margin-left: 20px; float: left;">
																	<c:if test="${review.reviewsRank == 'good' }">好评</c:if>
															</label></li>
															<li>
																<div style="float: left;">${review.reviews }</div>
															</li>
															<li>
																<div>买家 ： ${review.user.userName }</div>
																<div
																	style="float: left; margin-left: 100px; color: #ccc;">[${review.reviewsdate }
																	${review.reviewTime }]</div>
															</li>
														</ul>
													</c:if>
												</c:forEach>
											</div>
										</div>
										<div id="con3" class="innerCon">
											<div class="eval_list">
												<c:forEach items="${reviewslist }" var="review">
													<c:if test="${review.reviewsRank == 'better' }">
														<ul class="comments-item">
															<li><label style="margin-left: 20px; float: left;">
																	<c:if test="${review.reviewsRank == 'better' }">中评</c:if>
															</label></li>
															<li>
																<div style="float: left;">${review.reviews }</div>
															</li>
															<li>
																<div>买家 ： ${review.user.userName }</div>
																<div
																	style="float: left; margin-left: 100px; color: #ccc;">[${review.reviewsdate }
																	${review.reviewTime }]</div>
															</li>
														</ul>
													</c:if>
												</c:forEach>
											</div>
										</div>
										<div id="con4" class="innerCon">
											<div class="eval_list">
												<c:forEach items="${reviewslist }" var="review">
													<c:if test="${review.reviewsRank == 'bad' }">
														<ul class="comments-item">
															<li><label style="margin-left: 20px; float: left;">
																	<c:if test="${review.reviewsRank == 'bad' }">差评</c:if>
															</label></li>
															<li>
																<div style="float: left;">${review.reviews }</div>
															</li>
															<li>
																<div>买家 ： ${review.user.userName }</div>
																<div
																	style="float: left; margin-left: 100px; color: #ccc;">[${review.reviewsdate }
																	${review.reviewTime }]</div>
															</li>
														</ul>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="eval_fy"></div>
				</div>
			</div>
			<!--右侧商品推荐-->
			<div class="shop_recommend">
				<div class="mt">
					<h2>热门销售</h2>
				</div>
				<div class="mc">
					<ul>
						<li style="border-top: none;">
							<div class="mc_img">
								<a href="javascript:void(0);"><img src="images/jiu7.jpg"></a>
							</div>
							<div class="mc_name">
								<a href="javascript:void(0);">澳大利亚 黄尾袋鼠梅洛红葡萄酒 2014 进口红酒</a>
							</div>
							<div class="mc_price">
								<strong class="mc_1">￥50.00</strong>
							</div>
						</li>
						<li>
							<div class="mc_img">
								<a href="javascript:void(0);"><img src="images/jiu7.jpg"></a>
							</div>
							<div class="mc_name">
								<a href="javascript:void(0);">澳大利亚 黄尾袋鼠梅洛红葡萄酒 2014 进口红酒</a>
							</div>
							<div class="mc_price">
								<strong class="mc_1">￥50.00</strong>
							</div>
						</li>
						<li>
							<div class="mc_img">
								<a href="javascript:void(0);"><img src="images/jiu7.jpg"></a>
							</div>
							<div class="mc_name">
								<a href="javascript:void(0);">澳大利亚 黄尾袋鼠梅洛红葡萄酒 2014 进口红酒</a>
							</div>
							<div class="mc_price">
								<strong class="mc_1">￥50.00</strong>
							</div>
						</li>
						<li>
							<div class="mc_img">
								<a href="javascript:void(0);"><img src="images/jiu7.jpg"></a>
							</div>
							<div class="mc_name">
								<a href="javascript:void(0);">澳大利亚 黄尾袋鼠梅洛红葡萄酒 2014 进口红酒</a>
							</div>
							<div class="mc_price">
								<strong class="mc_1">￥50.00</strong>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>