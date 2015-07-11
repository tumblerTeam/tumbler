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
<meta name="description" content="CSS3 Full Screen Vertical Scroller with jQuery animation fallback" />
<meta name="viewport" content="width=device-width, user-scalable=no" />
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/right.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/daxuewen1012.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/animation.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/b_style.css" />
<style>
.left li.ysli {
	background: url(content/static/images/tab.png) scroll 0px 25px no-repeat;
	font-weight: bold;
}

.yslia {
	background: url(content/static/images/tab.png) scroll 0px 25px no-repeat;
}
.bgimg {
	opacity: 0.3;
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
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "首页"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
                                  if(item.adverDistribution.position=='首页大眼睛'){
                                	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 571px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                                  }else if(item.adverDistribution.position=='首页强力推荐A1'){
                                	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                                  }else if(item.adverDistribution.position=='首页强力推荐A2'){
                                	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                                  }else if(item.adverDistribution.position=='首页强力推荐A3'){
                                	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                                  }else if(item.adverDistribution.position=='首页网站热卖A'){
                                	     $("#test1_1").append("<dd><a href=\""+item.link+"\"><div class=\"list_box\"><img src=\""+item.imagePath+"\"/></div></a></dd>");
                                  }else if(item.adverDistribution.position=='首页网站热卖B'){
                                	     $("#test1_2").append("<dd><a href=\""+item.link+"\"><div class=\"list_box\"><img src=\""+item.imagePath+"\"/></div></a></dd>");
                                  }else if(item.adverDistribution.position=='首页网站热卖C'){
                                	     $("#test1_3").append("<dd><a href=\""+item.link+"\"><div class=\"list_box\"><img src=\""+item.imagePath+"\"/></div></a></dd>");
                                  }else if(item.adverDistribution.position=='首页网站小促销'){
                                	     $("#Adv_8").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 115px; background: url("+item.imagePath+") center center;\"></div></a>");
                                  }else if(item.adverDistribution.position=='名庄推荐'){
                                	     $("#Adv_9").append("<li><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a></li>");
                                  }else if(item.adverDistribution.position=='红酒馆主推'){
                                	     $("#Adv_10").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                                  }else if(item.adverDistribution.position=='红酒馆单品'){
                                	     $("#Adv_11").append( "<li class=\"jgca\"><a href=\""+item.link+"\"><div class=\"p_img\"><img src=\""+item.imagePath+"\"/></div></a></li>");
                                  }else if(item.adverDistribution.position=='白酒馆主推'){
                                	     $("#Adv_12").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                                  }else if(item.adverDistribution.position=='白酒馆单品'){
                                	     $("#Adv_13").append( "<li class=\"jgca\"><a href=\""+item.link+"\"><div class=\"p_img\"><img src=\""+item.imagePath+"\"/></div></a></li>");
                                  }else if(item.adverDistribution.position=='洋酒馆主推'){
                                	     $("#Adv_14").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                                  }else if(item.adverDistribution.position=='洋酒馆单品'){
                                	     $("#Adv_15").append( "<li class=\"jgca\"><a href=\""+item.link+"\"><div class=\"p_img\"><img src=\""+item.imagePath+"\"/></div></a></li>");
                                  }else if(item.adverDistribution.position=='啤酒馆主推'){
                                	     $("#Adv_16").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                                  }else if(item.adverDistribution.position=='啤酒馆单品'){
                                	     $("#Adv_17").append( "<li class=\"jgca\"><a href=\""+item.link+"\"><div class=\"p_img\"><img src=\""+item.imagePath+"\"/></div></a></li>");
                                  }else if(item.adverDistribution.position=='首页滚动条幅'){
                                	     $("#Adv_18").append(   "<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 100px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                                  }else if(item.adverDistribution.position=='周边主推'){
                                	     $("#Adv_19").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                                  }else if(item.adverDistribution.position=='周边单品'){
                                	     $("#Adv_20").append( "<li class=\"jgca\"><a href=\""+item.link+"\"><div class=\"p_img\"><img src=\""+item.imagePath+"\"/></div></a></li>");
                                  }
        			   });//动态生成广告
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
		        				$(".banner-box2").slide({
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
        		   
         });
</script>
</head>
<body>

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

	<script type="text/javascript">
		function tab(o, s, cb, ev) { //tab切换类
			var $ = function(o) {
				return document.getElementById(o)
			};
			var css = o.split((s || '_'));
			if (css.length != 4)
				return;
			this.event = ev || 'onclick';
			o = $(o);
			if (o) {
				this.ITEM = [];
				o.id = css[0];
				var item = o.getElementsByTagName(css[1]);
				var j = 1;
				for (var i = 0; i < item.length; i++) {
					if (item[i].className.indexOf(css[2]) >= 0
							|| item[i].className.indexOf(css[3]) >= 0) {
						if (item[i].className == css[2])
							o['cur'] = item[i];
						item[i].callBack = cb || function() {
						};
						item[i]['css'] = css;
						item[i]['link'] = o;
						this.ITEM[j] = item[i];
						item[i]['Index'] = j++;
						item[i][this.event] = this.ACTIVE;
					}
				}
				return o;
			}
		}
		tab.prototype = {
			ACTIVE : function() {
				document.getElementById("test1_1").style.display = "none";
				var $ = function(o) {
					return document.getElementById(o)
				};
				this['link']['cur'].className = this['css'][3];
				this.className = this['css'][2];

				try {

					$(this['link']['id'] + '_' + this['link']['cur']['Index']).style.display = 'none';
					$(this['link']['id'] + '_' + this['Index']).style.display = 'block';
				} catch (e) {
				}
				this.callBack.call(this);
				this['link']['cur'] = this;
			}
		}
	</script>
	<jsp:include page="frontDesk/header.jsp" />
	<!--banner-->
	<div class="banner">
		<div id="csdiv" style="border: 0px solid red; width: 290px; height: 570px; float: left; position: absolute; z-index: 9999; right: -300px;">
		</div>
		
		<div class="menu_nav" id="menu_nav">
			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 1 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
							<c:if test="${category.categoryID == 1 }">
								<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 2 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 2 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 3 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 3 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 4 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 4 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 5 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 5 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
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
									<c:if
										test="${cate2.parentLevel.categoryID == category.categoryID}">
										<c:forEach items="${cate2.children }" var="cate3">
											<c:set var="loop" value="${loop + 1 }"></c:set>
											<c:if test="${loop < 7 }">
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
									<c:if test="${loop.index < 7 }">
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
			$(document).ready(
					function() {
						$(".list").hover(
								function() {
									$(this).animate({
										width : 192
									}, 300).css("backgroundColor", "#A71234");
									$(".showdivs").eq($(".list").index(this))
											.animate({
												width : 500
											}, 300).css("display", "block"); /*鼠标移入右边*/
									var listindex = $(".list").index(this); //当前悬停list索引
									$(".showdivs").hover(
											function() {
												$(this).eq(
														$(".list").index(this))
														.animate({
															width : 500
														}, 300).css("display",
																"block");
												$(".list").eq(
														$(".showdivs").index(
																this)).css(
														"backgroundColor",
														"#A71234");
											},
											function() {

												$(this).eq(
														$(".list").index(this))
														.animate({
															width : 500
														}, 300).css("display",
																"none");
												$(".list").eq(
														$(".showdivs").index(
																this)).css(
														"backgroundColor",
														"#901531");
											});
								},
								function() {
									$(this).animate({
										width : 192
									}, 300).css("backgroundColor", "#901531");
									$(".showdivs").eq($(".list").index(this))
											.animate({
												width : 500
											}, 300).css("display", "none");
								});
					});
		</script>
		<!--banner内容-->
		<div class="banner-box">
			<div class="bd">
				<ul id="Adv_1">
				</ul>
			</div>
			<div class="banner-btn">
				 <a class="prev" href="javascript:void(0);"></a>
                 <a class="next" href="javascript:void(0);"></a> 
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
				<ul id="test1_li_ysli_" class="tab_menu">
					<li class="ysli" id="ysli"><a href="javascript:void(0);">
							<h3>名庄特卖</h3>
					</a></li>
					<li>
						<h3>每日精选</h3>
					</li>
					<li>
						<h3>超值整箱购</h3>
					</li>
				</ul>

				<dl class="tab_list" id="test1_1">
<!-- 				     5号广告位 -->
			   </dl>
				<dl class="tab_list" id="test1_2" style="display: none;">
<!-- 				     6号广告位 -->
				</dl>
				<dl class="tab_list" id="test1_3" style="display: none;">
<!-- 					 7号广告位 -->
				</dl>


			</div>
			<script type="text/javascript">
				window.onload = function() {
					new tab('test1_li_ysli_', '_', null, 'onmouseover');
					new tab('news_li_yslia_', '_', null, 'onmouseover');
				};
			</script>
			<div class="right">
				<ul class="news" id="news_li_yslia_">
					<li id="yslia" class="yslia"><a href="proscenium/getNews?id=1">促销活动</a></li>
					<li><a href="proscenium/getNews?id=2">最新公告</a></li>
				</ul>

				<ul class="news_con" id="news_1">

					<c:set var="loop" value="0"></c:set>
					<c:forEach items="${newsList }" var="ns">
						<c:if test="${ns.announType == 'activity' && loop < 6}">
							<li><a href="${ns.activityUrl }">${ns.title }</a></li>
							<c:set var="loop" value="${loop +1 }"></c:set>
						</c:if>
					</c:forEach>
				</ul>

				<ul class="news_con" id="news_2" style="display: none;">
					<c:set var="loop" value="0"></c:set>
					<c:forEach items="${newsList }" var="ns">
						<c:if test="${ns.announType == 'news' && loop < 6}">
							<li><a href="proscenium/getNewDetails?newId=${ns.noticeId }">${ns.title}</a></li>
							<c:set var="loop" value="${loop +1 }"></c:set>
						</c:if>
					</c:forEach>
				</ul>
				<div class="news_banner" id="Adv_8"></div>
			</div>
		</div>

		<!--世界名庄-->
		<div class="column">
			<div class="column_tt">
				<div class="column_h1">
					<b>世界名庄</b> <span>World Wine</span>
				</div>
			</div>

			<ul class="column_01"  id="Adv_9">
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
				<div class="jg2"  id="Adv_10">
				</div>
				<ul class="jg3"   id="Adv_11">
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
				<div class="jg2" id="Adv_12">
				</div>
				<ul class="jg3" id="Adv_13">
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
				<div class="jg2" id="Adv_14">
				</div>
				<ul class="jg3" id="Adv_15">
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
				<div class="jg2" id="Adv_16">
				</div>
				<ul class="jg3" id="Adv_17">
				</ul>
			</div>
		</div>
          		<!--banner2-->
        <div class="banner-box2">
            <div class="bd"> 
                <ul id="Adv_18">          	    
                </ul>
            </div>
            <div class="hd"><ul></ul></div>
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
	            <div class="jg2" id="Adv_19">
				</div>
				<ul class="jg3" id="Adv_20">
				</ul>
			</div>
		</div>
	</div>
	<!--脚部-->
	<jsp:include page="frontDesk/foot.jsp" />
</body>
</html>
