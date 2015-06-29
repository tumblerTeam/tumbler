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
<title>不倒翁首页</title>
<base href="<%=basePath%>"/>
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
                    <input type="image" class="img" src="img/search_text.jpg" name="image" />
                </form>
            </div>
        </div>
    </div>
    <div class="center">
    	<div class="top_nav">
        	<div class="top_nav_class">
                <ul>
                    <a href="proscenium/openShop"><li>我是卖家</li></a>
                    <a href="proscenium/accountManage"><li style="background-color:#a40c59; color:#fff;">账号管理</li></a>
                    <a href="xxzx.html"><li>消息中心</li></a> 
                </ul>
            </div>
            <a href="personal.html"><div class="lianjie">我的不倒翁>></div></a>
        </div>
        
        <!--中间开始-->
       <div class="zhgl">
			<hr style="margin-top:30px; width:90%;" />
				<div class="dizhi">
					<h3>修改收货地址</h3>
					<div class="box1">
						
						<div>
							<form action="proscenium/modAddressInfo" method="post">
								<input type="hidden" name="aid" value="${address.id}"/>
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
                                 <select  name="area">
                                   <option>---</option>
                                   <option value="青羊区">青羊区</option>
                                    <option value="武侯区">武侯区</option>
                                    <option value="">新市区</option>
                                 </select><br />
                          *详细地址：<input name="street" style="width:400px; height:70px; margin-left:30px;" value="${address.street }" /><br />
                          邮政编码：<input name="toEmail" style="margin-left:40px;" value="${address.toEmail }" /><br />
                          *收货人姓名：<input name="toName" type="text" value="${address.toName }" /><br />
                          手机号码：
                                <input name="phone" type="text" value="${address.phone }"/><br />
                                <input name="default" type="radio" style="margin-left:150px;" />设置为默认收货地址<br />
                                <input type="submit" value="保存修改"/>
                    </form>
						</div>
					</div>
					
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
