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
				value='<%=(AppUser) request.getSession().getAttribute(
						"loginUser")%>'></c:set>
			<c:if test="${loginUser == null }">
				<li class="nav3" id="dl1"
					style="margin-top: -10px; width: 30px; line-height: 37px; margin-left: 0px;"><a
					href="javascript:void(0);" onclick="harf();">登录</a></li>
				<li class="nav4"><a href="javascript:void(0);"
					onclick="harf();">我的酒翁</a></li>
			</c:if>
			<c:if test="${loginUser != null }">
				<li class="nav4" id="nav3"><a href="javascript:void(0);"
					id="zh1" onclick="location.href = 'user/personalCenter'"> <c:if
							test="${loginUser.userName ==null }">给我个名吧</c:if> <c:if
							test="${loginUser.userName !=null }">${loginUser.userName }</c:if>
						<img src="content/static/images/header_icon1.png"></a>
					<div class="zh" id="zh2" style="display: none;">
						<a href="user/personalCenter"><div
								style="margin-left: 20px; margin-top: 15px;">个人中心</div></a> <a
							href="user/logout"><div
								style="margin-left: 20px; margin-top: 12px;">退出账号</div></a>
					</div></li>
				<li class="nav4"><a href="javascript:void(0);" id="zh1">我的酒翁</a>
				</li>
			</c:if>
			<li class="nav5" ><a href="user/reCarCommodity" id="buyCatNum">购物车(0)</a></li>
		</ul>
	</div>

</div>
<script type="text/javascript">
	$(document).ready(function() {
		jQuery.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : 'toJsonFmatUtil/getBuyCatNum',
			dataType : 'json',
			success : function(data) {
				$neirong = "";
				if (data.success == 'true') {
					if(data.list != ''){
						$.each(data.list,function(i, carCommodity) {
							$neirong = $neirong + "<hr style='width:240px; margin-top:0px; border:1px solid ; border-bottom:none; '/><ul style='height:80px; margin-top:-5px;  margin-left:15px; '><li style='line-height:80px;float:left; ' ><input style='width: 50px; margin-top: 42px' id='amount"+i+"' type='hidden' value='"+carCommodity.amount+"' /><input type='hidden' id='unitPrice"+i+"' value='"+carCommodity.unitPrice+"'/><input type='hidden' value='"+carCommodity.price+"' id='price"+i+"' name='price'/>	<input type='checkbox' name='select' value='"+carCommodity.id+","+i+"' onclick='onclickCheck(this);' /></li><li style='float:left; margin-top:0px;'><img src='"+carCommodity.imagePath+"' /></li><li style='float:left;'><div style='font-size:12px; color:#333; width:50px; overflow:hidden; height:30px; margin-top:20px;' >"+carCommodity.commoidtyName+"</div></li><li style='float:left; font-size:12px;color:#333; line-height:80px; margin-left:20px;'>"+carCommodity.amount+"</li><li style='float:left; font-size:12px;color:#333; line-height:80px; margin-left:25px;'>￥"+carCommodity.unitPrice+"</li></ul>";
						});
						$('#neirongCar').html($neirong);
					}
					$('#buyCatNum').html("购物车(" + data.num + ")");
				}
			}
		});
	});
	function searchName(){
		var name = $('#hj').val();
		if(name == ''){
			name = '葡萄酒';
		}
		location.href = "search/searchForName?paramName="+name;
	}
</script>
<!--头部内容-->
<div class="head">
	<div class="head_box">
		<div class="logo">
			<a href="index"><img src="content/static/images/logo.png"></a>
		</div>
		<div class="search">
			<input class="text"
				style="padding-left: 15px; font-size: 16px; font-family: '微软雅黑';"
				placeholder="葡萄酒" id="hj"> <a href="javascript:void(0);" onclick="searchName();"><div
					style="width: 95px; font-family: '微软雅黑'; font-size: 18px; text-align: center; color: #fff; line-height: 39px; float: left; height: 39px; background-color: #BB2923;">搜索</div></a>
			<div class="zi">
				<span><a href="#">伏特加</a>|</span> <span><a href="#"
					class="pp">白兰地</a>|</span> <span><a href="#" class="pp">干邑</a>|</span> <span><a
					href="#">半香型</a>|</span> <span><a href="#">德国啤酒</a>|</span> <span><a
					href="#">进口巧克力</a>|</span> <span><a href="#">黑啤</a></span>
			</div>
		</div>

		<div class="wx">
			<img src="content/static/images/cc.png" /><span class="span1">进入购物车</span>
			<span class="span2"> ></span>

		</div>
	</div>
</div>
<!--导航内容-->
<div class="nav">
	<div class="nav_box">
    	<div class="nav_btn"><a href="#">全部商品</a>
        </div>
        <div class="nav_list">
            <a href="index" style="padding-left:30px; color:#901531;">首页</a>
            <a href="famousManor/index">名庄特卖</a>
            <a href="areaWine">地方名酒</a>
            <a href="fclBuy">整箱特惠</a>
            <a href="groupon">团购</a>
            <a href="boutique">酒翁精品</a>
            <a href="getSnacks?categoryID=5">零食＋周边</a>
     	</div>
  </div>
</div>

