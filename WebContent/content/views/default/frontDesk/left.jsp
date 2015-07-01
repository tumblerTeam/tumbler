<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="personal_left">
			<div class="left_nav1">
				<ul>
					<li><a href="user/personalCenter">我的酒翁</a></li>
					<li>我的订单</li>
					<ul style="margin-left: 40px;">
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=-1" class="a1">全部订单</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=waitPayment" class="a1">待付款</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=transitGoods" class="a1">待收货</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=completionTransaction" class="a1">待评价</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=tuikuan" class="a1">退货退款</a></li>
					</ul>
				</ul>
			</div>
			<div class="left_nav2">
				<a href="user/collection"><div class="sc">我的收藏</div></a>
			</div>
			<div class="left_nav2">
				<a href="pingjia.html"><div class="sc">我的评价</div></a>
			</div>
		</div>