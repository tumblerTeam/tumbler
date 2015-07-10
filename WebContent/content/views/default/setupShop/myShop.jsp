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
<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>

<!--banner-->
<div class="banner" style="height:500px;">
	<div class="menu_nav">
		<div class="menu_left">
        	<div class="list">
            	<h2><a href="proscenium/goods?flag=3&shopId=${shopId}&key=葡萄酒">葡萄酒</a></h2>
                <div class="list_con">
	                <c:forEach items="${mapRed}" var="entry" varStatus="vs" begin="0">
	                	<a href="proscenium/goods?flag=2&shopId=${shopId}&key=${entry.value}">${entry.value}</a>
	                	
	                	<c:if test="${vs.index%3 == 2}"><br/></c:if>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="proscenium/goods?flag=3&shopId=${shopId}&key=白酒">白酒</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapWhite}" var="entry">
	                	<a href="proscenium/goods?flag=2&shopId=${shopId}&key=${entry.value}">${entry.value}</a>
	                	<c:if test="${vs.index%3 == 2}"><br/></c:if>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="proscenium/goods?flag=3&shopId=${shopId}&key=啤酒">啤酒</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapPi}" var="entry">
	                	<a href="proscenium/goods?flag=2&shopId=${shopId}&key=${entry.value}">${entry.value}</a>
	                	<c:if test="${vs.index%3 == 2}"><br/></c:if>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="proscenium/goods?flag=3&shopId=${shopId}&key=洋酒">洋酒</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapYang}" var="entry">
	                	<a href="proscenium/goods?flag=2&shopId=${shopId}&key=${entry.value}">${entry.value}</a>
	                	<c:if test="${vs.index%3 == 2}"><br/></c:if>
	                </c:forEach>
                </div>
            </div>
            
            <div class="list">
            	<h2><a href="proscenium/goods?flag=3&shopId=${shopId}&key=小食品">小食品</a></h2>
                <div class="list_con">
                	<c:forEach items="${mapFood}" var="entry">
	                	<a href="proscenium/goods?flag=2&shopId=${shopId}&key=${entry.value}">${entry.value}</a>
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
              <form action="proscenium/goods">
              		<input type="hidden" name="shopId" value="${shopId}"/>
              		<input type="hidden" name="flag" value="1"/>
                    <input type="search" name="key" value="搜索本店商品" style="margin-left:20px;" />
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
    <div class="ad">
    	<a href="proscenium/goods?flag=3&shopId=${shopId}&key=葡萄酒">
    		<img src="content/static/images/ad4.jpg" />葡萄酒
    	</a>
    </div>
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
    <a href="proscenium/goods?flag=3&shopId=${shopId}&key=白酒">
   		<img src="content/static/images/ad4.jpg" />白酒
   	</a>
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
    <a href="proscenium/goods?flag=3&shopId=${shopId}&key=啤酒">
   		<img src="content/static/images/ad4.jpg" />啤酒
   	</a>
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
     <a href="proscenium/goods?flag=3&shopId=${shopId}&key=洋酒">
   		<img src="content/static/images/ad4.jpg" />洋酒
   	</a>
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
    <a href="proscenium/goods?flag=3&shopId=${shopId}&key=小食品">
   		<img src="content/static/images/ad4.jpg" />小食品
   	</a>
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
