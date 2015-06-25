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
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<!--选项卡js-->
<!--<script type="text/javascript"> 
function setTab(name,m,n){ 
		for( var i=1;i<=n;i++){ 
			var menu = document.getElementById(name+i); 
			var showDiv = document.getElementById("text"+i); 
			menu.className = i==m?"on":""; 
			showDiv.style.display = i==m?"block":"none"; 
			} 
	} 
</script>-->
</head>

<body>
<!-- 顶部部分 -->
<jsp:include page="setupShopCommons/header.jsp" />
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        <!--中间开始-->
        <div>
      		<div class="pjgl">
            	<div class="nav">
                	<ul>
                    	<li>我的评价</li>
                        <li>收到提问</li>
                        <li>我的提问</li>
                    </ul>
                </div>
                <div class="left1">
                	<h4 style="margin-left:5px;">个人信息</h4>
                    <hr style="border:1px dashed #ccc;"/>
                    <p style="margin-left:25px;">会员名：${shop.user.userName }</p>
                    <p style="margin-left:10px;">联系方式：${shop.user.phone }</p>
                    <p style="margin-left:40px;">Email：${shop.user.email }</p>
                    <p style="margin-left:10px;">
                    	认证信息：${shop.shopType}
                    </p>
                </div>
               
               <div class="right1">
               		<h5 style="margin-left:15px; margin-top:0px;margin-bottom:0px;">买家累积信用</h5>
                    <div class="box">
                    	<table>
                        	<tr>
                            	<td></td>
                            	<td>最近一周</td>
                                <td>最近一个月</td>
                                <td>最近6个月</td>
                                <td>最近1年</td>
                                <td>总计</td>
                            </tr>
                            <tr>
                            	<td>好评</td>
                                <td>${oneWeek[0]}</td>
                                <td>${oneMonth[0]}</td>
                                <td>${sixMonth[0]}</td>
                                <td>${twelveMonth[0]}</td>
                                <td>${allMonth[0]}</td>
                            </tr>
                            <tr>
                            	<td>中评</td>
                                <td>${oneWeek[1]}</td>
                                <td>${oneMonth[1]}</td>
                                <td>${sixMonth[1]}</td>
                                <td>${twelveMonth[1]}</td>
                                <td>${allMonth[1]}</td>
                            </tr>
                            <tr>
                            	<td>差评</td>
                                <td>${oneWeek[2]}</td>
                                <td>${oneMonth[2]}</td>
                                <td>${sixMonth[2]}</td>
                                <td>${twelveMonth[2]}</td>
                                <td>${allMonth[2]}</td>
                            </tr>
                            <tr>
                            	<td>总计</td>
                                <td>${oneWeek[0]+oneWeek[1]+oneWeek[2]}</td>
                                <td>${oneMonth[0]+oneMonth[1]+oneMonth[2]}</td>
                                <td>${sixMonth[0]+sixMonth[1]+sixMonth[2]}</td>
                                <td>${twelveMonth[0]+twelveMonth[1]+twelveMonth[2]}</td>
                                <td>${allMonth[0]+allMonth[1]+allMonth[2]}</td>
                            </tr>
                        </table>
                    </div>
               </div>
               <div class="buttom">
               		<div class="rating_class">
                        <ul>
                            <li id="tow1" class="on" onclick='setTab("tow",1,3)'>来自买家的评价</li>
                            <li id="tow2" onclick='setTab("tow",2,3)'>来自卖家的评价</li>
                            <li id="tow3" onclick='setTab("tow",3,3)'>给他人的评价</li>
                        </ul><hr />   
       				 </div>
                      <div class="nav1">
                        <ul> 
                            <li style="width:220px;">
                                <select>
                                        <option>评价</option>
                                        <option>好评</option>
                                        <option>中评</option>
                                        <option>差评</option>
                                </select>
                                <select>
                                        <option>评论</option>
                                        <option>有评论内容</option>
                                        <option>无评论内容</option>
                                        <option>有追加评论内容</option>
                                </select>
                            </li>
                            <li>评论人</li>
                            <li>商品信息</li>
                            <li style="margin-left:25px;">操作</li>
                        </ul>
           			</div>
                    <!--添加评论内容-->
                   	<div class="nav2">
                    	 <div class="nav1" id="text1" style="margin-top:10px;">
                            <ul>
                            	<c:forEach items="${reviews}" var="r">
	                                <li style="width:220px;">
	                                    <img style="margin-left:20px;" src="${r.rankImagesPath}" />
	                                    <div style="float:right; font-size:12px; line-height:1px; margin-right:102px; margin-top:5px;">${r.reviewsRank}</div>
	                                    <div style="float:right; font-size:12px; line-height:20px; position:absolute; margin-top:-15px; margin-left:80px; color:#ccc" >[${r.reviewsdate }]</div>
	                                </li>
	                                <li>
	                                    <div style="font-size:12px; line-height:15px; text-align:center;" >${r.user.userName }</div>
	                                    <div style="width:110px; height:15px; margin-left:25px;"><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /></div>
	                                </li>
	                                <li>
	                                    <div style="font-size:12px;line-height:15px; text-align:center;">${r.shopscommodity.commoidtyName}</div>
	                                    <div style="font-size:12px;text-align:center; margin-top:0px;">￥${r.shopscommodity.unitPrice }</div>
	                                </li>
	                                <li style="font-size:12px; line-height:30px; text-align:center;">
	                                    <a href="#"><span>追加评论</span></a><a href="#">
	                                    <img src="images/shanchu.png" style=" position:absolute; margin-left:20px; "/></a>
	                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                       	<div class="nav1" id="text2" style="margin-top:10px; display:none;">
                            <ul>
                            	<c:forEach items="${reviews2}" var="r">
	                                <li style="width:220px;">
	                                    <img style="margin-left:20px;" src="${r.rankImagesPath}" />
	                                    <div style="float:right; font-size:12px; line-height:1px; margin-right:102px; margin-top:5px;">${r.reviewsRank}</div>
	                                    <div style="float:right; font-size:12px; line-height:20px; position:absolute; margin-top:-15px; margin-left:80px; color:#ccc" >[${r.reviewsdate }]</div>
	                                </li>
	                                <li>
	                                    <div style="font-size:12px; line-height:15px; text-align:center;" >${r.user.userName }</div>
	                                    <div style="width:110px; height:15px; margin-left:25px;"><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /></div>
	                                </li>
	                                <li>
	                                    <div style="font-size:12px;line-height:15px; text-align:center;">${r.shopscommodity.commoidtyName}</div>
	                                    <div style="font-size:12px;text-align:center; margin-top:0px;">￥${r.shopscommodity.unitPrice }</div>
	                                </li>
	                                <li style="font-size:12px; line-height:30px; text-align:center;">
	                                    <a href="#"><span>追加评论</span></a><a href="#">
	                                    <img src="images/shanchu.png" style=" position:absolute; margin-left:20px; "/></a>
	                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="nav1" id="text3" style="margin-top:10px; display:none;">
                            <ul>
                                <li style="width:220px;">
                                    <img style=" margin-left:20px;" src="images/hua.png" />
                                    <div style="float:right; font-size:12px; line-height:1px; margin-right:102px; margin-top:5px;">好评！</div>
                                    <div style="float:right; font-size:12px; line-height:20px; position:absolute; margin-top:-15px; margin-left:80px; color:#ccc" >[2015-01-12 17:29:47]</div>
                                </li>
                                <li>
                                    <div style="font-size:12px; line-height:15px; text-align:center;" >卖家 ： 王晓琴83993333</div>
                                    <div style="width:110px; height:15px; margin-left:25px;"><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /><img src="images/aixin.png"  /></div>
                                </li>
                                <li>
                                    <div style="font-size:12px;line-height:15px; text-align:center;">查梅尔庄园干红葡萄酒</div>
                                    <div style="font-size:12px;text-align:center; margin-top:0px;">￥999.00</div>
                                </li>
                                <li style="font-size:12px; line-height:30px; text-align:center;">
                                    <a href="#"><span>追加评论</span></a><a href="#">
                                    <img src="images/shanchu.png" style=" position:absolute; margin-left:20px; "/></a>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
               </div>
            </div>
      </div>
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->
<jsp:include page="setupShopCommons/footer.jsp"/>

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
</body>
</html>
