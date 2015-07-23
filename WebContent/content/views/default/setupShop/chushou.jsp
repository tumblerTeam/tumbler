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
<base href="<%=basePath%>"/>
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<script type="text/javascript" src="content/static/js/datetime/jquery.js"></script>
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
<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
<!--中间内容-->
        <div>
         <div class="bread" >
        	<div class="left1"><a href="proscenium/openShop">我是卖家</a> < <span style="font-weight:700;">出售中的商品</span></div>
            <a href="#"><span class="right1">买家交易学习专区</span></a>
        </div>
        <div class="sold">
        	<div class="top" style="height:90px;">
        		<form action="proscenium/searchCommItem" method="get">
					商品条形码号：<input type="text" name="commItem" /> 
                    <input type="submit" value="搜索"/>
                 </form>
            	<form action="proscenium/searchCommName" method="post">
                	商品名称：<input type="text" name="cname" style="margin-right:10px;"/> 
<!-- 			                    品牌名称：<input type="text" name="bname" style="margin-right:10px;"/> -->
			                    类别名称：<input type="text" name="category" style="margin-right:10px;"/>
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
                <form action="proscenium/multiDelComm" onsubmit="return checkDel();">
	                <div class="all_nav1">
<!-- 	                	<input type="checkbox" name="quan" />全选 -->
	                    <input type="submit" value="删除" style="margin:15px 0px 0px 15px;">
	                    <label id="tishi" style="color: red;"></label>	
	                </div>
	                <script type="text/javascript">
	                	function multiDownComm(){
	                		document.forms[0].action = "proscenium/multiDownComm";
	                		document.forms[0].submit();
	                	}
	                </script>
	               	<div class="all_class2">
	               		<ul><c:forEach items="${commodities }" var="c">
	               			<li style="width:362px;">
	               			<input type="checkbox" name="checkbox" value="${c.commCode }" />
	               			<img src="" width="50px;" />
	                            <div class="l1"><a href="search/shopItem?commID=${c.commCode }&category=${c.shopCategory.categoryID }&shopID=${c.belongTo.id }&commoName=${c.commoidtyName }">${c.commoidtyName } <br /></a></div>
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
	                            <div class="l6">
	                            	<input id="btn${c.commCode }" type="text" name="btn2" value="<%=basePath%>${c.link}" size="12px;"/>
	                            	<a href="javascript:void(0)" onclick="copyURL('${c.commCode }');">复制链接</a>
	                            	<label id="promptcopy${c.commCode }" style="color:#0080FF; width:120px;float:right;"></label>
	                            </div>
	                            
	                        </li>
	               		</c:forEach></ul>
	               </div>
               </form>
            </div>
        </div>
      </div>
      <script type="text/javascript">
      function copyURL(cid){
    	  var url = $("#btn"+cid);
    	  url.select();
    	  document.execCommand("Copy");
    	  $("#promptcopy"+cid).text("复制成功！");
    	  //alert(cid);
    	  //var clipBoardContent=$("#btn"+cid).val();
    	  //alert(clipBoardContent);
    	 // window.clipboardData.setData("Text",clipBoardContent);
      }
      	function checkDel(){
      		var tishi =$("#tishi");
      		var chk_value =[]; 
      		$("input[name='checkbox']:checked").each(function (){
				chk_value.push($(this).val());
			});
      		if (chk_value.length==0) {
      			tishi.text("请至少选择一个");
      			return false;
			}else{
	      		return true;
			}
      	}
      </script>
<!-- 页脚部分 -->
<jsp:include page="../frontDesk/foot.jsp"/>

</body>
</html>
