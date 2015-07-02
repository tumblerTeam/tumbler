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
        	<h2>消息提醒</h2><span>（共${Usize}条）</span>
        	<input type="checkbox" style="margin-bottom:10px; margin-left:5px;"/> 全选
            <div class="nav">
            	<ul>
                	<li style="width:100px;">消息来源</li>
                    <li style="width:600px;">消息标题</li>
                    <li style="width:100px;">是否已读</li>
                    <li style="width:200px;border-right:none;">操作</li>
                </ul>
            </div>
            <div class="nav1">
	            <c:forEach items="${usermp}" var="m">
	            	<ul>
	                	<li style="width:100px;border:1;">
	                        <input type="checkbox" style=" margin-right:10px; margin-left:15px;"/>${m.source }
	                    </li>
	                    <li style="width:600px;font-weight: bold" onclick="lookContent(${m.id});"> ${m.missionName}
	                    </li>
	                    <li style="width:100px;"> ${m.advState}
	                    </li>
	                    <a href="proscenium/delMessage?mid=${m.id}"><li style="width:200px; text-align:center; border-right:none;">删除</li></a>	                    
	                </ul>
	                <ul id="ulcontent${m.id}" style="display: none;font-size: 14px;">
	                	<li style="width:100px;">
	                        	消息内容：
	                    </li>
	                    <li style="width:600px; overflow-y:scroll;line-height: 80px;">${m.content}
	                    	
	                    </li>
	                    <li style="width:100px;line-height:80px; text-align:center; border-right:none;">正在读取</li>                    
	                    <li style="width:200px; line-height:80px; text-align:center; border-right:none;"><label id="shouqi" style="color:red;font-weight: bold;" onclick="shouqi(${m.id});">点击收起</label></li>                    
	                </ul>
	            </c:forEach>
            </div>
        </div>
        <script type="text/javascript">
        	function lookContent(flag){
        		var ulcontent = document.getElementById("ulcontent"+flag);
        			ulcontent.style.display = '';
        	}
        	function shouqi(flag){
        		var ulcontent = document.getElementById("ulcontent"+flag);
        			ulcontent.style.display = 'none';
        			window.location.href = "proscenium/readMessage?mid="+flag;
        	}
        </script>
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->

<jsp:include page="../frontDesk/foot.jsp"/>

</body>
</html>
