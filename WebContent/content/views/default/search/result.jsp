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
<link rel="stylesheet" type="text/css" href="content/static/css/jw.css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#jg").click(function() {
			$("#jiage").slideToggle("slow");
		});
		$("#jg1").click(function() {
			$("#jiage1").slideToggle("slow");
		});
	});
</script>
<!--更多分类-->
<script type="text/ecmascript">
	
	var boolean=true;
	function f1(){
		var gd=document.getElementsByClassName("navgd");
		var btn=document.getElementById("btn");	
		if(boolean==true){
			for (var i = 0; i < gd.length; i++) {
				gd[i].style.display="block";
			}
			btn.innerHTML="收起";
			boolean=false;
			}else if(boolean==false){
				for (var i = 0; i < gd.length; i++) {
					gd[i].style.display="none";
				}
				btn.innerHTML="更多选项";	
				boolean=true;
				}
		}
		function f2(){
		var div2=document.getElementById("big");
		div2.style.borderColor="red";
		}
		function f3(){
		var div2=document.getElementById("big");
		div2.style.borderColor="#ccc";
		}
		function f4(){
			var pp1=document.getElementById("pp1");
			var pp2=document.getElementById("pp2");
			pp1.style.color="red";
			pp2.style.borderColor="red";
		}
		function f5(){
			var pp1=document.getElementById("pp1");
			var pp2=document.getElementById("pp2");
			pp1.style.color="#000";
			pp2.style.borderColor="#ccc";
		}

</script>
<script type="text/ecmascript">
	
	
	function f6(){
		var pp1=document.getElementById("pp1");
	    var text1=document.getElementById("text1");
		var bdiv=document.getElementById("nav2");
		var pp2=document.getElementById("pp2");
		if(boolean==true){
			text1.style.display="block";
			pp1.innerHTML="收起";
			bdiv.style.transition="all 0.1s";
			bdiv.style.border="2px solid #ccc";
			pp2.style.background="url(images/gd2.png)";
			pp2.style.backgroundPosition="2px 2px";
			boolean=false;
			}else{
			bdiv.style.border="0px solid #ccc";
			bdiv.style.borderTop="1px solid #ccc";
				text1.style.display="none";
				pp1.innerHTML="更多";
				boolean=true;	
				pp2.style.background="url(content/static/images/gd.png)";
				}
		}
	function f7(){
		var pp1=document.getElementById("pp7");
	    var text1=document.getElementById("text7");
		var bdiv=document.getElementById("nav7");
		var pp2=document.getElementById("pp8");
		if(boolean==true){
			text1.style.display="block";
			pp1.innerHTML="收起";
			bdiv.style.transition="all 0.1s";
			bdiv.style.border="2px solid #ccc";
			pp2.style.background="url(images/gd2.png)";
			pp2.style.backgroundPosition="2px 2px";
			boolean=false;
			}else{
			bdiv.style.border="0px solid #ccc";
			bdiv.style.borderTop="1px solid #ccc";
				text1.style.display="none";
				pp1.innerHTML="更多";
				boolean=true;	
				pp2.style.background="url(content/static/images/gd.png)";
				}
		}
		function gbred(){	
		var pp2=document.getElementById("pp2");
		pp2.style.transition="all 0.4s";
		pp2.style.borderColor="red";
		pp2.style.backgroundPosition="2px 17px";
			}
		function gbredt(){	
		var pp2=document.getElementById("pp2");
		pp2.style.transition="all 0.7s";
		pp2.style.borderColor="#ccc";
		pp2.style.backgroundPosition="2px 2px";
			}


</script>
</head>
<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--品牌详情-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%; margin-top: 10px;">
		<div class="con" style="width: 1200px; margin: 0px auto;" id="navbar">
			<a href="index">首页</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var strs = '${nvabar}';
							var str = strs.split("|");
							var $guige = "";
							var $guige1 = "";
							var language = $("#language").val();
							var special = "";
							if (language == 'chinese') {
								special = "折扣";
							} else if (language == 'russina') {
								special = "我是俄文折扣";
							}
							var brand = "";
							if (language == 'chinese') {
								brand = "名品街";
							} else if (language == 'russina') {
								brand = "我是俄文名品街";
							}
							for (var j = 0; j < str.length; j++) {
								if (j == 0) {

									if ('${page}' == 'brand') {
										$guige = $guige
												+ "> <a href='..proscenium/categoryLei?id=-1&page=brand'>"
												+ brand + "</a> ";
									} else if ('${page}' == 'special') {
										$guige = $guige
												+ "> <a href='..proscenium/categoryLei?id=-1&page=special'>"
												+ special + "</a> ";
									} else {
										$guige = $guige
												+ "> <a href='search/result?cateid="
												+ str[j].split("-")[0] + "'>"
												+ str[j].split("-")[1]
												+ "</a> ";
									}
								} else {
									$guige = $guige + "> <a href='#'>"
											+ str[j].split("-")[1] + "</a> ";
								}
								if (j == str.length - 1) {
									$guige1 = "" + str[j].split("-")[1]
											+ "</a> <div class='clear'></div>";
								}
							}

							if ('${page}' == 'search') {
								if (language == 'chinese') {
									$('#navbar').append("搜索结果");
									$('#title').append("搜索结果");
								} else if (language == 'russina') {
									$('#navbar').append("我是俄文搜索结果");
									$('#title').append("我是俄文搜索结果");
								}

							} else {
								$('#navbar').append($guige);
								$('#title').append($guige1);
							}
						});
	</script>
	<div class="bander_class_all">
		<div class="top">
			<!--<h2>洋酒</h2>-->
			<div class="nav1" style="border-top: none;">
				<span style="margin: 10px 100px 0px 15px; float: left;">价格：</span>
				<ul>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="0-89" onclick="searchs('0@89','money');">0-89</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="90-199" onclick="searchs('90@199','money');">90-199</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="200-299" onclick="searchs('200@299','money');">200-299</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="300-399" onclick="searchs('300@399','money');">300-399</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="400-499" onclick="searchs('400@499','money');">400-499</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="500-599" onclick="searchs('500@599','money');">500-599</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="600-699" onclick="searchs('600@699','money');">600-699</a></li>
					<li><a href="javascript:void(0);" rel="nofollow" class="black"
						title="700以上" onclick="searchs('700@%','money');">700以上</a></li>
					<li><input style="width: 30px; margin-left: 10px;" id="money1"
						type="text" /> - <input id="money2" style="width: 30px;"
						type="text" /> <input style="width: 40px; margin-left: 10px;"
						type="button" onclick="searchMoney();" value="确定" /></li>
				</ul>
			</div>
			<c:if test="${not empty famousManors }">
				<div class="nav2" id="nav7">
					<span style="margin: 10px 100px 0px 15px; float: left;">名庄：</span>
					<div class="list">
						<ul style="float: left;">
							<c:forEach items="${famousManors }" var="famous" varStatus="loop">
								<c:if test="${loop.index < 4 }">
									<li><input name="searchFamous" type="radio"
										onclick="searchs('${famous.id }','famousid');"
										value="${famous.id }" />${famous.manorName }</li>
								</c:if>
							</c:forEach>
							<li class="lired" onMouseOver="gbred()" onMouseOut="gbredt()">
								<div class="right_gd" id="pp7" onClick="f7()">更多</div>
								<div class="small" id="pp8"></div>
							</li>
						</ul>
						<ul style="display: none;" id="text7">
							<c:forEach items="${famousManors }" var="famous" varStatus="loop">
								<c:if test="${loop.index >3 }">
									<li><input name="searchFamous" type="radio"
										onclick="searchs('${famous.id }','famous');"
										value="${famous.id }" />${famous.manorName }</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:if>
			<div class="nav2" id="nav2">
				<span style="margin: 10px 100px 0px 15px; float: left;">品牌：</span>
				<div class="list">
					<ul style="float: left;">
						<c:forEach items="${brands }" var="brand" varStatus="loop">
							<c:if test="${loop.index < 4 }">
								<li><input name="searchBrand" type="radio"
									onclick="searchs('${brand.brandID }','brand');"
									value="${brand.brandID }" />${brand.brandName }</li>
							</c:if>
						</c:forEach>
						<li class="lired" onMouseOver="gbred()" onMouseOut="gbredt()">
							<div class="right_gd" id="pp1" onClick="f6()">更多</div>
							<div class="small" id="pp2"></div>
						</li>
					</ul>
					<ul style="display: none;" id="text1">
						<c:forEach items="${brands }" var="brand" varStatus="loop">
							<c:if test="${loop.index > 3 }">
								<li><input name="searchBrand" type="checkbox"
									onclick="searchs('${brand.brandID }','brand');"
									value="${brand.brandID }" />${brand.brandName }</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<c:forEach items="${specifications }" var="spec" varStatus="loop">
				<c:set value="${fn:split(spec.attribute, ',') }" var="attrs"></c:set>
				<c:choose>
					<c:when test="${spec.specificatName == '颜色' }">
						<c:if test="${loop.index == 0 }">
							<div class="nav1">
								<span style="margin: 10px 100px 0px 15px; float: left;">${spec.specificatName }：</span>
								<ul style="float: left;">
						</c:if>
						<c:if test="${loop.index > 0 }">
							<div class="navgd" style="display: none;">
								<span style="margin: 10px 100px 0px 15px; float: left;">${spec.specificatName }：</span>
								<ul style="float: left;">
						</c:if>
						<c:forEach items="${attrs }" var="attr">
							<c:choose>
								<c:when test="${attr == '黑色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="黑色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #000;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '灰色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="灰色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #999;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '白色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="白色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #fff;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '粉色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="粉色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #fdd;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '红色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="红色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #f00;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '玫红色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="玫红色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #f08;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '紫色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="紫色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #a2e;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '蓝色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="蓝色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #18f;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '绿色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="绿色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #0b2;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '橙色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="橙色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #f80;"></span><b></b></a></li>
								</c:when>
								<c:when test="${attr == '驼色'}">
									<li><a href="javascript:void(0);" rel="nofollow" class="black" title="驼色"><span
											onclick="searchs('${attr}','${spec.specificatName }');"
											style="background-color: #b97;"></span><b></b></a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:if test="${loop.index == 0 }">
							<div class="nav1">
								<span style="margin: 10px 100px 0px 15px; float: left;">${spec.specificatName }：</span>
								<ul style="float: left;">
						</c:if>
						<c:if test="${loop.index > 0 }">
							<div class="navgd" style="display: none;">
								<span style="margin: 10px 100px 0px 15px; float: left;">${spec.specificatName }：</span>
								<ul style="float: left;">
						</c:if>
						<c:forEach items="${attrs }" var="attr">
							<li><a href="javascript:;"
								onclick="searchs('${attr}','${spec.specificatName }');"
								class="black" title="${attr }">${attr }</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</ul>
		</div>
		</c:forEach>
		<div class="big" id="big" onMouseOver="f2()" onMouseOut="f3()">
			<a><div class="gd" id="btn" onClick="f1()">更多选项</div></a>
		</div>
	</div>
	<form action="search/result" id="paramForm" method="post">
		<input id="params" name="params" type="hidden" value="${params }" />
		<input id="orderByPice"
			name="orderByPice" type="hidden" value="${orderByPice }" /> <input
			id="haoping" name="haoping" type="hidden" value="${haoping }" /> <input
			id="id" name="id" type="hidden" value="${id }" /> <input id="cateid"
			name="cateid" type="hidden" value="${cateid }" /> <input id="page"
			name="page" type="hidden" value="${page }" /> 
	</form>
	<script type="text/javascript">
		function searchMoney() {
			var isok = false;
			var str = "";
			var searchParam = $('#params').val();
			var guize = searchParam.split(',');
			var money = $('#money1').val() + "@" + $('#money2').val();
			for (var i = 1; i < guize.length; i++) {
				if (guize[i].split('-')[0] == 'money') {
					guize[i] = "money-" + money;
					str = str + "," + guize[i];
					isok = true;
				} else {
					str = str + "," + guize[i];
				}
			}
			if (!isok) {
				str = str + ",money-" + money;
			}
			if (guize.length == 1) {
				$('#params').val(",money-" + money);
			} else {
				$('#params').val(str);
			}
			$('#paramForm').submit();
		}
		function searchs(obj, name) {
			var isok = false;
			var str = "";
			var check = "";
			var searchParam = $('#params').val();
			var guize = searchParam.split(',');
			for (var i = 1; i < guize.length; i++) {
				if (guize[i].split('-')[0] == name) {
					guize[i] = name + "-" + obj;
					str = str + "," + guize[i];
					isok = true;
				} else {
					str = str + "," + guize[i];
				}
			}
			if (!isok) {
				str = str + "," + name + "-" + obj;
			}
			if (guize.length == 1) {
				$('#params').val("," + name + "-" + obj);
			} else {
				$('#params').val(str + check);
			}
			$('#paramForm').submit();
		}

		$(document).ready(function() {
			var searchParam = $('#params').val();
			var guize = searchParam.split(',');
			var ze = "";
			var ze2 = "";
			for (var i = 0; i < guize.length; i++) {
				if (guize[i].split('-')[0] == 'brand') {
					ze = ze + "," + guize[i].split('-')[1];
				}
				if (guize[i].split('-')[0] == 'famousid') {
					ze2 = ze2 + "," + guize[i].split('-')[1];
				}
			}
			var zes2 = ze2.split(',');
			var zes = ze.split(',');
			$("input[name='searchFamous']").each(function() {
				for (var j = 0; j < zes2.length; j++) {
					if ($(this).val() == zes2[j]) {
						$(this).attr('checked', true);
					}
				}
			});

			$("input[name='searchBrand']").each(function() {
				for (var j = 0; j < zes.length; j++) {
					if ($(this).val() == zes[j]) {
						$(this).attr('checked', true);
					}
				}
			});
		});
		$(document).ready(function(e) {
			var navLi = $("#navhd ul li"), navUl = $("#navhd ul"), speed = 0;
			function OnClick() {
				n = navUl.find("li.on").index();
				navUl.stop().animate({
					backgroundPositionX : navLi.width() * n + 57
				}, speed);
			}
			OnClick();
			navLi.hover(function() {
				n = $(this).index();
				navUl.stop().animate({
					backgroundPosition : navLi.width() * n + 57,
					backgroundPositionY : 0
				}, speed);
			}, function() {
				OnClick();
			})
			navLi.click(function() {
				$(this).addClass("on").siblings().removeClass("on")
			});
			$(window).scroll(function() {
				if ($(window).scrollTop() > $("#nav").height() + 50) {
					$("#nav").addClass("scoll_nav")
				} else {
					$("#nav").removeClass("scoll_nav")
				}
			});
		});
		$(document).ready(function() {

			$(".slider li").click(function() {
				$(this).addClass("current").siblings().removeClass("current");
				var onclkj = $(this).parents("h").siblings("a").find("img");
				$(onclkj).attr('src', $(this).find("img").attr("src"));
			});

		});
	</script>
	<div class="buttom">
		<div class="left_ad">
			<div class="product">
				<div class="tuijian">为你推荐</div>
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
				<hr />
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
				<hr />
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
				<hr />
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
			</div>
			<div class="product">
				<div class="tuijian">为你推荐</div>
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
				<hr />
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
				<hr />
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
				<hr />
				<div class="shop_class">
					<div class="img">
						<img src="images/shop1.jpg" />
					</div>
					<div class="jieshao">
						查梅尔庄园干红葡萄酒<br />Chateau Charmail<br />Chateau Charmail
					</div>
				</div>
			</div>
		</div>
		<!--商品展示 		 -->
		<div class="center">
			<div class="order">
				<ul>
					<li style="cursor: pointer;"><a><span id="jg1">销量</span></a>
						<div class="jiage" id="jiage1">
							<a href="javascript:void(0);"
								onclick="onClickOrderBy('orderByXiao','DESC');"><span>销量从高到低</span></a><br />
							<a href="javascript:void(0);"
								onclick="onClickOrderBy('orderByXiao','ASC');"><span>销量从低到高</span></a>
						</div></li>
					<li style="cursor: pointer;"><a><span id="jg">价格</span></a>
						<div class="jiage" id="jiage">
							<a href="javascript:void(0);"
								onclick="onClickOrderBy('orderByPice','DESC');"><span>价格从高到低</span></a><br />
							<a href="javascript:void(0);"
								onclick="onClickOrderBy('orderByPice','ASC');"><span>价格从低到高</span></a>
						</div></li>
					<li><a href="javascript:void(0);"
						onclick="onClickOrderBy('haoping','DESC');">好评数</a></li>
				</ul>
			</div>
			<script type="text/javascript">
				function onClickOrderBy(obj, by) {
					$('#orderByPice').val(obj + "-" + by);
					$('#paramForm').submit();
				}
			</script>
			<div class="jiu">
				<ul>
					<c:forEach items="${list }" var="commShop">
						<a
							href="proscenium/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }">
							<li>
								<div class="pro" style="border-right: none;">
									<div class="list">
										<img src="${commShop.shopCommImages[0].imagePath }" />
										<div class="cover">
											<!--模糊部分-->
											<div class="mask">
												<div class="name">${commShop.commoidtyName }</div>
												<div class="price1">
													￥
													<c:if test="${!commShop.isSpecial }">
														<fmt:formatNumber value="${commShop.unitPrice}"
															pattern="##.##" minFractionDigits="2">
														</fmt:formatNumber>
													</c:if>
													<c:if test="${commShop.isSpecial }">
														<fmt:formatNumber
															value="${commShop.unitPrice * commShop.special}"
															pattern="##.##" minFractionDigits="2">
														</fmt:formatNumber>
													</c:if>
													/
												</div>
												<div class="price2">￥${commShop.unitPrice}</div>
												<div class="time">${fn:split(fn:substring(commShop.commsPecs.commSpec,fn:indexOf(commShop.commsPecs.commSpec,',年份'),fn:indexOf(commShop.commsPecs.commSpec,'年,')),'-')[1]}年</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</a>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="last">
		<div class="tuijian">猜你喜欢</div>
		<div class="tuijain_class">
			<div class="arrow1">
				<img src="images/arrow_left.png" />
			</div>
			<ul>
				<li><img src="images/tuijian.png" />
					<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
					<div class="price1">零售参考价：124元</div>
					<div class="price2">不倒翁价：69</div></li>
				<li><img src="images/tuijian.png" />
					<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
					<div class="price1">零售参考价：124元</div>
					<div class="price2">不倒翁价：69</div></li>
				<li><img src="images/tuijian.png" />
					<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
					<div class="price1">零售参考价：124元</div>
					<div class="price2">不倒翁价：69</div></li>
				<li><img src="images/tuijian.png" />
					<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
					<div class="price1">零售参考价：124元</div>
					<div class="price2">不倒翁价：69</div></li>
			</ul>
			<div class="arrow1">
				<img src="images/arrow_right.png" />
			</div>
		</div>
	</div>

	</div>
	<jsp:include page="../frontDesk/foot.jsp" />

</body>
</html>