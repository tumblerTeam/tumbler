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
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<!--<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>-->
<script>
	function f1(div1,div2){
		if(div2.style.display=="none"){
			div2.style.display="block";
			}else{
				 div2.style.display="none";
			}
		}
</script>
</head>

<body>
<!-- 顶部部分 -->
<jsp:include page="setupShopCommons/header.jsp" />
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />        
        <div class="bread" >
        	<div class="left1"><a href="#">我是卖家</a> < 申请开店</div>
            <a href="#"><span class="right1">开店帮助</span></a>
        </div>
        <div class="content">
        	<h2>免费开店</h2>
            <div class="h3"><font style="font-weight:700">申请店铺完全免费；一个身份证只能开一家店；开店之后店铺无法注销，</font>申请到正式开通预计需要1—3个工作日。</div>
            <div class="h4">想了解更多开店攻略，请<a href="#">点击这里</a>。流程如下：</div>
            <div class="box">
            	<ul>
                	<li>
                    	<div class="box_class">
                            <img src="content/static/images/b1.png" />
                            <div>
                                <p>开店类型选择</p>
                                <p style="color:#ccc;">个人店铺 企业店铺</p>
                            </div>
                        </div>
                    </li>
                    <li>
                    	<div class="box_class" style="width:240px;">
                            <img src="content/static/images/b2.png"  style="margin-left:0px;" />
                            <div style="margin-right:0px;">
                                <p>申请开店认证</p>
                                <p style="color:#ccc;">需提供认证相关资料，等待审核通过</p>
                            </div>
                        </div>
                    </li>
                    <li style="border-right:none;">
                    	<div class="box_class">
                            <img src="content/static/images/b3.png" />
                            <div>
                                <p>创建开店成功</p>
                                <p style="color:#ccc;">店铺开通后完善店铺信息</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="last">
            	<div class="xx">选择开店类型:</div>
                <a href="guize.html"><div class="xx1">开店规则必看>></div></a>
                <ul>
                	<li>
                    	<img src="content/static/images/geren.png" /> 
                        <div  class="box1">
                        	<h4>个人店铺权益</h4>
                             <hr style="border-style:dashed; border-color:#666;" />
                            <p>免费使用图片空间</p>
                            <p>免费使用图片空间</p>
                            <p>免费使用图片空间</p>
                        </div>
                        <a href="proscenium/open_geren"><div class="btn">个人开店</div></a>
                    </li>
                    <li>
                    	<img src="content/static/images/qiye.png" />
                         <div  class="box1">
                         	<h4>企业店铺权益</h4>
                            <hr style="border-style:dashed; border-color:#666;" />
                            <p>免费使用图片空间</p>
                            <p>免费使用图片空间</p>
                            <p>免费使用图片空间</p>
                         </div>
                         <a href="proscenium/open_qiye"><div class="btn">企业开店</div></a>
                    </li>
                </ul>
            </div>
        </div>
      
      <!--中间结束-->  
    </div>
</div>
<!-- 页脚部分 -->
<jsp:include page="../frontDesk/foot.jsp"/>

</body>
</html>
