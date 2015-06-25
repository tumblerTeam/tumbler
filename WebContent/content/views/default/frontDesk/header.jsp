<%@page import="com.yc.entity.user.AppUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?5f57535f74213a16a89ca2eba1827ed0";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
	function harf() {
		location.href = "user/regist";
	}
	window.onload = function() {
		var zh1 = document.getElementById("zh1");
		var zh2 = document.getElementById("zh2");
		var timer = null;
		/*zh1.onmouseover=function(){
			clearTimeout(timer);
			zh2.style.display="block";
			};
		zh1.onmouseout=function(){
			timer=setTimeout(function (){
				zh2.style.display="none";
				},500);
			};
		zh2.onmouseover=function(){
			clearTimeout(timer);
			}
		zh2.onmouseout=function(){
			timer=setTimeout(function (){
				zh2.style.display="none";
				},500);
			}*/

		zh2.onmouseover = zh1.onmouseover = function() {
			clearTimeout(timer);
			zh2.style.display = "block";
		};
		zh2.onmouseout = zh1.onmouseout = function() {
			timer = setTimeout(function() {
				zh2.style.display = "none";
			}, 500);
		};
	}
</script>
<div class="header">
	<div class="header_box">
		<ul class="header_nav">
			<li class="nav1"><a href="proscenium/openShop"><img
					src="content/static/images/header_hot.jpg" />免费开店</a></li>
			<li class="nav2"><a href="javascript:void(0);" onclick="harf();">快速注册</a>
			</li>
			<c:set var="loginUser"
				value='<%=(AppUser) request.getSession().getAttribute("loginUser")%>'></c:set>
			<c:if test="${loginUser == null }">
				<li class="nav3"><a href="javascript:void(0);"
					onclick="harf();">登录</a></li>
				<li class="nav4"><a href="javascript:void(0);"
					onclick="harf();">我的酒翁<img
						src="content/static/images/header_icon1.png" /></a></li>
			</c:if>
			<c:if test="${loginUser != null }">
				<li class="nav4"><a href="javascript:void(0);" id="zh1">${loginUser.userName }的酒翁<img
						src="content/static/images/header_icon1.png" /></a>
					<div class="zh" id="zh2" style="display: none;">
						<a href="user/personalCenter"><div
								style="margin-left: 20px; margin-top: 5px;">个人中心</div></a> <a
							href="user/logout"><div
								style="margin-left: 20px; margin-top: 8px;">退出账号</div></a>
					</div></li>
			</c:if>
			<li class="nav5"><a href="user/reCarCommodity">购物车<img
					src="content/static/images/header_icon1.png" /></a></li>
		</ul>
	</div>
</div>
<!--头部内容-->
<div class="head">
	<div class="head_box">
		<div class="logo">
			<a href="index"><img src="content/static/images/logo.png" /></a>
		</div>
		<div class="search">
			<input placeholder="输入您想购买的商品名称" class="text" /> <a href="#"><img
				src="content/static/images/search_text.jpg" /></a>
		</div>

		<div class="wx">
			<div class="wx_app">
				<h1>
					APP用户<br />专享优惠
				</h1>
				<p>扫一扫有惊喜</p>
			</div>
			<div class="wx_2">
				<img src="content/static/images/wx.jpg" />
			</div>
		</div>
	</div>
</div>
<!--导航内容-->
<div class="nav">
	<div class="nav_box">
		<div class="nav_btn" id="fen">
			<a href="#">全部商品分类</a>
		</div>
		<div class="nav_list">
			<a href="index" style="padding-left: 30px; color: #a40c59">首页</a> <a
				href="famousManor/index">名庄特卖</a> <a href="#">品牌专区</a> <a href="#">整箱购</a>
			<a href="#">商城精选</a> <a href="#">酒翁精品</a> <a href="#">小食品</a>
		</div>
	</div>
</div>
