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
<style type="text/css">
	ul{font-size: 10px;}
</style>
</head>

<body>
<!-- 顶部部分 -->
<jsp:include page="setupShopCommons/header.jsp" />
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
            	<div class="nav">
                	<ul>
                        <li id="tow3"  onclick='setTab("tow",3,9)'>等待发货</li>
                    	<li id="tow1" class="on" onclick='setTab("tow",1,9)'>近三个月订单</li>
                        <li id="tow2"  onclick='setTab("tow",2,9)'>等待买家付款</li>
                        <li id="tow4"  onclick='setTab("tow",4,9)'>已发货</li>
                        <li id="tow5"  onclick='setTab("tow",5,9)'>退款中</li>
                        <li id="tow6"  onclick='setTab("tow",6,9)'>退款成功</li>
                        <li id="tow7"  onclick='setTab("tow",7,9)'>成功的订单</li>
                        <li id="tow8"  onclick='setTab("tow",8,9)'>关闭的订单</li>
                        <li id="tow9"  onclick='setTab("tow",9,9)'>三个月前的订单</li>
                    </ul>
                </div>
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
                <form action="proscenium/multiDelivery" method="get">
	                <div class="nav2">
	                	<ul>
	                    	<li><input type="checkbox" name="quan" />全选</li>
	                        <li><input type="submit" value="批量发货"/></li>
	                    </ul>
	                </div>
	             	<div class="nav_class"  style="display:none;" id="text3">
	                    	<c:forEach items="${waitDelivery}" var="o">
	                    	<div style="padding:50px 0px 1px 10px;"><input type="checkbox" name="checkbox" value="${o.orderFormID }"/></div>
	                		<ul>
		                		<c:forEach items="${o.commodities }" var="c">
	                			<li style="width:250px; line-height:20px; text-align:left; float:left;">
	                            <img src="images/quan.jpg" width="50px" height="40px" style="margin-left:15px;"/>
	                            <div style="float:right; margin-right:20px;">${c.commItem }<br />${c.nameOfGoods }</div>
		                        </li>
		                        <li style="width:100px;">￥${c.price}</li>
	                        	<li>${c.quantity }</li>
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
		                        <li style="width:100px;">￥${c.money}</li>
		                        <li>${c.comment }</li>
		                		</c:forEach>
	                    </ul></c:forEach>
	                </div>
                </form>
                <div class="nav_class" id="text1">
                	<ul>
	                	<c:forEach items="${order3Month}" var="o">
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
	                        <li>￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                <div class="nav_class" style="display:none;" id="text2">
                	<ul>
                    	<c:forEach items="${waitPayment}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                
                <div class="nav_class"  style="display:none;" id="text4">
                	<ul>
                    	<c:forEach items="${transitGoods}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                <div class="nav_class" style="display:none;" id="text5">
                	<ul>
                    	<c:forEach items="${refundOrderForm}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                <div class="nav_class"  style="display:none;" id="text6">
                	<ul>
                    	<c:forEach items="${refundSuccess}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                <div class="nav_class"style="display:none;" id="text7">
                	<ul>
                    	<c:forEach items="${completionTransaction}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                <div class="nav_class" style="display:none;" id="text8">
                	<ul>
                    	<c:forEach items="${closeTransaction}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
	                        <li>${c.comment }</li>
	                		</c:forEach>
	                	</c:forEach>
                    </ul>
                </div>
                <div class="nav_class" style="display:none;" id="text9">
                	<ul>
                    	<c:forEach items="${waitPayment}" var="o">
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
	                        <li style="width:100px;">￥${c.money}</li>
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
<jsp:include page="setupShopCommons/footer.jsp"/>
</body>
</html>