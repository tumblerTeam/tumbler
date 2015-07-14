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
</style>
<style>
	.bgimg{ opacity:0.3;}
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
<script>

</script>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "首页"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
        				//  alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
                                  if(item.adverDistribution.position=='首页大眼睛'){
                                	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 450px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                                  }else if(item.adverDistribution.position=='首页强力推荐A1'){
                                	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;border-bottom:1px #ccc dashed;background: url("+item.imagePath+") center center;\"></div></a>");
                                  }else if(item.adverDistribution.position=='首页强力推荐A2'){
                                	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;background: url("+item.imagePath+") center center;\"></div></a>");
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
        			   if(window.screen.width<=1680){
        					$("#csdiv").animate(
        								{width:190},5000).css("transition","all 0.5s").css("right","120px");
        						}else{
        					$("#csdiv").animate(
        								{width:190},5000).css("transition","all 0.5s").css("right","350px");
        						}
        						 		
        					$(".prev,.next").hover(function(){
        						$(this).stop(true,false).fadeTo("show",0.9);
        					},function(){
        						$(this).stop(true,false).fadeTo("show",0.4);
        					});
        					
        					$(".banner-box").slide({
        						titCell:".hd ul",
        						mainCell:".bd ul",
        						effect:"fold",
        						interTime:3500,
        						delayTime:500,
        						autoPlay:true,
        						autoPage:true, 
        						trigger:"click" 
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
		        				//start
		        				$("#csdiv").children(this).hover(function(){
		            				var index=$("#csdiv").children(this).index($(this)); //当前鼠标悬停索引
		            				var a = new Array(2);
		            				a[0]=0;
		            				a[1]=1;
		            			
		            				for(var i=0;i<a.length;i++){
		            					if(index==i){
		    		            			$("#csdiv").children(this).eq(i).children($("#csdiv").children(this).eq(i)).html("");
		            						}else{
		            							$("#csdiv").children(this).eq(i).children($("#csdiv").children(this).eq(i)).html("<img class='bgimg' src='content/static/images/bgblack.jpg'/>");
		            							}
		            					}
		            				},function(){
		            			$(this).css("position","all 0.1s").css("marginLeft","0px");
		            			$("#csdiv").children(this).children($("#csdiv").children(this)).find("img").remove();
		            				});
		            			//end
        		   });
         });
</script>


</head>
<body>

	
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
<style>
	.bgimg{ opacity:0.3;}
</style>
	<!--banner-->
	<div class="banner">
		<div id="csdiv"  style="border:0px solid #fff; width:190px; height:450px; float:left; position:absolute; z-index:9999; right:-300px;" >
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
						<c:if test="${category.categoryID == 6 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 6 }">
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
			        <a class="prev" style="display:none;" href="javascript:void(0);"></a>
                    <a class="next" style="display:none;" href="javascript:void(0);"></a>  
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
	<div class="menu_l" id="menu_l">
<style>
.list00 li.bg_wg{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px 0;}
.list00 li.bg_pm{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px -40px;}
.list00 li.bg_pz{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px -80px;}
.list00 li.bg_xt{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px -120px;}
.list00 li.bg_pz2{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px -160px;}
.list00 li.bg_xh{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px -200px;}
.list00 li.bg_sr{background:url("content/static/images/menu_bg.png")/*tpa=http://y1.ifengimg.com/314bd925cdd17196/2014/1014/menu_bg.gif*/ no-repeat -67px -239px;}
.list00 li.bg_sr,.list00 li.bg_sr a{height:40px; line-height:40px;}
</style>
<div id="fixedTopDiv">
  <ul class="list00"  id="scrollNavTab">
    <li class="bg_wg"><a>世界名庄</a></li>
    <li class="bg_pm"><a >红酒馆</a></li>
    <li class="bg_pz"><a>白酒馆</a></li>
    <li class="bg_xt"><a>洋酒馆</a></li>
    <li class="bg_pz2"><a>啤酒馆</a></li>
    <li class="bg_xh"><a>其他</a></li>
    <li onClick="location.href='index'"  class="bg_sr"><a>返回顶部</a></li>
  </ul>
</div>
<script>
//20141009 李震庸
$(function () {
	/*$(".list00 li a").hover(function () {
		$(this).animate({right:31,width:68},200)
		        .css("background","#901531");
	}, function () {
		$(this).css("background","#A40C59");
		if (!$(this).hasClass("currentClass")) {
			$(this).animate({right:31,width:0},200)
		        .css("background","").css("display","none");
		};
		
	});*/
	$(".list00 li").hover(function () {
		$(this).find("a").animate({right:30},300).css("display","block").css("width","68px").css("color","#fff").css("backgorundColor","#BC261F");
	}, function () {
		$(this).find("a").animate({right:0},300).css("display","none").css("width","0px").css("backgorundColor","none");
		
	});
}
);

</script>
 	
<script>
	//20141009 李震庸
	jQuery(document).ready(function ($){
		//增加一个当前样式for滚轮滚动js用
		var currentClass = "currentClass";
		//固定效果
		var attentionTop = jQuery("#fixedTopDiv").offset().top;	
		var attentionHeight = jQuery("#fixedTopDiv").outerHeight();
		var aList = $("#scrollNavTab li a");
		var scrollBodyDivChildren = $("#slidedesc2").find(".kuangm01");
		var divChiOffsetTopArray = (function (){
			var arr = [];
			for(var i = 0 ; i < scrollBodyDivChildren.length ; i ++){
				arr[i] = $(scrollBodyDivChildren[i]).offset().top;
			}
			return arr;
		})();
		var lastChiHeight = divChiOffsetTopArray[divChiOffsetTopArray.length-1] + scrollBodyDivChildren.eq(scrollBodyDivChildren.length-1).height();
		//导航右侧scroll
		$("#scrollNavTab li").click(function (){
			var index = $("#scrollNavTab li").index(this);
			
			$('html,body').stop().animate(
				{scrollTop: scrollBodyDivChildren.eq(index).offset().top},
				700,
				function(){
					//aList.removeClass(currentClass).eq(index).addClass(currentClass);	
				}
			);  
		});
		//误差
		var  wucha = 10;
		//滑动时，改变导航焦点颜色
		function scrollFix(){
			var scrollTop01 = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
			if(scrollTop01>200){						
			   document.getElementById("menu_l").className="menu_l02"
				}
			else{
				document.getElementById("menu_l").className="menu_l";
				}	
			var top=$(document).scrollTop() + wucha;
			for(var i = 0; i < divChiOffsetTopArray.length; i++){
				if(top >= divChiOffsetTopArray[i] && ((i==divChiOffsetTopArray.length-1) || top < divChiOffsetTopArray[i+1]) ){
					//aList.removeClass(scrollStyle).eq(i).addClass(scrollStyle);
					var m = aList.index($(".currentClass"));
					if (m>-1) {
						if (m==i) {
							return;
						}else{
							aList.eq(m).removeClass("currentClass")
									   .stop().animate({right:31,width:0},200)
									   .css("background","").css("display","none");
							aList.eq(i).addClass("currentClass")
									   .stop().animate({right:31,width:68},200)
									   .css("background","#BC261F");
						}
					}else if (top>=divChiOffsetTopArray[0] && top<=divChiOffsetTopArray[1]) {
						//第一次
						aList.eq(0).addClass("currentClass")
								   .stop().animate({right:31,width:68},200)
								   .css("background","#BC261F");		
					}else if (top-20<=divChiOffsetTopArray[divChiOffsetTopArray.length-1] && top-20>=divChiOffsetTopArray[divChiOffsetTopArray.length-2]) {
						//第一次
						aList.eq(aList.size()-1).addClass("currentClass")
								   .stop().animate({right:31,width:68},200)
								   .css("background","#BC261F");		
					}		
				}else if (top < divChiOffsetTopArray[0]){
					//第一条的未滚到
					aList.eq(0).removeClass("currentClass")
								.stop().animate({right:31,width:0},200)
								.css("background","").css("display","none");
				}else if (top >= lastChiHeight ) {
					//最后一条
					aList.eq(aList.size()-1).removeClass("currentClass")
								.stop().animate({right:31,width:0},200)
								.css("background","").css("display","none");
				};
			}
		}
		window.onscroll=scrollFix; 
		window.onresize=scrollFix; 
	});
</script>  
</div>
		<div id="waidiv" style="width:100px; position:fixed; z-index:999; top:100px; right:130px;" >
	<div id="xx" onClick="gb()" style="position:fixed; top:98px; z-index:9999; right:136px; display:none;" ><a href="javascrpt:;" ><img src="content/static/images/xx.png"/></a></div>
    	<img class="overimg" src="content/static/images/wzxt.png" width="46" style="margin-left:25px;"  />
        <div style="color:#901531; text-align:center;" >下载APP<br/>首单立减8元</div>
    <img class="wxxs" style="position:fixed; top:190px; right:131px; z-index:999999;" src="content/static/images/wx.jpg" width="100" />
    </div>
    <script>
      $("#waidiv").hover(function(){
		  $(".wxxs").css("display","block");
		  $("#xx").css("display","block");
		  },function(){
		  $("#xx").css("display","none");
		  });
		 $("#waidiv").hover(function(){
		  $("#xx").css("display","block");
		  },function(){
		  $("#xx").css("display","none");
		  }); 
		  $("#xx").hover(function(){
		  $("#xx").css("display","block");
		  },function(){
		  });
		  
		 function gb(){
			 $("#waidiv").animate({},200).css("display","none");
			 }
		 }
    </script>
</body>
</html>
