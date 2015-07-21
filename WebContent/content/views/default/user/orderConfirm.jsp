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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/shop_css.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/lrtk.js"></script>
<script  type="text/javascript"
	src="content/static/js/datetime/jquery.js">
<script type="text/javascript"
	src="content/static/js/datetime/jsAddress.js"></script>
<title>不倒翁</title>

<script>
	function up(div3, div4) {
		div4.style.display = "none";
	}
</script>
<script>
	function down(div3, div4) {
		div4.style.display = "block";
	}
</script>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
<%-- 	<jsp:include page="../frontDesk/cate.jsp" /> --%>
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index">首页</a> > <span>核对订单信息</span>
		</div>
	</div>
	<div class="shop_content">
		<div class="top" style="width: 100%; height: 80px">
			<div class="breadCrumb2"></div>
		</div>

		<div class="center">
			<div class="title">
				<img src="content/static/images/car.png" />
				<div class="zi">送往哪里</div>
			</div>
			<hr />
			<div class="address" id="address">
				<div class="shopcartabt2">
					<div class="shcaadd">
						<p class="shcaadds">
							<select name="" id="addressChange">
								<option value="-1" selected="selected">-----选择收件人----</option>
								<c:forEach items="${addresses }" var="address">
									<option value="${address.id }"
										<c:if test="${address.theDefault == true }">selected</c:if>>${address.toName }</option>
								</c:forEach>
							</select> <a href="javascript:void(0);" onclick="newAddress();" ><font
								color="blue">使用新地址</font></a>
						</p>
						<p class="shcaadds" id="addressShow"></p>
						<div class="cl"></div>
						<div class="shcaaddselink"></div>
					</div>
				</div>
				<div class="xiugai" id="xiu">修改送货信息</div>
			</div>
			<script type="text/javascript">
				$(document)
						.ready(
								function() {
									var code = $("#addressChange").find(
											"option:selected").val();
									$option = "";
									<c:forEach items="${addresses }" var="address">
									if ('${address.id}' == code) {
										$option = $option
												+ "&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
										$option = $option
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.country}&nbsp;${address.provience}&nbsp;${address.city}&nbsp;</font><br><br>";
										$option = $option
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.other}&nbsp;</font><br><br>";
										$option = $option
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
									}
									</c:forEach>
									$('#addressShow').append($option);
								});
				$("#addressChange")
						.change(
								function() {
									var code = $(this).val();
									$('#addressShow').html("");
									$option = "";
									<c:forEach items="${addresses }" var="address">
									if ('${address.id}' == code) {
										$option = $option
												+ "&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
										$option = $option
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.country}&nbsp;${address.provience}&nbsp;${address.city}&nbsp;</font><br><br>";
										$option = $option
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.other}&nbsp;</font><br><br>";
										$option = $option
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
									}
									</c:forEach>
									$('#addressShow').append($option);
								});
				function newAddress(){
					$('#newaddress').css("display", "block");
					$('#xiu').css("display", "none");
				}
			</script>
			
			<div class="new_address" id="newaddress" style="display: none;">
				<div class="new">添加送货地址：</div>
				<div class="dizhi">
					<div class="box1">
						<div id="dizhi">
							<form action="user/addNewAddress" method="post">
								<input type="text" name="shopCommId" value=""/>
								<input type="hidden" name="buyAmount" value=""/>
								*所在地区：
                                <select name="province">
                        		<option>---</option>
                                <option value="四川">四川</option>
                                <option>新疆</option>
                                    <option>北京</option>
                                 </select>
                                 <select name="city">
                                   <option>---</option>
                                    <option value="广元">广元</option>
                                    <option>成都</option>
                                    <option>乌鲁木齐</option>
                                 </select>
                                 <select name="area">
                                   <option>---</option>
                                   <option value="青羊区">青羊区</option>
                                    <option value="武侯区">武侯区</option>
                                    <option value="">新市区</option>
                                 </select><br/>
                          *详细地址：<input name="street" style="width:400px; height:70px; margin-left:30px;" value="请输入详细信息" /><br />
                          	邮政编码：<input name="toEmail" style="margin-left:40px;" /><br />
                          *收货人姓名：<input name="toName" type="text" /><br />
                          	手机号码：
                                <input name="phone" type="text" /><br />
                                <input name="default" type="radio" style="margin-left:150px;" />设置为默认收货地址<br />
                                <input type="submit" value="保存"/>
                    	</form>
						</div>
					</div>
				<div class="baocun" id="new">保存</div>
			</div>
			</div>
			<div class="way">
				<div class="zi">配送方式</div>
				<hr />
				<div class="first">
					<div class="ff">配送方式：</div>
					<div class="border1" id="border">快递</div>
				</div>
				<div class="second">
					<div class="time">收货时间：</div>
					<div class="border">
						<ul>
							<li id="li1">工作日、双休日与节假日均可送货</li>
							<li id="li2">只双休日、有假日送货（工作日不送货）</li>
							<li id="li3">只有工作日送货（双休日、节假日不送货）</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="list">
				<div>商品清单</div>
				<div class="nav">
					<ul style="color:#a40c59;">
						<li style="width: 560px; color:#a40c59;">商品名称</li>
						<li>商品单价</li>
						<li style="width: 160px">购买数量</li>
						<li>优惠金额</li>
						<li>小计</li>
					</ul>
				</div>
				<c:set var="zhongliang" value="0"></c:set>
				<c:set var="jine" value="0"></c:set>
				<c:forEach items="${list }" var="carCommodity" varStatus="loop">
					<div class="nav1">
						<ul>
							<li style="width: 560px;"><img
								src="${carCommodity.shopCommodity.shopCommImages[0].imagePath }"
								style="float: left; margin-top: 10px;" />
								<div style="float: left; margin-top: 41px;">
									${carCommodity.shopCommodity.commoidtyName }</div></li>
							<li style="text-align: center; line-height: 100px;">￥<fmt:formatNumber
									value="${carCommodity.shopCommodity.unitPrice }"
									pattern="##.##" minFractionDigits="2"></fmt:formatNumber></li>
							<li style="width: 160px">
								<div
									style="float: left; width: 50px; margin-top: 42px; margin-left: 70px;">${carCommodity.amount }</div>
							</li>
							<li style="text-align: center; line-height: 100px;">￥<fmt:formatNumber
									value="${carCommodity.unitPrice }" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber>
							</li>
							<li style="text-align: center; line-height: 100px;"
								id="displayPrice${loop.index }">￥<fmt:formatNumber
									value="${carCommodity.price }" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber>
							</li>
							<c:set var="zhongliang"
								value="${zhongliang + carCommodity.shopCommodity.probablyWeight * carCommodity.amount}"></c:set>
							<c:set var="jine" value="${jine + carCommodity.price}"></c:set>
						</ul>
					</div>
				</c:forEach>
			</div>
			<div class="last">
				<div class="last_top">
					<a href="javascript:void(0);" onclick="goBlack();"><div
							class="back">返回购物车修改</div></a>
					<div class="tatle">
						<span>赠送积分：</span><span class="ap1"> <fmt:formatNumber
								value="${jine }" pattern="##" minFractionDigits="0"></fmt:formatNumber>分
						</span> <span>商品金额总计：</span><span class="ap1"> ￥<fmt:formatNumber
								value="${jine }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
					</div>
				</div>
				<script type="text/javascript">
					function goBlack() {
						window.location.href = document.referrer;
					}
				</script>
				<div class="last_top2">
					<div class="tatle2">
						<span style="margin-right: 35px;">运费：</span> <span class="ap1">￥${zhongliang * 6 }</span>
					</div>
				</div>
				<div class="last_top2">
					<div class="tatle2">
						<span>您共需支付：</span> <span class="ap1">￥<fmt:formatNumber
								value="${zhongliang * 6 + jine}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
					</div>
				</div>
				<div class="last_top3">
					<a href="javascript:void(0);" onclick="orderGenerate();"><div class="btn">提交订单</div></a>
					<div class="tatle3">
						<span>应付金额：</span> <span class="ap1">￥<fmt:formatNumber
								value="${zhongliang * 6 + jine}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
					</div>
				</div>
			</div>
			<form action="user/orderGenerate" method="post" id="orderGenerateForm">
				<input name="shouhuoTime" type="hidden" value="工作日、双休日与节假日均可送货"/>
				<input name="xunshufangshi" type="hidden" value="ems"/>
				<input name="ids" type="text" value="${vars }"/>
				<input name="yunfei" type="hidden" value="${zhongliang * 6 }"/>
				<input name="mudidi" id="mudidi" type="hidden" value=""/>
			</form>
			<div class="bottom">
				<div class="tuijian">商品推荐</div>
				<div class="box">
					<div class="picbox">
						<ul class="piclist mainlist">
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
						<ul class="piclist swaplist"></ul>
					</div>
					<div class="og_prev"></div>
					<div class="og_next"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp"/>
	<script type="text/javascript">
		function orderGenerate(){
			$('#mudidi').val($('#addressChange').val());
			$('#orderGenerateForm').submit();
		}
		window.onload = function() {
			var btn1 = document.getElementById("btn1");
			var btn2 = document.getElementById("btn2");
			var btn3 = document.getElementById("btn3");
			var b1 = document.getElementById("b1");
			var b2 = document.getElementById("b2");
			var b3 = document.getElementById("b3");
			var add = document.getElementById("address");
			var add1 = document.getElementById("newaddress");
			var xiu = document.getElementById("xiu");
			var newadd = document.getElementById("new");
			var guanbi = document.getElementById("guanbi");
			btn1.onclick = function() {
				btn1.style.backgroundColor = "#a40c59";
				btn2.style.backgroundColor = "#ccc";
				btn3.style.backgroundColor = "#ccc";
				btn1.style.color = "#fff";
				btn2.style.color = "#000";
				btn3.style.color = "#000";
				b1.style.display = "inline";
				b2.style.display = "none";
				b3.style.display = "none";
			}
			btn2.onclick = function() {
				btn2.style.backgroundColor = "#a40c59";
				btn1.style.backgroundColor = "#ccc";
				btn3.style.backgroundColor = "#ccc";

				btn2.style.color = "#fff";
				btn1.style.color = "#000";
				btn3.style.color = "#000";
				b2.style.display = "inline";
				b1.style.display = "none";
				b3.style.display = "none";
			}
			btn3.onclick = function() {
				btn3.style.backgroundColor = "#a40c59";
				btn2.style.backgroundColor = "#ccc";
				btn1.style.backgroundColor = "#ccc";

				btn3.style.color = "#fff";
				btn2.style.color = "#000";
				btn1.style.color = "#000";
				b3.style.display = "inline";
				b2.style.display = "none";
				b1.style.display = "none";
			}
			xiu.onclick = function() {
				add.style.display = "none";
				add1.style.display = "block";
			}
			guanbi.onclick = newadd.onclick = function() {
				add1.style.display = "none";
				add.style.display = "block";
			}
			<!--退出登录-->
			var zh1 = document.getElementById("zh1");
			var zh2 = document.getElementById("zh2");
			var nav3 = document.getElementById("nav3");
			var timer = null;
			zh2.onmouseover = zh1.onmouseover = function() {
				clearTimeout(timer);
				zh2.style.display = "block";
				nav3.style.backgroundColor = "#fff";
			};
			zh2.onmouseout = zh1.onmouseout = function() {
				timer = setTimeout(function() {
					zh2.style.display = "none";
					nav3.style.backgroundColor = "#eee";
				}, 500);
			};
			<!--送货方式-->

			var li1 = document.getElementById("li1");
			var li2 = document.getElementById("li2");
			var li3 = document.getElementById("li3");
			var border = document.getElementById("border");
			li1.onclick = function() {

				li1.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
				li2.style.boxShadow = "none";
				li3.style.boxShadow = "none";
			}
			li2.onclick = function() {
				li2.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
				li1.style.boxShadow = "none";
				li3.style.boxShadow = "none";
			}
			li3.onclick = function() {
				li3.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
				li2.style.boxShadow = "none";
				li1.style.boxShadow = "none";
			}
			border.onclick = function() {
				border.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
			}

		}
	</script>
</body>
</html>