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
<!--中间内容-->
        <div>
         <div class="bread" >
        	<div class="left1"><a href="open.html">我是卖家</a> < <span style="font-weight:700;">出售中的商品</span></div>
            <a href="#"><span class="right1">买家交易学习专区</span></a>
        </div>
        <div class="sold">
        	<div class="top" style="height:90px;">
        		<form action="proscenium/searchCommNameCateBrand" method="get">
					商品（品牌、类别）名称：<input type="text" name="name" /> 
                    <input type="submit" value="搜索"/>
                 </form>
            	<form action="proscenium/searchCommName" method="get">
                	商品名称：<input type="text" name="commoidtyName" style="margin-right:10px;"/> 
			                    商家编码：<input type="text" name="commCode" style="margin-right:10px;"/>
			                    商家货号：<input type="text" name="commItem" />
			        <input type="submit" value="搜索"/>
        		</form>
            </div>
            <div class="all">
            	<div class="all_nav">
                	<ul>
                    	<li style="width:362px;">商品名称</li>
                        <li>价格</li>
                        <li>库存</li>
                        <li>操作</li>
                    </ul>
                </div>
                <form action="proscenium/multiDelComm">
	                <div class="all_nav1">
	                	<input type="checkbox" name="quan" />全选
	                    <input type="submit" value="删除" style="margin:15px 0px 0px 15px;">	
	                </div>
	                <script type="text/javascript">
	                	function multiDownComm(){
	                		alert(1);
	                		document.forms[0].action = "proscenium/multiDownComm";
	                		document.forms[0].submit();
	                	}
	                </script>
	               	<div class="all_class2">
	               		<ul><c:forEach items="${commodities }" var="c">
	               			<li style="width:362px;">
	               			<input type="checkbox" name="checkbox" value="${c.commCode }" />
	               			<img src="" width="50px;" />
	                            <div class="l1"><a href="#">${c.commoidtyName } <br /></a></div>
	               			</li>
	               			<li  style="text-align:center; line-height:100px;">${c.unitPrice}</li>
	                        <li>
	                        	<div class="l3">${c.stock }</div>
	                        	<c:if test="${flag==1}">
	                            	<div class="l4"><a style="color:#fff; text text-decoration: none;" href="proscenium/downComm?commId=${c.commCode }">下架</a></div>
								</c:if>
								<c:if test="${flag==0}">
	                            	<div class="l4"><a style="color:#fff; text text-decoration: none;" href="proscenium/upComm?commId=${c.commCode }">上架</a></div>
								</c:if>
	                        </li>
	                        <li>
	                        	<div class="l5"><a href="proscenium/editCommoidty?commid=${c.commCode }">编辑商品</a></div>
	                            <div class="l6"><a href="#">复制链接</a></div>
	                        </li>
	               		</c:forEach></ul>
	               </div>
               </form>
               <div class="all_class2">
               		<ul>
                    	<li style="width:362px;">
                        	<form><input type="checkbox" name="ww" /></form>
                            <img src="images/quan.jpg" width="50px;" />
                            <div class="l1"><a href="#">【名庄】拉格喜庄园正牌干红葡萄酒 2006 <br />Chateau Lagrange 2006</a></div>	
                            <div class="l2">商家编码：9002534</div>
                        </li>
                        <li  style="text-align:center; line-height:100px;">99.00</li>
                        <li>
                        	<div class="l3">99</div>
                            <div class="l4">上架</div>
                        </li>
                        <li>
                        	<div class="l5"><a href="#">编辑商品</a></div>
                            <div class="l6"><a href="#">复制链接</a></div>
                        </li>
                    </ul>
               </div>
            </div>
        </div>
      </div>
      <!--中间结束-->
    </div>
</div>
<!-- 页脚部分 -->
<jsp:include page="../frontDesk/foot.jsp"/>

</body>
</html>
