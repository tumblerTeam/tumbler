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
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<title>发布商品</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<link rel="stylesheet" type="text/css" href="content/static/css/datetime/jquery.mobile.flatui.css">
<link rel="stylesheet" type="text/css" href="content/static/js/datetime/jquery.mobile-1.4.0-rc.1.js">
<link rel="stylesheet" type="text/css" href="content/static/js/map/jsAddress.js">
<link rel="stylesheet" type="text/css" href="content/static/js/datetime/jquery.js">
<script>
	function f1(div1,div2){
		if(div2.style.display=="none"){
			div2.style.display="block";
			}else{
				 div2.style.display="none";
			}
		}
</script>
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
</script>
<!--搜索框-->
<script>
	window.onload=function(){
			var d1=document.getElementById("hj");
			d1.onclick=function(){
				d1.placeholder="";
				}
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
        	<div class="left1"><a href="open.html">我是卖家</a> < 发布商品</div>
            <a href="#"><span class="right1">买家交易学习专区</span></a>
        </div>
        
        <div class="fabu">
        	 <div class="top">
             	<div class="search" style="margin-top:15px; width:500px;" >
                    搜索类目：<input class="text" placeholder="请输入商品名称" id="hj">
                   <a href="#"><img src="content/static/images/search_text.jpg" /></a>
      			</div>
             </div>
             <div class="center">
             	<h3 style="margin:10px 0px 0px 15px;">请选择商品类型：</h3>
             	<div class="first">
                	<ul>
                    	<li onclick="javascript:classes(1);">红酒<img src="content/static/images/sanjiao.png" /></li>
                        <li onclick="javascript:classes(2);">白酒<img src="content/static/images/sanjiao.png" /></li>
                        <li onclick="javascript:classes(3);">洋酒<img src="content/static/images/sanjiao.png" /></li>
                        <li onclick="javascript:classes(4);">啤酒<img src="content/static/images/sanjiao.png" /></li>
                        <li onclick="javascript:classes(5);">小食品<img src="content/static/images/sanjiao.png" /></li>
                    </ul>
                </div>
                <div class="second">
                	<ul>
                    	<li>红葡萄酒<img src="content/static/images/sanjiao.png" /></li>
                        <li>白葡萄酒<img src="content/static/images/sanjiao.png" /></li>
                        <li>桃红葡萄酒<img src="content/static/images/sanjiao.png" /></li>
                        <li>香槟/起泡酒<img src="content/static/images/sanjiao.png" /></li>
                        <li>冰酒/贵酒/甜酒<img src="content/static/images/sanjiao.png" /></li>
                    </ul>
                </div>
                <div class="third">
                	<ul>
                    	<li>干白</li>
                        <li>半干白</li>
                        <li>甜白</li>
                        <li>半甜白</li>
                    </ul>
                </div>
                <button class="btn" onclick="publicGood();">我已阅读以下规则，现在发布商品</button>
                <div class="box"></div>
             </div>
        </div>
      </div>
      <!--中间结束-->  
      <script type="text/javascript">
      	function publicGood(){
      		window.location.href="content/views/default/setupShop/releaseCommoidty.jsp";
      	}
      	function classes(num){
      		alert(num);
      		
      		jQuery.ajax({
				type:'GET',
				contentType:'application/json',
				url:'proscenium/getClass2?num='+num,
				dataType : 'json',
				success : function(data) {
					alert(1);
				}
			});
      	}
      
      	function class1000(num){
      		alert(num);
      		var xmlhttp;
      		if (window.XMLHttpRequest) {//ie8及以上版本、ff、chrom
      			xmlhttp = new XMLHttpRequest();
            }
            else {//ie6及以下版本
            	xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
      		//设定请求对象和后台哪个页面进行交互
            xmlhttp.open("get", "proscenium/getClass2?classes="+num, true);
            //发送请求
            xmlhttp.send();
            //后台返回数据后，会调用此方法（回调函数）
            xmlhttp.onreadystatechange = function (data) {
                if (xmlhttp.readyState == 4) {
                    var xmlDoc = responseText;
                    var data=eval(xmlDoc);
                    alert(data[0].category);
                }
            }
      	}
      </script>
    </div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
