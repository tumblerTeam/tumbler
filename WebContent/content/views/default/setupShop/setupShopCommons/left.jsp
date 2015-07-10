<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%Shop shop = null; %>
<div class="seller" style="margin:30px 0 0 190px;">
    <div class="center">
    	<div class="top_nav">
        	<div class="top_nav_class">
                <ul>
                    <a href="proscenium/openShop"><li style="background-color:#a40c59; color:#fff;">我是卖家</li></a>
                    <a href="proscenium/accountManage"><li>账号管理</li></a>
                    <a href="proscenium/messageCenter"><li>消息中心</li></a>
                </ul>
            </div>
            <a href="personal.html"><div class="lianjie">我的不倒翁>></div></a>
        </div>
        <div class="left_nav">
        		<div class="box">
                	<h4 onClick="f1(this,son1)"><img src="content/static/images/zk.png"/><span>店铺管理</span></h4>
                    <ul id="son1">
                    	<%if((Shop)request.getSession().getAttribute("shop")==null) {%>
                    	<li><a href="proscenium/openShop">我要开店</a></li>
                    	<%}else if((Shop)request.getSession().getAttribute("shop")!=null){
                    		shop = (Shop)request.getSession().getAttribute("shop");
                    		if(!shop.getIsPermit()){%>
                    			<li><a href="proscenium/verify">等待审核</a></li>
                    		<%}else {%>
                    			<li><a href="proscenium/myShop" target="_black">我的店铺</a></li>                    		
                    		<%} %>
                    	<%} %>
                    </ul>
                </div>
                <%if(request.getSession().getAttribute("shop")!=null){ 
                		shop = (Shop)request.getSession().getAttribute("shop");
                		if(shop.getIsPermit()){%>
                		
			<div class="box">
				<h4 onClick="f1(this,son2)">
					<img src="content/static/images/zk.png" /><span>交易管理</span>
				</h4>
				<ul id="son2">
					<li><a href="proscenium/soldComm">已卖出的商品</a></li>
					<li><a href="proscenium/evaluationManage">评价管理</a></li>
					<li><a href="proscenium/refund">退款管理</a></li>
				</ul>
			</div>

			<div class="box">
				<h4 onClick="f1(this,son4)">
					<img src="content/static/images/zk.png" /><span>商品管理</span>
				</h4>
				<ul id="son4">
					<!--                     	<li><a href="proscenium/releaseCommoidty">发布商品</a></li> -->
					<li><a href="proscenium/publishComm">发布商品</a></li>
					<li><a href="proscenium/chushou?flag=1">出售中的商品</a></li>
					<li><a href="proscenium/chushou?flag=0">仓库中的商品</a></li>
				</ul>
			</div>
			
			<%} %>
                <%}%>
                
        </div>