<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Shop shop = (Shop)request.getSession().getAttribute("shop");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<script src="js/tz.js"></script>
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
function f1(div1,div2){
		if(div2.style.display=="none"){
			div2.style.display="block";
			}else{
				 div2.style.display="none";
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
        	<div class="left1"><a href="proscenium/openShop">我是卖家</a> < 发布商品</div>
            <a href="#"><span class="right1">买家交易学习专区</span></a>
        </div>
        
        <div class="fabu">
             <div class="center">
             	<h3 style="margin:10px 0px 0px 15px;">请选择商品类型：</h3>
             	<div class="first" style="margin-left: auto;margin-right: auto;float:none;">
                	<ul>
                    	<li id="red" onclick="changeColor(1);">红酒<img src="content/static/images/sanjiao.png" /></li>
                        <li id="white" onclick="changeColor(2);">白酒<img src="content/static/images/sanjiao.png" /></li>
                        <li id="pi" onclick="changeColor(3);">啤酒<img src="content/static/images/sanjiao.png" /></li>
                        <li id="yang" onclick="changeColor(4);">洋酒<img src="content/static/images/sanjiao.png" /></li>
                        <li id="food" onclick="changeColor(5);">小食品<img src="content/static/images/sanjiao.png" /></li>
                    </ul>
                </div>
                <button class="btn" onclick="publishComm();">我已阅读以下规则，现在发布商品</button>
                <div class="box"></div>
             </div>
        </div>
      </div>
      <script type="text/javascript">
      
      	function changeColor(flag){
      		var red = document.getElementById("red");
      		var white = document.getElementById("white");
      		var yang = document.getElementById("yang");
      		var pi = document.getElementById("pi");
      		var food = document.getElementById("food");
      		if (flag == 1) {
				red.style.background="#a40c59";
				white.style.background="#fff";
				yang.style.background="#fff";
				pi.style.background="#fff";
				food.style.background="#fff";
				
				red.style.fontSize='22px';
				white.style.fontSize='14px';
				yang.style.fontSize='14px';
				pi.style.fontSize='14px';
				food.style.fontSize='14px';
			}if (flag == 2) {
				red.style.background="#fff";
				white.style.background="#a40c59";
				yang.style.background="#fff";
				pi.style.background="#fff";
				food.style.background="#fff";
				
				red.style.fontSize='14px';
				white.style.fontSize='22px';
				yang.style.fontSize='14px';
				pi.style.fontSize='14px';
				food.style.fontSize='14px';
			}if (flag == 3) {
				red.style.background="#fff";
				white.style.background="#fff";
				pi.style.background="#a40c59";
				yang.style.background="#fff";
				food.style.background="#fff";
				red.style.fontSize='14px';
				white.style.fontSize='14px';
				pi.style.fontSize='22px';
				yang.style.fontSize='14px';
				food.style.fontSize='14px';
			}if (flag == 4) {
				red.style.background="#fff";
				white.style.background="#fff";
				pi.style.background="#fff";
				yang.style.background="#a40c59";
				food.style.background="#fff";
				red.style.fontSize='14px';
				white.style.fontSize='14px';
				pi.style.fontSize='14px';
				yang.style.fontSize='22px';
				food.style.fontSize='14px';
			}if (flag ==5) {
				red.style.background="#fff";
				white.style.background="#fff";
				yang.style.background="#fff";
				pi.style.background="#fff";
				food.style.background="#a40c59";
				red.style.fontSize='14px';
				white.style.fontSize='14px';
				yang.style.fontSize='14px';
				pi.style.fontSize='14px';
				food.style.fontSize='22px';
			}
      	}
      	function publishComm(){
      		var flag = 0;
      		var red = document.getElementById("red");
      		var white = document.getElementById("white");
      		var yang = document.getElementById("yang");
      		var pi = document.getElementById("pi");
      		var food = document.getElementById("food");
      		if(red.style.fontSize=='22px'){
      			window.location.href="proscenium/releaseCommoidty?cateOne=1";
      		}if(white.style.fontSize=='22px'){
      			window.location.href="proscenium/releaseCommoidty?cateOne=2";
      		}if(pi.style.fontSize=='22px'){
      			window.location.href="proscenium/releaseCommoidty?cateOne=3";
      		}if(yang.style.fontSize=='22px'){
      			window.location.href="proscenium/releaseCommoidty?cateOne=4";
      		}if(food.style.fontSize=='22px'){
      			window.location.href="proscenium/releaseCommoidty?cateOne=5";
      		}if(red.style.fontSize!='22px'&&white.style.fontSize!='22px'&&
      				pi.style.fontSize!='22px'&&yang.style.fontSize!='22px'&&
      				food.style.fontSize!='22px'){
      			alert("请选择类别！");
      		}
      	}
      </script>
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->
<div class="foot">
	<div class="center">
    	<div class="center_top">
        	<ul>
            	<li>
                	<img src="content/static/images/footer1.jpg" />
                    <div class="center_zi">
                    <div class="bigzi">100%</div>
                    <div class="smallzi">全球正品</div>
                    </div>
                </li>
                <li>
                	<img src="content/static/images/footer2.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">24小时内送达</div>
                    <div class="smallzi">承诺24小时之内准时送达</div>
                    </div>
                </li>
                <li>
                	<img src="content/static/images/footer3.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">消费者保护</div>
                    <div class="smallzi">联合打假 保护隐私</div>
                    </div>
                </li>
                <li>
                	<img src="content/static/images/footer4.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">真伪鉴别</div>
                    <div class="smallzi">真伪鉴别</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="center_left">
        	<a href="#"><img src="content/static/images/logo.png" /></a>
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
