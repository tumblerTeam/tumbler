<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="personal">
	<!--左边-->
	<div class="personal_left">
        <ul class="ji2" style="margin-top:15px;">
        	<a href="user/collection"><li>我的珍藏</li></a>
            <li>个人资料</li>
            <ul class="ji3">
            	<li>基本信息</li>
            </ul>
            <li>我的酒金</li>
            <ul class="ji3">
            	<li>酒金兑换</li>
                <li>酒金获取方式</li>
            </ul>
            <li>活动中心</li>
            <ul class="ji3">
            	<li>酒金获取方式</li>
                <li>活动兑奖</li>
            </ul>
            <li>酒翁推荐</li>
            <ul class="ji3">
            	 <a href="user/skipWinePage"><li>经典红酒</li></a>
                 <a href="user/skipLiqueurPage"><li>典藏白酒</li></a>
                <a href="user/skipBierPage"><li>爽口啤酒</li></a>
                <a href="user/skipSpiritsPage"><li>尊享洋酒</li></a>
                <a href="user/skipToolPage"><li>特色酒具/配酒小菜</li></a>
            </ul>
            <li>我的订单</li>
              <ul class="ji3">
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=-1" class="a1">全部订单</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=waitPayment" class="a1">待付款</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=transitGoods" class="a1">待收货</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=completionTransaction" class="a1">待评价</a></li>
						<li><a href="user/perscentBonuses?orderDate=-1&orderStatus=tuikuan" class="a1">退货退款</a></li>
			  </ul>
            <li>美酒速递</li>
            <ul class="ji3">
            	<a href="user/wuliu"><li>物流跟踪</li></a>
            </ul>
            <li>常见问题</li>
            <ul class="ji3">
            	<a href="#"><li>FAQ</li></a>
            </ul>
        </ul>
    </div>