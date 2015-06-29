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
<base href="<%=basePath%>" />
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<script src="js/tz.js"></script>
<script>
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
<!-- 顶部部分 -->
<jsp:include page="setupShopCommons/header.jsp" />
<!--中间内容-->
<div class="seller">
	<div class="top">
    	<div class="logo">卖家中心</div>
        <div class="search1">
        	<div class="zi">
            	<ul>
                	<li>服务</li>
                    <li>货源</li>
                    <li>商品</li>
                    <li>店铺</li>
                    <li>帮助</li>
                </ul>
            </div>
            <div class="text">
            	<form>
                	<input type="search" class="box" name="search1" />
                    <input type="image" class="img" src="content/static/images/search_text.jpg" name="image" />
                </form>
            </div>
        </div>
    </div>
    <div class="center">
    	<div class="top_nav">
        	<div class="top_nav_class">
                <ul>
                    <a href="proscenium/openShop"><li>我是卖家</li></a>
                    <a href="proscenium/messageCenter"><li style="background-color:#a40c59; color:#fff;">消息中心</li></a>
                </ul>
            </div>
            <a href="personal.html"><div class="lianjie">我的不倒翁>></div></a>
        </div>
        
        <!--中间开始-->
        <div class="xxzx">
        	<h2>消息提醒</h2><span>（共0条）</span>
        	<input type="checkbox" style="margin-bottom:10px; margin-left:5px;"/> 全选
            <div class="nav">
            	<ul>
                	<li style="width:200px;">消息来源</li>
                    <li style="width:600px;">消息内容</li>
                    <li style="width:200px;border-right:none;">操作</li>
                </ul>
            </div>
            <div class="nav1">
            	<ul>
                	<li style="width:200px;">
                        <input type="checkbox" style=" margin-right:10px; margin-left:15px;"/>asdfsdfsdg
                    </li>
                    <li style="width:600px; overflow-y:scroll;"> fgrfgregrr</li>
                    <a><li style="width:200px; text-align:center; border-right:none;">删除</li></a>
                </ul>
            </div>
            <div class="nav1">
            	<ul>
                	<li style="width:200px;">
                        <input type="checkbox" style=" margin-right:10px; margin-left:15px;"/>asdfsdfsdg
                    </li>
                    <li style="width:600px; overflow-y:scroll;"> fgrfgregrr</li>
                    <a><li style="width:200px; text-align:center; border-right:none;">删除</li></a>
                </ul>
            </div>
            <div class="nav1">
            	<ul>
                	<li style="width:200px;">
                        <input type="checkbox" style=" margin-right:10px; margin-left:15px;"/>asdfsdfsdg
                    </li>
                    <li style="width:600px; overflow-y:scroll">fgrfgregrr</li>
                    <a><li style="width:200px; text-align:center; border-right:none;">删除</li></a>
                </ul>
            </div>
            
        </div>
      <!--中间结束-->  
    </div>
</div>
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
