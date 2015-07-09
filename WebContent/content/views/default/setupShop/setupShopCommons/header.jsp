<%@page import="com.yc.entity.user.AppUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header">
	<div class="header_box">
    	<ul class="header_nav">
            <li class="nav1">
                <a href="proscenium/openShop"><img src="content/static/images/header_hot.jpg"/>免费开店</a>
          	</li>
            <%if(request.getSession().getAttribute("loginUser")==null){%>
	            <li class="nav2">
	            	<a href="#">快速注册</a>
	            </li>
	            <li class="nav3">
	            	<a href="#">登录</a>
	            </li>
            <%} else if(request.getSession().getAttribute("loginUser")!=null){%>
            	<% 
            		AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
            	%>
            	<li><a href=""><%=user.getPhone()%></a></li>
            <%} %>
           <li class="nav4">
            	<a href="personal.html">我的酒翁</a>
            </li>
            <li class="nav5">
            	<a href="shopcar.html">购物车</a>
            </li>
        </ul>
    </div>
</div>