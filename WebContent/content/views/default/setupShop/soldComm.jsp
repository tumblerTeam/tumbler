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
<script src="content/static/js/datetime/jquery-1.11.1.min.js"></script>
<script src="content/static/js/tumbler/tz.js"></script>
<style type="text/css">
body {
	font-size: 12px;
}

#evalute {
	margin: 0 0 2px 300px;
}
#evalute p {
	margin: 20px 0 5px 0;
}
.nav_class ul li {
 	list-style-type: none;
	display: inline-block;
	float: left;
	width: 78px;
	height: 30px;
	text-align: center;
	line-height: 40px;
 }
</style>

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
<!--退出js-->
<script>
	window.onload=function(){
			var zh1=document.getElementById("zh1");
			var zh2=document.getElementById("zh2");
			var nav3=document.getElementById("nav3");
			var timer=null;	
			zh2.onmouseover=zh1.onmouseover=function(){
				clearTimeout(timer);
				zh2.style.display="block";
				nav3.style.backgroundColor="#fff";
				};
			zh2.onmouseout=zh1.onmouseout=function(){
				timer=setTimeout(function (){
					zh2.style.display="none";
					nav3.style.backgroundColor="#eee";
					},500);
				};
				
			$(".pingjia").click(event,function(){
				for(var i=0;i<$(".pingjia").length;i++){
					if(i==$(".pingjia").index($(this))){
						$(".ping").eq(i).css("transition","all 0.5s").css("display","block");
					}else{
						$(".ping").eq(i).css("transition","all 0.5s").css("display","none");
					}
					
				}
			});
// 		$(".fa").click(event,function(){
// 			for(var i=0;i<$(".fa").length;i++){
// 				if(i==$(".fa").index($(this))){
// 					$(".ping").eq(i).css("transition","all 0.5s").css("display","none");
// 				}
// 			}
// 			});
		$(".bu").click(event,function(){
			for(var i=0;i<$(".bu").length;i++){
				if(i==$(".bu").index($(this))){
					$(".ping").eq(i).css("transition","all 0.5s").css("display","none");
				}
			}
			});
		}
</script>
<style>
.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 40%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>
<style type="text/css">
	ul{font-size: 10px;}
</style>
</head>

<body>

<!--顶部内容-->
<div class="header">
	<div class="header_box">
    	<ul class="header_nav">
            <li class="nav1">
                <a href="#"><img src="images/header_hot.jpg">免费开店</a>
          	</li>
            <li class="nav2" onClick="tiaozhuan('1')" id="zc1" style="cursor:pointer;">快速注册</li>
            <li class="nav3" id="nav3">
            	<a href="#" id="zh1"><span>htx4846842</span><img src="images/header_icon1.png"></a>
                <div class="zh" id="zh2" style="display:none;">
                    <a href="#"><div style="margin-left:20px;  margin-top:15px;">个人中心</div></a>
                    <a href="#"><div style="margin-left:20px; margin-top:12px;">退出账号</div></a>
                </div>
            </li>
            <li class="nav4">
            	<a href="#">我的酒翁<img src="images/header_icon1.png"></a>
            </li>
            <li class="nav5">
            	<a href="#">购物车<img src="images/header_icon1.png"></a>
            </li>
        </ul>
    </div>
</div>

<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        <!--中间开始-->
        <div>
         <div class="bread" >
        	<div class="left1"><a href="open.html">我是卖家</a> < <font style="font-weight:700;">已卖出的商品</font></div>
            <a href="#"><span class="right1">买家交易学习专区</span></a>
        </div>
        <div class="sold" style="padding-bottom: 20px;">
        	<div class="top" style="height:auto;">
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
						<li id="tow3" onclick='setTab("tow",3,9)'>等待发货</li>
						<li id="tow1" class="on" onclick='setTab("tow",1,9)'>近三个月订单</li>
						<li id="tow2" onclick='setTab("tow",2,9)'>等待买家付款</li>
						<li id="tow4" onclick='setTab("tow",4,9)'>已发货</li>
						<li id="tow5" onclick='setTab("tow",5,9)'>退款中</li>
						<li id="tow6" onclick='setTab("tow",6,9)'>退款成功</li>
						<li id="tow7" onclick='setTab("tow",7,9)'>成功的订单</li>
						<li id="tow8" onclick='setTab("tow",8,9)'>关闭的订单</li>
						<li id="tow9" onclick='setTab("tow",9,9)'>三个月前的订单</li>
					</ul>
				</div>
				<div class="nav1">
					<ul>
						<li style="width: 250px;">商品</li>
						<li style="width: 100px;">单价（元）</li>
						<li>数量</li>
						<li>售后</li>
						<li>买家</li>
						<li>交易状态</li>
						<li style="width: 100px;">实收款（元）</li>
						<li>评价</li>
					</ul>
				</div>
				<form action="proscenium/multiDelivery" method="get">
					<div class="nav2">
						<ul>
							<li><input type="checkbox" name="quan" />全选</li>
							<li><input type="submit" value="批量发货" /></li>
						</ul>
					</div>
					<div class="nav_class" style="display: none;" id="text3">
						<c:forEach items="${waitDelivery}" var="o">
							<div style="padding: 50px 0px 1px 10px;">
								<input type="checkbox" name="checkbox" value="${o.orderFormID }" />
							</div>
							<ul>
								<c:forEach items="${o.commodities }" var="c">
									<li
										style="width: 250px; line-height: 20px; text-align: left; float: left;">
										<img src="images/quan.jpg" width="50px" height="40px"
										style="margin-left: 15px;" />
										<div style="float: right; margin-right: 20px;">${c.shopCommodity.commoidtyName }<br />1
										</div>
									</li>
									<li style="width: 100px;">￥${c.price}</li>
									<li>${c.quantity }</li>
									<li>${o.orderUser.userName}</li>
									<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
										<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
										<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if>
										<c:if test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
											test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
										<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
										<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
										<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
										<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
											test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
									<li>￥${c.money}</li>
									<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
										<c:if test="${re.user.id == o.orderUser.id}">
											<c:if test="${re.orderId == o.orderFormID}">
												<li>${re.reviewsRank}</li>
											</c:if>
										</c:if>
									</c:forEach>
								</c:forEach>
							</ul>
						</c:forEach>
					</div>
				</form>
				<div class="nav_class" style="border: 0" id="text1">
					<c:forEach items="${order3Month}" var="o">
						<ul>
							<c:forEach items="${o.commodities }" var="c">
								<li
									style="width: 250px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>
								<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
									<c:if test="${re.user.id == o.orderUser.id}">
										<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</ul>

					</c:forEach>
				</div>
				<div class="nav_class" style="display: none;" id="text2">
					<ul>
						<c:forEach items="${waitPayment}" var="o">
							<c:forEach items="${o.commodities }" var="c">
								<li
									style="width: 250px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>
								<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
									<c:if test="${re.user.id == o.orderUser.id}">
										<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>

				<div class="nav_class" style="display: none;" id="text4">
					<ul>
						<c:forEach items="${transitGoods}" var="o">
							<c:forEach items="${o.commodities }" var="c">
								<li
									style="width: 250px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>
								<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
									<c:if test="${re.user.id == o.orderUser.id}">
										<c:if test="${re.orderId == o.orderFormID}">
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>
				<div class="nav_class" style="display: none;" id="text5">
					<ul>
						<c:forEach items="${refundOrderForm}" var="o">
							<c:forEach items="${o.commodities }" var="c">
								<li
									style="width: 250px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>
								<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
									<c:if test="${re.user.id == o.orderUser.id}">
										<c:if test="${re.orderId == o.orderFormID}">
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>
				<div class="nav_class" style="display: none;" id="text6">
					<ul>
						<c:forEach items="${refundSuccess}" var="o">
							<c:forEach items="${o.commodities }" var="c">
								<li
									style="width: 250px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>
								<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
									<c:if test="${re.user.id == o.orderUser.id}">
										<c:if test="${re.orderId == o.orderFormID}">
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>

				<div class="nav_class" style="display: none;" id="text7">
					<ul>
						<c:forEach items="${completionTransaction}" var="o">
							<c:forEach items="${o.commodities }" var="c">
								<li
									style="width: 250px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>
								<%
									int flag = 0;
								%>
								<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
									<c:if test="${re.user.id == o.orderUser.id}">
										<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
											<%
												flag = 1;
											%>
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:forEach>
								<%
									if (flag == 0) {
								%>
								<li><div class="pingjia">评价</div></li>
								<%
									}
								%>
								<div class="ping" style="display: none;">
									<form action="proscenium/evaluteUser" method="post">
										<div class="content" style="height:250px;">
											<div style="text-align: center;">
												<input type="hidden" name="userId" value="${o.orderUser.id}" />
												<input type="hidden" name="orderFormID" value="${o.orderFormID}" />
												<input type="hidden" name="commCode" value="${c.shopCommodity.commCode}" /> 
												评价： <input type="radio" name="reviewsRank" value="good" checked="checked"/>好评 
													 <input type="radio" name="reviewsRank" value="better" />中评 
													 <input type="radio" name="reviewsRank" value="bad" />差评
											</div>
											<div class="box">
												<textarea name="businessreply"></textarea>
											</div>
											<input type="submit" id="fa" value="发表评论"/>
											<span class="bu" id="bu">暂不评论</span>
										</div>
									</form>
								</div>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>

				<script>
               <!--第一个-->
                    $("#ping").children($("#ping")).hover(function(){
                        
                        //索引
                        var index=$("#ping").children($("#ping")).index(this);
                        $(this).css("backgroundPosition","0px 15px");
                            for(var i=0;i<=index;i++){
                                $("#ping").children($("#ping")).eq(i).css("backgroundPosition","0px 15px");
                                }
                            for(var j=index+1;j<=5;j++){
                                $("#ping").children($("#ping")).eq(j).css("backgroundPosition","0px 0px");
                                }
                            
                        },function(){
                            if(index==5){
                                return;
                                }
                        $(this).css("backgroundPosition","0px 0px");
                            });
                
               </script>

					<div class="nav_class" style="display: none;" id="text8">
						<ul>
							<c:forEach items="${closeTransaction}" var="o">
								<c:forEach items="${o.commodities }" var="c">
									<li
										style="width: 250px; line-height: 20px; text-align: left; float: left;">
										<img src="images/quan.jpg" width="50px" height="40px"
										style="margin-left: 15px;" />
										<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
									</li>
									<li style="width: 100px;">￥${c.price}</li>
									<li>${c.quantity }</li>
									<li></li>
									<li>${o.orderUser.userName}</li>
									<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
										<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
										<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if>
										<c:if test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> 
										<c:if test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
										<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
		                        	<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
										<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
										<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
											test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
									<li>￥${c.money}</li>
	                        	${c.shopCommodity}
		                        <c:forEach
										items="${c.shopCommodity.shopreviews}" var="re">
										<c:if test="${re.user.id == o.orderUser.id}">
											<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
												<c:if test="${re.reviewsRank != null}">
													<li>${re.reviewsRank}</li>
												</c:if>
											</c:if>
										</c:if>
									</c:forEach>

								</c:forEach>
							</c:forEach>
						</ul>
					</div>
					<div class="nav_class" style="display: none;" id="text9">
						<ul>
							<c:forEach items="${order3Month}" var="o">
								<c:forEach items="${o.commodities }" var="c">
									<li
										style="width: 250px; line-height: 20px; text-align: left; float: left;">
										<img src="images/quan.jpg" width="50px" height="40px"
										style="margin-left: 15px;" />
										<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
									</li>
									<li style="width: 100px;">￥${c.price}</li>
									<li>${c.quantity }</li>
									<li></li>
									<li>${o.orderUser.userName}</li>
									<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
										<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
										<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if>
										<c:if test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> 
										<c:if test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
										<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
		                        	<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
										<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
										<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
											test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
									<li>￥${c.money}</li>
									<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
										<c:if test="${re.user.id == o.orderUser.id}">
											<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
												<li>${re.reviewsRank}</li>
											</c:if>
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>
      </div>
      <!--中间结束-->
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
