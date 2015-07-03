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
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/businesses.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<script type="text/javascript" src="content/static/js/tumbler/tz.js"></script>
<script type="text/javascript">
function buyCat() {
	var commID = document.getElementById('commID').value;
	var buyAmount = document.getElementById('buyAmount').value;
	jQuery.ajax({
		type : 'GET',
		contentType : 'application/json',
		url : 'toJsonFmatUtil/addBuyCar?shopCommId=' + commID
				+ '&buyAmount=' + buyAmount,
		dataType : 'json',
		success : function(data) {
			if (data.message == 'success') {
				alert("添加成功");
			} else if (data.message == 'existed') {
				alert("再次添加成功");
			} else if (data.message == "nouser") {
				if (confirm('您还没有登录哦！')) {
					var url = "user/regist";
					window.location = url;
				}
			}
		}
	});
}
</script>

<!--全部分类js-->
<script>
	window.onload= function(){
		var fen=document.getElementById("fen");
		var fen_class=document.getElementById("fen_class");
		var timer=null;	
		fen_class.onmouseover=fen.onmouseover=function(){
			clearTimeout(timer);
			fen_class.style.display="block";
			};
		fen_class.onmouseout=fen.onmouseout=function(){
			timer=setTimeout(function (){
				fen_class.style.display="none";
				},500);
			};	
		<!--搜索框-->
		var d1=document.getElementById("hj");
			d1.onclick=function(){
				d1.placeholder="";
				}
	}
</script>
</head>

<body>
<!--顶部内容-->
<div class="header">
	<div class="header_box">
    	<ul class="header_nav">
            <li class="nav1">
                <a href="open.html"><img src="images/header_hot.jpg"/>免费开店</a>
          	</li>
            <li class="nav2" onClick="tiaozhuan('1')" id="zc1" style="cursor:pointer;">快速注册</li>
             <li class="nav3" id="dl1" style="margin-top:-10px; width:30px; line-height:37px; margin-left:0px;">
            	<a href="login.html" >登录</a>
            </li>
           <li class="nav4">
            	<a href="personal.html">我的酒翁</a>
            </li>
            <li class="nav5">
            	<a href="shopcar.html">购物车</a>
            </li>
        </ul>
    </div>
</div>
<!--头部内容-->
<div class="head">
	<div class="head_box">
		<div class="logo"><a href="index.html"><img src="images/logo.png"></a></div>
        <div class="sj_logo" style="width:205px; height:40px; border:1px red solid; margin-left:100px; margin-top:115px; position:absolute;">商家logo</div>
        
        <div class="search" >
        	<input class="text" placeholder="红酒" id="hj">
           <a href="#"><img src="images/search_text.jpg" /></a>
           <div  class="zi"><span><a href="#">拉菲</a></span><span><a href="#">奔富</a></span><span><a href="#">名庄</a></span></div> 
           <div class="">
           </div>
        </div>
        
        <div class="wx">
        	<div class="wx_app">
            	<h1>APP用户</br>专享优惠</h1>
                <p>扫一扫有惊喜</p>	
            </div>
            <div class="wx_2">
            	<img src="images/wx.jpg">
            </div>
        </div>
   	</div>
</div>
<!--导航内容-->
<div class="nav">
	<div class="nav_box">
    	<div class="nav_btn"><a href="#" id="fen">全部商品分类</a>
        </div>
        <div class="nav_list">
            <a href="#" style="padding-left:30px; color:#a40c59">首页</a>
            <a href="#">名庄特卖</a>
            <a href="#">品牌专区</a>
            <a href="#">整箱购</a>
            <a href="#">商城精选</a>
            <a href="#">酒翁精品</a>
            <a href="#">小食品</a>
     	</div>
  </div>
</div>
<!--面包屑-->
<div class="breadCrumb">
  <div class="con"> <a href="#">首页</a> > <a>商品详情</a> </div>
</div>
<!--banner-->
<div class="banner" style="height:500px;">
	<div class="menu_nav">
		<div class="menu_left">
        	<div class="list">
            	<h2><a href="#">葡萄酒</a></h2>
                <div class="list_con">
	                <c:forEach items="${mapRed}" var="entry" varStatus="vs" begin="0">
	                	<a href="#">${entry.value}</a>
	                	
	                	<c:if test="${vs.index%3 == 2}"><br/></c:if>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="#">白酒</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapWhite}" var="entry">
	                	<a href="#">${entry.value}</a>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="#">啤酒</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapPi}" var="entry">
	                	<a href="#">${entry.value}</a>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="#">洋酒</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapYang}" var="entry">
	                	<a href="#">${entry.value}</a>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="#">小食品</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapFood}" var="entry">
	                	<a href="#">${entry.value}</a>
	                </c:forEach>
                </div>
            </div>
		</div>
	</div>
    
    <!--banner内容-->
    <div class="banner_box">
    	
    </div>
</div>
<!--商家店铺内容-->
<div class="business">
    <div class="ad"><img src="images/ad4.jpg" /></div>
    <div id="container">

			<c:forEach items="${commodities }" var="c" varStatus="vs">
					<ul>
					<li style="border-right: none;">
						<a href="<%=path%>/${c.link}">
							<c:forEach items="${c.shopCommImages }" var="i" begin="0" end="0">
								<img src="<%=path%>${i.imagePath}" />
							</c:forEach>
						</a>
						<div class="name">${c.commoidtyName}</div>
						<div class="price">￥${c.unitPrice }</div> <a
						href="javascript:void(0);" onclick="buyCat();">
							<div class="btn">加入购物车</div>
					</a></li>
				</ul>
			</c:forEach>
			
</div>
</div>
<!--无限加载-->
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//url data function dataType
	function loadMeinv(){
		for(var i=0;i<=12;i++){
			var html = "";
			html='<li><a href="preview.html"><img src="images/jiu7.jpg" /></a> <a href="preview.html"><div class="name">首彩澳大利亚原瓶原装进口红酒 干红<br /> 红葡萄酒正品88梅洛麦洛红酒</div></a> <div class="price">￥299.00</div><div class="btn">加入购物车</div> </li>';
			if(($(".col").children(this).length)==400){
				return ;
				}
			$minUl = getMinUl();
			$minUl.append(html);
		}
	}
	loadMeinv();
	$(window).on("scroll",function(){
		$minUl = getMinUl();
		if($minUl.height() <= $(window).scrollTop()+$(window).height()){
		//当最短的ul的高度比窗口滚出去的高度+浏览器高度大时加载新图片
			loadMeinv();
		}
	})
	function getMinUl(){//每次获取最短的ul,将图片放到其后
		var $arrUl = $("#container .col");
		var $minUl =$arrUl.eq(0);
		$arrUl.each(function(index,elem){
			if($(elem).height()<$minUl.height()){
				$minUl = $(elem);
			}
		});
		return $minUl;
	}
})
</script>
<!--脚部-->
<div class="foot">
	<div class="center">
    	<div class="center_top">
        	<ul>
            	<li>
                	<img src="images/footer1.jpg" />
                    <div class="center_zi">
                    <div class="bigzi">100%</div>
                    <div class="smallzi">全球正品</div>
                    </div>
                </li>
                <li>
                	<img src="images/footer2.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">24小时内送达</div>
                    <div class="smallzi">承诺24小时之内准时送达</div>
                    </div>
                </li>
                <li>
                	<img src="images/footer3.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">消费者保护</div>
                    <div class="smallzi">联合打假 保护隐私</div>
                    </div>
                </li>
                <li>
                	<img src="images/footer4.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">真伪鉴别</div>
                    <div class="smallzi">真伪鉴别</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="center_left">
        	<a href="#"><img src="images/logo.png" /></a>
      		<div class="center_left_zi">
        		<div class="center_left_zi1">客服电话：4008-888-888</div>
            	<div class="center_left_zi2">周一至周日9:00-20:00</div>
            </div>
        </div>
        <div class="center_center">
        	<div style="font-size:14px; color:#666666; margin-left:40px; margin-top:50px;">雨岑不倒翁</div>
            <div class="center_center_big">
            <dl>
            	<dt><a  href="#">关于我们</a></dt>
                <dd><a  href="#">公司简介</a></dd>
                <dd><a  href="#">战略合作</a></dd>
                <dd><a  href="#">雨岑基地</a></dd>
                <dd><a  href="#">媒体报道</a></dd>
             </dl>
             <dl>
                
                <dt><a  href="#">新手指南</a></dt>
                <dd><a  href="#">新用户注册</a></dd>
                <dd><a  href="#">购物流程</a></dd>
                <dd><a  href="#">雨岑优势</a></dd>
               </dl>
             <dl>
                <dt><a  href="#">配送服务</a></dt>
                <dd><a  href="#">配送范围及时</a></dd>
                <dd><a  href="#">配送运费</a></dd>
                <dd><a  href="#">运输包装说明</a></dd>
                <dd><a  href="#">发票制度</a></dd>
                </dl>
             <dl> 
                <dt><a  href="#">售后服务</a></dt>
                <dd><a  href="#">退换货流程</a></dd>
                <dd><a  href="#">退款说明</a></dd>
                <dd><a  href="#">正品保障</a></dd>
                <dd><a  href="#">投诉建议</a></dd>
                 </dl>
             <dl>
                <dt><a  href="#">支付方式</a></dt>
                <dd><a  href="#">货到付款</a></dd>
                <dd><a  href="#">在线支付</a></dd>
               <dd><a  href="#"> 优惠券</a></dd>
                <dd><a  href="#">礼品卡</a></dd>
            </dl>
            </div>
        </div>
        <div class="center_right">
        	<div class="center_right_left">
            <p>关注不倒翁酒网</p>
            <img src="images/erwerma1.jpg">
            </div>
            <div class="center_right_right">
            <p>下载不倒翁APP</p>
            <img src="images/erweima2.jpg">
            </div>
        </div>
    </div>
<div class="copy">Copyright © 2015 乌鲁木齐市雨岑信息科技有限公司   联系电话：4008-888-888  联系我们.隐私声明.媒体报道.消费者保护.真伪鉴别</div>
</div>

</body>
</html>
