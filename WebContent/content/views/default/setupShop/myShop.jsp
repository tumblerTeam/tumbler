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
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/businesses.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<script type="text/javascript">
function buyCat() {
	var commID = document.getElementById('commID').value;
	var buyAmount = document.getElementById('buyAmount').value;
	jQuery.ajax({
		type : 'GET',
		contentType : 'application/json',
		url : 'toJsonFmatUtil/addBuyCar?shopCommId=' + commID
				+ '&buyAmount=' + buyAmount,
		dataType : 'json',
		success : function(data) {
			if (data.message == 'success') {
				alert("添加成功");
			} else if (data.message == 'existed') {
				alert("再次添加成功");
			} else if (data.message == "nouser") {
				if (confirm('您还没有登录哦！')) {
					var url = "user/regist";
					window.location = url;
				}
			}
		}
	});
}

</script>
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
            	<h2><a href="#">葡萄酒</a></h2>
                <div class="list_con">
	                <c:forEach items="${mapRed}" var="entry" varStatus="vs" begin="0">
	                	<a href="#">${entry.value}</a>
	                	
	                	<c:if test="${vs.index%3 == 2}"><br/></c:if>
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
<!-- <div class="add"><img src="images/add.jpg" /></div> -->
	<div class="search1" style="border: 0">
    	  <div>
              <form action="proscenium/searchTheShopComm">
              		<input type="hidden" name="shopId" value="${shopId}"/>
                    <input type="search" name="serach1" value="搜索本店商品" style="margin-left:20px;" />
                    <input type="image" src="content/static/images/search1.png" /> 
              </form>
          </div>
          <div class="zi"><span>冰酒</span><span>解百纳</span><span>拉菲</span></div>                                                                                               
    </div>
    <!-- 顶部整箱购等效果 -->
<!--     <div class="brand"> -->
<!--     	<ul> -->
<!--             <li style="border-left:1px #ccc solid; border-bottom:none;"><img src="images/brand1.jpg" /></li> -->
<!--             <li style=" border-bottom:none;"><img src="images/brand2.jpg" /></li> -->
<!--             <li style=" border-bottom:none;"><img src="images/brand1.jpg" /></li> -->
<!--             <li style="border-left:1px #ccc solid;"><img src="images/brand2.jpg" /></li> -->
<!--             <li><img src="images/brand1.jpg" /></li> -->
<!--             <li><img src="images/brand2.jpg" /></li> -->
<!--         </ul> -->
<!--     </div> -->
    <div class="ad"><img src="content/static/images/ad4.jpg" />红酒</div>
    <div class="class">
    	<ul>
    	<c:forEach items="${redComms }" var="r" begin="0" end="7">
    		<li style="border-right:none;">
    			<input id="commID" type="hidden" value="" value="${r.commCode }"/>
	    			<input id="buyAmount" type="hidden" value="1"/>
                <a href="<%=path%>/${r.link}">
	                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
	                	<img src="<%=path%>${i.imagePath}" />
	    			</c:forEach>
    			</a>
                <div class="name">${r.commoidtyName}<br /></div>
                <div class="price">￥${r.unitPrice }</div>
<!--                 <div class="btn">加入购物车</div> -->
				<a href="javascript:void(0);" onclick="buyCat();">
					<div class="btn">加入购物车</div>
				</a>
            </li>
    	</c:forEach>
        </ul>
    </div>
    <div class="ad"><img src="content/static/images/ad5.jpg" />白酒</div>
    <div class="class">
    	<ul>
            <c:forEach items="${whiteComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	    			<input id="commID" type="hidden" value="${r.commCode }"/>
	    			<input id="buyAmount" type="hidden" value="1"/>
	    			<a href="<%=path%>/${r.link}">
	                	<c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
		                	<img src="<%=path%>${i.imagePath}" />
		    			</c:forEach>
	    			</a>
	                <div class="name">${r.commoidtyName}<br /></div>
	                <div class="price">￥${r.unitPrice }</div>
	                <a href="javascript:void(0);" onclick="buyCat();">
						<div class="btn">加入购物车</div>
					</a>
	            </li>
	    	</c:forEach>
        </ul>
    </div>
    <div class="ad"><img src="content/static/images/ad6.jpg" />啤酒</div>
    <div class="class">
    	<ul>
            <c:forEach items="${piComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	    			<input id="commID" type="hidden" value="${r.commCode }"/>
	    			<input id="buyAmount" type="hidden" value="1"/>
	                <a href="<%=path%>/${r.link}">
		                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
		                	<img src="<%=path%>${i.imagePath}" />
		    			</c:forEach>
	    			</a>
	                <div class="name">${r.commoidtyName}<br /></div>
	                <div class="price">￥${r.unitPrice }</div>
	                <a href="javascript:void(0);" onclick="buyCat();">
						<div class="btn">加入购物车</div>
					</a>
	            </li>
	    	</c:forEach>
        </ul>
    </div>
     <div class="ad"><img src="content/static/images/ad7.jpg" />洋酒</div>
    <div class="class">
    	<ul>
           <c:forEach items="${yangComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	    			<input id="commID" type="hidden" value="${r.commCode }"/>
	    			<input id="buyAmount" type="hidden" value="1"/>
	                <a href="<%=path%>/${r.link}">
		                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
		                	<img src="<%=path%>${i.imagePath}" />
		    			</c:forEach>
	    			</a>
	                <div class="name">${r.commoidtyName}<br /></div>
	                <div class="price">￥${r.unitPrice }</div>
	                <a href="javascript:void(0);" onclick="buyCat();">
						<div class="btn">加入购物车</div>
					</a>
	            </li>
	    	</c:forEach>        
        </ul>
    </div>
    <div class="ad"><img src="content/static/images/ad8.jpg" />小食品</div>
    <div class="class">
    	<ul>
           <c:forEach items="${foodComms}" var="r" begin="0" end="7">
	    		<li style="border-right:none;">
	    			<input id="commID" type="hidden" value="${r.commCode }"/>
	    			<input id="buyAmount" type="hidden" value="1"/>
	               <a href="<%=path%>/${r.link}">
		                <c:forEach items="${r.shopCommImages }" var="i" begin="0" end="1">
		                	<img src="<%=path%>${i.imagePath}" />
		    			</c:forEach>
	    			</a>
	                <div class="name">${r.commoidtyName}<br /></div>
	                <div class="price">￥${r.unitPrice }</div>
	                <a href="javascript:void(0);" onclick="buyCat();">
						<div class="btn">加入购物车</div>
					</a>
	            </li>
	    	</c:forEach>
        </ul>
    </div>
    
</div>

<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
