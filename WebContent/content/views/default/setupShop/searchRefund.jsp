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
        	<div class="left1"><h3>退款管理</h3></div>
            <a href="#"><span class="right1">退款问题在线帮助</span></a>
        </div>
        <div class="sold">
        	<div class="top">
            	<form action="proscenium/searchRefund" method="get">
                	订单编号：<input type="text" name="orderFormID" />
		                               从：<input type = "date" name="paymentDateLeft"/>到：<input type = "date" name="paymentDateRight"/><br />
		                              商品名称：<input type="text" name="nameOfGoods" />
		                              退款状态：<select name="orderStatusFrom">
                        			<option value="refundOrderForm">全部</option>
                                    <option value="refundOrderForm">退款中</option>
                                    <option value="refundSuccess">退款关闭</option>
                                    <option value="refundFailed">退款成功</option>
                      		</select><br />
                      <br />
                       <input type="submit" value="搜索"/>
                </form>
            </div>
                <div class="class2">
                    <div class="nav">
                        <ul>
                            <li>退款编号</li>
                            <li style="width:200px;">订单编号/商品信息</li>
                            <li>卖家</li>
                            <li>交易金额</li>
                            <li>退款金额</li>
                            <li>退款状态</li>
                            <li>操作</li>
                        </ul>
                    </div>
                    <div class="nav2" id="text1" style="display:block">
                         <c:forEach items="${orderForms}" var="o">
	                      	<ul>
	                      		<!--后期改 显示的是订单编号 -->
	                      		<li>${o.orderFormID}</li>
	                      		<c:forEach items="${o.commodities}" var="c">
	                      			<li style="width:200px;">${c.nameOfGoods}</li>                           
	                          	<li>${c.seller.shopName}</li> 
	                           <li>${c.money}</li>
	                           <!-- 退款金额后期改 -->
	                           <li>${c.money}</li>
	                      		</c:forEach>
	                          <li>
	                          	<c:if test="${o.orderstatus == 'refundOrderForm'}">退款中</c:if> 
	                          	<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if>
	                          	<c:if test="${o.orderstatus == 'refundFailed'}">退款失败</c:if>	                            	
	                          </li>
	                          <li></li>                           
	                     	</ul>
                      </c:forEach>
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
