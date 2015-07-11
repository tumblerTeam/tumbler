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
tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}
td{
	padding:8px 10px;
	vertical-align:top;	
}
</style>
</head>

<body>
<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
	<!-- 左边部分 -->
	<jsp:include page="setupShopCommons/left.jsp" />
	<!--中间开始-->
	<div>
		<div class="bread">
			<div class="left1">
				<a href="open.html">我是卖家</a> < <font style="font-weight: 700;">已卖出的商品</font>
			</div>
			<a href="#"><span class="right1">买家交易学习专区</span></a>
		</div>
		<div class="sold">

			<div class="last" id="tab" style="height:auto;">
				<div class="nav1">
					<ul>

					</ul>
				</div>
					<table style="border:1px solid #bbb;width:850px">
						<c:forEach items="${orderForms}" var="o">
							<tr style="background-color:#e8f2ff;">
								<td colspan="18" style="width:850px;padding:8px 10px;vertical-align:top;">
									<span class="order-number">订单编号：${o.orderFormID}</span>
									<span class="order-number">创建时间：${o.orderDate } ${o.orderTime}</span>
								</td>
							</tr>
							
							<tr style="width: 850px;height: 30px;margin-top: 7px;line-height: 30px;font-size: 14px;">
								
								<th style="width: 40%;">商品</th>
								<th style="width: 10%;">单价（元）</th>
								<th style="width: 5%;">数量</th>
								<th style="width: 5%;">规格</th>
								<th style="width: 10%;">买家</th>
								<th style="width:20%;">交易状态</th>
								<th style="width: 10%;">实收款（元）</th>
							</tr>
								<c:forEach items="${o.commodities}" var="c">
								<tr>
									<td style="line-height: 20px; text-align: left; float: left;">
										<img src="images/quan.jpg" width="50px" height="40px"
										style="margin-left: 15px;" />
										<div style="float: right; margin-right: 20px;">
											${c.shopCommodity.commItem }<br />${c.shopCommodity.commoidtyName }
										</div>
									</td>
									<td style="width: 100px;">￥${c.price}</td>
									<td>${c.quantity }</td>
									<td>${c.commSpec }</td>
									<td>${o.orderUser.userName}</td>
										<td>等待卖家发货</td>
									<td style="width: 100px;">￥${c.money}</td>
									<td></td>
								</tr>
							</c:forEach>
							
							<tr>
								<td colspan="18" style="width:100%;background-color: #e8f2ff;">收货地址：</td>
							</tr>
							<tr style="width: auto;height: 30px;margin-top: 7px;line-height: 30px;font-size: 14px;">
								<th>国家</th>
								<th>省</th>
								<th>市</th>
								<th>区</th>
								<th>街道</th>
								<th>收件人</th>
								<th>电话</th>
								<th>邮件</th>
								<th>备注</th>
							</tr>
							<c:if test="${o.delivery.address!=null}">
								<tr>
									<td>${o.delivery.address.country}</td>
									<td>${o.delivery.address.provience}</td>
									<td>${o.delivery.address.city}</td>
									<td>${o.delivery.address.district}</td>
									<td>${o.delivery.address.street}</td>
									<td>${o.delivery.address.toName}</td>
									<td>${o.delivery.address.phone}</td>
									<td>${o.delivery.address.toEmail}</td>
									<td>${o.delivery.address.orther}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="18" style="width:100%;background-color: #e8f2ff;">开始发货：</td>
							</tr>
							<form action="proscenium/deliveryComm" method="post">
								<tr style="">
									<td>快递公司</td>
									<td><input type="text" name="deliveryName" placeholder="快递名称"/></td>
								</tr>
								<tr>
									<td>运单号</td>
									<td><input type="text" placeholder="运单号" name="packageCode"/></td>
								</tr>
									<input type="hidden" name="orderFormID" value="${o.orderFormID}"/>
									<td><input type="submit" value="提交发货"/></td>
								</tr>
							</form>
						</c:forEach>
					</table>
			</div>
					<div>
						<!-- 省：<select id="cmbProvince"></select> 市：<select id="cmbCity"></select>
						区：<select id="cmbArea"></select><br>
						详细地址:<br><input type="text" placeholder="详细地址（省去省市区）"/><br>
						收件人：<br><input type="text" name=""/><br>
						邮编：<br><input type="text" name=""/><br>
						联系方式：<br><input type="text" name=""/><br>
						<script type="text/javascript">
							addressInit('cmbProvince', 'cmbCity', 'cmbArea', '新疆', '乌鲁木齐市', '新市区');
						</script> -->
					</div>
			<!--中间结束-->
		</div>
	</div>
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp"/>

</body>
</html>
