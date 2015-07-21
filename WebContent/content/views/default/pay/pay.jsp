<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<title>不倒翁</title>
<base href="<%=basePath%>"/>
<link rel="stylesheet" type="text/css"
	href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/datetime/jquery.mobile.flatui.css">
<link rel="stylesheet" type="text/css"
	href="content/static/js/datetime/jquery.mobile-1.4.0-rc.1.js">
<link rel="stylesheet" type="text/css"
	href="content/static/js/datetime/jquery.js">
<script type="text/javascript"
	src="content/static/js/datetime/jsAddress.js"></script>
<script type="text/javascript">
	function addAddress(){
			var btn=document.getElementById("btn");
			var btn2=document.getElementById("btn2");
			var dizhi=document.getElementById("dizhi");
			btn.onclick=function(){
					dizhi.style.display="block";	
				}
			btn2.onclick=function(){
					dizhi.style.display="none";	
				}
		}
</script>

</head>

<body>

<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!--中间内容-->
<div class="seller" style="margin:30px 0 0 190px;font-size: 12px;">
    <div class="center">
    	<div class="top_nav">
        	<div class="top_nav_class">
                <ul>
                    <a href="proscenium/openShop"><li>支付宝支付</li></a>
                    <li style="background-color:#a40c59; color:#fff;">微信支付</li>
                    <a href="proscenium/messageCenter"><li>银联支付</li></a>
                </ul>
            </div>
            <a href="#"><div class="lianjie">我的不倒翁>></div></a>
        </div>
    </div>
   <div>
   		支付信息：
   		<c:forEach items="${orderformList}" var="o" varStatus="vs">
		   	<ul>
		   		<li>${vs.index+1}</li>
		   		<c:forEach items="${o.commodities }" var="c">
		   			<li>商家信息：${c.shopCommodity.belongTo.shopName }<li>
		   			<input type="hidden" name="shopId" value="${c.shopCommodity.belongTo.id}"/>
		   		</c:forEach>
		   		<li>下单时间：${o.orderDate } ${o.orderTime}</li>
		   		<li>价格：${o.totalPrice}</li>
		   		<li>运费：${o.delivery.deliveryMoney }</li>
		   		<li>共计：${o.totalPrice + o.delivery.deliveryMoney }</li>
		   		<form action="mainServlet" method="get">
		   			<!-- 后期传值：appid,appsecret,partner,partnerkey,backUri -->
		   			<!-- 现在传值：userId 用户id, orderNo订单Id, describe例：食品名称, money -->
		   			<input type="text" name="userId" value="${o.orderUser.id }"/>
		   			<input type="text" name="orderNo" value="${o.orderFormID }"/>
		   			<input type="text" name="describe" value="describe"/>
		   			<input type="text" name="money" value="${o.totalPrice + o.delivery.deliveryMoney}"/>
				   	<input style="background-color:#a40c59; color:#fff;border:0;width:80px;height:20px;font-size: 14px; cursor: pointer;" type="submit" value="微信支付"/>
		   		</form>
		   		
		   	</ul>
   		</c:forEach>
   		
   </div>
</div>

<!-- 页脚部分 -->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
