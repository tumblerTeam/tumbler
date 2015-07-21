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
<script type="text/javascript">
	function addAddress(){
			var btn=document.getElementById("btn");
			var btn2=document.getElementById("btn2");
			var dizhi=document.getElementById("dizhi");
			btn.onclick=function(){
					dizhi.style.display="block";	
				}
			btn2.onclick=function(){
					dizhi.style.display="none";	
				}
		}
</script>

</head>

<body>

<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!--中间内容-->
<div class="seller" style="margin:30px 0 0 190px;font-size: 12px;">
    <div class="center">
    	<div class="top_nav">
        	<div class="top_nav_class">
                <ul>
                    <a href="proscenium/openShop"><li>我是卖家</li></a>
                    <li style="background-color:#a40c59; color:#fff;">账号管理</li>
                    <a href="proscenium/messageCenter"><li>消息中心</li></a>
                </ul>
            </div>
            <a href="personal.html"><div class="lianjie">我的不倒翁>></div></a>
        </div>
        
        <!--中间开始-->
       <div class="zhgl">
       		<div class="ziliao">
            	<h3>基本资料</h3>
                <div class="box">
                	<span>当前头像：</span>
                    <img src="images/quan.jpg" />
                    <form action="proscenium/saveAccount" method="post">
                		<input type="hidden" name="shopId" value="${shop.id }"/>
                    	*昵称：<input style="width:250px; height:25px; margin-left:38px;" name="userName" value="${shop.user.userName}" /><br />
                        店铺名称：<input style="width:150px; height:25px;" name="shopName" value="${shop.shopName}"/> <br />
                        性别：<input id="male" type="radio" style="margin-left:45px;" name="sex"/> 男
                        	 <input id="female" type="radio" name="sex"/> 女<br />
                        	 <script type="text/javascript">
                        	 	function check(){
                            	 	var rd = "${shop.sex}";
                        	 		if(rd=='male'){
                        	 			document.getElementById("male").checked = 'checked';
                        	 		}else if(rd=='female'){
                        	 			document.getElementById("female").checked = 'checked';
                        	 		}
                        	 	}
                        	 	window.onload = check;
                        	 </script>
                       生日：<input style="margin-left: 40px;" type="date" name="birthday" value='${shop.birthday}'/><br />
                        	
             		<div> 地址：
						 省：<select id="cmbProvince" name="province"></select> 
						 市：<select id="cmbCity" name="city"></select>
						区：<select id="cmbArea" name="area"></select><br>
						<script type="text/javascript">
							addressInit('cmbProvince', 'cmbCity', 'cmbArea', '新疆', '乌鲁木齐市', '新市区');
						</script>
					</div>
					<input type="submit" value="保存" style="
                   		background-color: #a40c59;
						color: #fff;
						border: none;
						font-size: 16px;
						padding: 5px 10px;
						width: 80px;
						margin: 30px 0px 0px 200px;"/>
                    </form>
                </div> 
            </div>
            
			<hr style="margin-top:30px; width:90%;" />
				<div class="dizhi">
					<h3>收货地址</h3>
					<div class="box1">
						<h4 id="btn" style="cursor: pointer;">
							<button style="width: 120px;" onclick="addAddress();">新增收货地址</button>
						</h4>
						<div id="dizhi" style="display: none;">
							<form action="proscenium/saveAddress" method="post">
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
					<div class="nav">
						<div class="class">
							<ul>
								<li>收货人</li>
								<li style="width: 240px;">所在地址</li>
								<li style="width: 240px;">详细地址</li>
								<li>邮编</li>
								<li>电话/手机</li>
								<li style="width: 150px;">操作</li>
							</ul>
						</div>
						<div class="class1">
							<c:forEach items="${addresses }" var="a">
								<ul>
									<li>${a.toName }</li>
									<li style="width: 240px;">${a.provience}省 ${a.city}市 ${a.district}区</li>
									<li style="width: 240px;">${a.street}</li>
									<li>${a.toEmail }</li>
									<li>${a.phone }</li>
									<li style="width: 150px;"><a href="proscenium/modAddress?aid=${a.id}">修改</a> |<a href="proscenium/delAddress?aid=${a.id}">删除 |</a>
									<c:if test="${a.theDefault==true}"><span style="font-size:12px; color:#a40c59;">默认地址</span></c:if> 
									<c:if test="${a.theDefault==false}"><a href="proscenium/setDefaultAddress?aid=${a.id}">设为默认</a></c:if> 
									</li>
								</ul>
							</c:forEach>
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
