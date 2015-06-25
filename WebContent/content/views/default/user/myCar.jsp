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
<title>不倒翁</title>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index.html">首页</a> > <span>购物车</span>
		</div>
	</div>
	<div class="shop_content">
		<div class="top" style="width: 100%; height: 80px">
			<div class="breadCrumb"></div>
		</div>

		<div class="center">
			<div class="title">
				<img src="content/static/images/sc.png" />
				<div class="zi">我的购物车</div>
			</div>
			<div class="nav">
				<ul>
					<li style="width: 340px;">商品名称</li>
					<li>商品单价</li>
					<li style="width: 160px">购买数量</li>
					<li>优惠金额</li>
					<li>小计</li>
					<li>操作</li>
				</ul>
			</div>
			<div class="allselect">
				<input type="checkbox" name="allselect" id="allselect" />全选
			</div>
			<c:forEach items="${list }" var="carCommodity" varStatus="loop">
				<div class="nav1">
					<ul>
						<li style="width: 340px;">
								<input type="checkbox" name="select" style="margin-left: 5px; float: left; margin-top: 40px;" value="${carCommodity.id },${loop.index }" onclick="onclickCheck(this);"/>
							<a href="proscenium/shopItem?commID=${carCommodity.shopCommodity.commCode }&category=${carCommodity.shopCommodity.shopCategory.categoryID }&shopID=${carCommodity.shopCommodity.belongTo.id }&commoName=${carCommodity.shopCommodity.commoidtyName }"><img
							src="${carCommodity.shopCommodity.shopCommImages[0].imagePath }"
							style="float: left; margin-top: 10px;" />
							<div style="float: left; margin-top: 41px;">${carCommodity.shopCommodity.commoidtyName }</div></a>
						</li>
						<li style="text-align: center; line-height: 100px;">￥<fmt:formatNumber
								value="${carCommodity.shopCommodity.unitPrice }" pattern="##.##"
								minFractionDigits="2"></fmt:formatNumber></li>
						<li style="width: 160px"><a href="#"><img
								src="content/static/images/jianhao.png"
								style="float: left; margin-top: 45px; margin-left: 30px; margin-right: 5px;" /></a>
							<form style="float: left;">
								<input style="width: 50px; margin-top: 42px" id="amount${loop.index }" onchange="onchangeAmount(this,${loop.index });"
									value="${carCommodity.amount }" />
							</form> <a href="#"><img src="content/static/images/jiahao.png"
								style="float: left; margin-top: 45px; margin-left: 5px;" /></a></li>
						<li style="text-align: center; line-height: 100px;">￥<fmt:formatNumber
								value="${carCommodity.unitPrice }" pattern="##.##"
								minFractionDigits="2"></fmt:formatNumber>
						<input type="hidden" id="unitPrice${loop.index }" value="${carCommodity.unitPrice }"/>
						<input type="hidden" value="${carCommodity.price }" id="price${loop.index }" name="price"/>		
								</li>
						<li style="text-align: center; line-height: 100px;" id="displayPrice${loop.index }">￥<fmt:formatNumber
								value="${carCommodity.price }" pattern="##.##"
								minFractionDigits="2"></fmt:formatNumber>
						</li>
						<li style="text-align: center; font-size: 14px;"><a
							href="javascript:void(0);"
							onclick="collectionClick('toJsonFmatUtil/addCollection?shopID=${carCommodity.shopCommodity.belongTo.id }');"><div
									style="float: left; margin-left: 35px;">
									<img src="content/static/images/shoucang.jpg"
										style="margin-top: 30px;" width="20PX;" height="20PX;" />
									<div>加入收藏</div>
								</div></a> <a href="user/deleteShopCar?id=${carCommodity.id }"><div style="float: left; margin-left: 15px;">
									<img src="content/static/images/shanchu.png"
										style="margin-top: 30px;" width="20PX;" height="20PX;" />
									<div>删除</div>
								</div></a></li>
					</ul>
				</div>
			</c:forEach>
			<div class="list">
				<div class="tatle" style="float: right;">
					<span>商品金额总计：</span><span class="ap1" id="zong"> ￥<fmt:formatNumber
								value="0.00" pattern="##.##"
								minFractionDigits="2"></fmt:formatNumber>
								</span>
								<input type="hidden" id="zhongjinge" value="0"/>
				</div>
				<a href="javascript:void(0);" onclick="orderConfirm();"><div class="btn">去结算</div></a>
			</div>
		</div>
		<script type="text/javascript">
			function orderConfirm(){
				var nums = "";
				 $("input[name='select']").each(function(){
					 if(this.checked){
						 var num = $(this).val().split(',')[0];
						 alert($('#amount'+$(this).val().split(',')[1]).val());
						 nums = nums + num + ",";
					 }
				 });
				 
			}
			$("#allselect").click(function(){
			    if(this.checked){
			    	var zhongjia =0;
			        $("input[name='select']").each(function(){
			            this.checked = true;
			            var num = $(this).val().split(',')[1];
			            zhongjia = parseFloat(zhongjia) +parseFloat($('#price'+num).val());
			        }); 
				    $('#zhongjinge').val(zhongjia);
				    $('#zong').html("￥"+zhongjia.toFixed(2));
				    
			    }else{ 
			    	var zhong = $('#zhongjinge').val();
			        $("input[name='select']").each(function(){
			            this.checked = false;
			            var num = $(this).val().split(',')[1];
			            zhong = parseFloat(zhong) - parseFloat($('#price'+num).val());
			        });
			        $('#zhongjinge').val(zhong);
				    $('#zong').html("￥"+zhong.toFixed(2));
			    } 
			});
			function onclickCheck(obj){
				var zhong = $('#zhongjinge').val();
				alert(zhong);
				var num = obj.value.split(',')[1];
				if(obj.checked){
					alert(num);
					alert($('#price'+num).val());
				    zhong = parseFloat(zhong) + parseFloat($('#price'+num).val());
				}else{
		            zhong = parseFloat(zhong) - parseFloat($('#price'+num).val());
				}
				$('#zhongjinge').val(zhong);
			    $('#zong').html("￥"+zhong.toFixed(2));
			}

			$(function() {
				 $("input[name='select'][checked]").each(function(){
			           alert($(this).val());
			      });
			});
			function onchangeAmount(obj,index){
				var price = $('#unitPrice'+index).val();
				var num = obj.value;
				$('#price'+index).val(parseFloat(price)*num);
				var pri = parseFloat(price)*num;
				$('#displayPrice'+index).html("￥"+pri.toFixed(2));
				var zhong = $('#zhongjinge').val();
				$("input[name='select']").each(function(){
					var num = this.val().split(',')[1];
					alert(num);
					if(this.checked){
						alert($('#price'+num).val());
					    zhong = parseFloat(zhong) + parseFloat($('#price'+num).val());
					}else{
			            zhong = parseFloat(zhong) - parseFloat($('#price'+num).val());
					}
		        });
				$('#zhongjinge').val(zhong);
				$('#zong').html("￥"+zhong.toFixed(2));
			}
			function collectionClick(paramUrl) {
				jQuery.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : paramUrl,
					dataType : 'json',
					success : function(data) {
						if (data.success == "true") {
							alert('亲，已经加入收藏夹了哦！');
						}

						else if (data.success == "existed") {
							alert('收藏夹已经有这个宝贝了，亲是有多喜欢她啊！');
						}

						else if (data.success == "nouser") {
							if (confirm('您还没有登录哦！')) {
								var url = "user/regist";
								window.location = url;
							}
						}
					}
				});
			}
		</script>
		<div class="bottom">
			<div class="tuijian">商品推荐</div>
			<div class="box">
				<div class="picbox">
					<ul class="piclist mainlist">
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
							<div class="name">桑塔丽塔120加本力桃红 2011 Santa Rita 120 Rose</div>
							<div class="price1">零售参考价：124元</div>
							<div class="price2">不倒翁价：69</div></li>
						<li><img src="content/static/images/tuijian.png" />
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
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>