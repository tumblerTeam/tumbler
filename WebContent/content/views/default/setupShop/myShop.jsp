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
</head>

<body>
<!-- 顶部部分 -->
<jsp:include page="setupShopCommons/header.jsp" />
<!--头部内容-->
<div class="head">
	<div class="head_box">
		<div class="logo"><a href="index.html"><img src="images/logo.png"></a>
		</div>
        
        <div class="search" >
        	<input value="输入您想购买的商品名称" class="text">
           <a href="#"><img src="content/static/images/search_text.jpg" /></a>
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
    	<div class="nav_btn"><a href="#">全部商品分类</a>
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
<!--banner-->
<div class="banner" style="height:500px;">
	<div class="menu_nav">
		<div class="menu_left">
        	<div class="list">
            	<h2><a href="#">红酒</a></h2>
                <div class="list_con">
	                <c:forEach items="${mapRed}" var="entry">
	                	<a href="#">${entry.value}</a>
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
	<div class="add"><img src="images/add.jpg" /></div>
	<div class="search1">
    	  <div>
              <form action="">
                    <input type="search" name="serach1" value="搜索本店商品" style="margin-left:20px;" />
                    <input type="image" src="content/static/images/search1.png" /> 
              </form>
          </div> 
          <div  class="zi"><span>冰酒</span><span>解百纳</span><span>拉菲</span></div>                                                                                                     
    </div>
    <div class="brand">
    	<ul>
            <li style="border-left:1px #ccc solid; border-bottom:none;"><img src="images/brand1.jpg" /></li>
            <li style=" border-bottom:none;"><img src="images/brand2.jpg" /></li>
            <li style=" border-bottom:none;"><img src="images/brand1.jpg" /></li>
            <li style="border-left:1px #ccc solid;"><img src="images/brand2.jpg" /></li>
            <li><img src="images/brand1.jpg" /></li>
            <li><img src="images/brand2.jpg" /></li>
        </ul>
    </div>
    <div class="ad"><img src="images/ad4.jpg" />红酒</div>
    <div class="class">
    	<ul>
    	<c:forEach items="${redComms }" var="r" begin="0" end="7">
    		<li style="border-right:none;">
                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
                	<img src="<%=path%>${i.imagePath}" />
    			</c:forEach>
                <div class="name">${r.commoidtyName}<br />
                <div class="price">￥${r.unitPrice }</div>
                <div class="btn">加入购物车</div>
            </li>
    	</c:forEach>
        </ul>
    </div>
    <div class="ad"><img src="images/ad5.jpg" />白酒</div>
    <div class="class">
    	<ul>
            <c:forEach items="${whiteComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	    			<c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
	                	<img src="<%=path%>${i.imagePath}" />
	    			</c:forEach>
	                <div class="name">${r.commoidtyName}<br />
	                <div class="price">￥${r.unitPrice }</div>
	                <div class="btn">加入购物车</div>
	            </li>
	    	</c:forEach>
        </ul>
    </div>
    <div class="ad"><img src="images/ad6.jpg" />啤酒</div>
    <div class="class">
    	<ul>
            <c:forEach items="${piComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
	                	<img src="<%=path%>${i.imagePath}" />
	    			</c:forEach>
	                <div class="name">${r.commoidtyName}<br />
	                <div class="price">￥${r.unitPrice }</div>
	                <div class="btn">加入购物车</div>
	            </li>
	    	</c:forEach>
        </ul>
    </div>
     <div class="ad"><img src="images/ad7.jpg" />洋酒</div>
    <div class="class">
    	<ul>
           <c:forEach items="${yangComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
	                	<img src="<%=path%>${i.imagePath}" />
	    			</c:forEach>
	                <div class="name">${r.commoidtyName}<br />
	                <div class="price">￥${r.unitPrice }</div>
	                <div class="btn">加入购物车</div>
	            </li>
	    	</c:forEach>        
        </ul>
    </div>
    <div class="ad"><img src="images/ad8.jpg" />小食品</div>
    <div class="class">
    	<ul>
           <c:forEach items="${foodComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
	                	<img src="<%=path%>${i.imagePath}" />
	    			</c:forEach>
	                <div class="name">${r.commoidtyName}<br />
	                <div class="price">￥${r.unitPrice }</div>
	                <div class="btn">加入购物车</div>
	            </li>
	    	</c:forEach>
        </ul>
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
