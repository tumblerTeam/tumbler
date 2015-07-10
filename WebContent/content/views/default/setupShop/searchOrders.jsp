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
<base href="<%=basePath%>" />
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<link rel="stylesheet" type="text/css" href="content/static/css/datetime/jquery.mobile.flatui.css">
<link rel="stylesheet" type="text/css" href="content/static/js/datetime/jquery.mobile-1.4.0-rc.1.js">
<link rel="stylesheet" type="text/css" href="content/static/js/datetime/jquery.js">
<link rel="stylesheet" type="text/css" href="content/static/js/map/jsAddress.js">
<script>
	function f1(div1,div2){
		if(div2.style.display=="none"){
			div2.style.display="block";
			}else{
				 div2.style.display="none";
			}
		}
</script>
<!--选项卡js-->
<script type="text/javascript"> 
function setTab(name,m,n){ 
		for( var i=1;i<=n;i++){ 
			var menu = document.getElementById(name+i); 
			var showDiv = document.getElementById("text"+i); 
			menu.className = i==m?"on":""; 
			showDiv.style.display = i==m?"block":"none"; 
			} 
	} 
</script>
</head>

<body>
<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        <!--中间开始-->
        <div>
         <div class="bread" >
        	<div class="left1"><a href="open.html">我是卖家</a> < <font style="font-weight:700;">已卖出的商品</font></div>
            <a href="#"><span class="right1">买家交易学习专区</span></a>
        </div>
        <div class="sold">
        	<div class="top">
            	<form action="proscenium/searchAlrdyComm" method="get">
                	商品名称：<input type="text" name="commName" /> 
                    成交时间：从<input type="date" name="firstDate"/> 
                        到<input type="date" name="lastDate"/><br>
                        买家昵称：<input type="text" name="uname" />
                        订单状态：<select name="orderStatusFrom">
           			<option value="">全部</option>
                       <option value="waitPayment">等待买家付款</option>
                       <option value="BuyersHavePaid">买家已付款</option>
                       <option value="transitGoods">卖家已发货</option>
                       <option value="waitDelivery">等待卖家发货</option>
                       <option value="completionTransaction">交易成功</option>
                       <option value="closeTransaction">交易关闭</option>
                       <option value="refundOrderForm">退款中的订单</option>
         			</select>
            	订单编号：<input type="text" name="orderId" />
                      <br />
                       <input type="submit" value="搜索"/>
                </form>
            </div>
            <div class="last" id="tab">
                <div class="nav1">
                	<ul> 
                    	<li style="width:250px;">商品</li>
                        <li style="width:100px;">单价（元）</li>
                        <li>数量</li>
                        <li>售后</li>
                        <li>买家</li>
                        <li>交易状态</li>
                        <li style="width:100px;">实收款（元）</li>
                        <li>评价</li>
                    </ul>
                </div>
                <div class="nav2">
                	<ul>
                    	<li><form><input type="checkbox" name="quan" />全选</form></li>
                        <li>批量发货</li>
                        <li></li>
                    </ul>
                </div>
             
                <div class="nav_class" id="text1">
                	<ul>
	                	<c:forEach items="${searchOrders}" var="o">
	                		<c:forEach items="${o.commodities }" var="c">
	                			<li style="width:250px; line-height:20px; text-align:left; float:left;">
	                            <img src="images/quan.jpg" width="50px" height="40px" style="margin-left:15px;"/>
	                            <div style="float:right; margin-right:20px;">${c.commItem }<br />${c.nameOfGoods }</div>
		                        </li>
		                        <li style="width:100px;">￥${c.price}</li>
	                        	<li>${c.quantity }</li>
	                        <li></li>
	                        <li>${o.orderUser.userName}</li>
	                        <li>
	                        	<c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
	                        	<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
	                        	<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if>
	                        	<c:if test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if>
	                        	<c:if test="${o.orderstatus == 'consigneeSigning'}">等待收货人签单</c:if>
	                        	<c:if test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
	                        	<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
	                        	<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
	                        	<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if>
	                        	<c:if test="${o.orderstatus == 'refundFailed'}">退款失败</c:if>
	                        </li>
	                        <li></li>
	                        <li style="width:100px;">￥${c.money}(运费${o.deliveryMoney})</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        
      </div>
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
