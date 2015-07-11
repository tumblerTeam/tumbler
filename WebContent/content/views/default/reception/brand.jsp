<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>不倒翁</title>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/right.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/animation.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/b_style.css" />
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "品牌专区"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='品牌专区大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 571px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='品牌专区强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='品牌专区强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='品牌专区强力推荐A3'){
                        	 $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='品牌洋酒单品'){
                        	 $("#Adv_2").append("<li class=\"bannerdh\"><div class=\"img\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div></li>");
                         }else if(item.adverDistribution.position=='品牌红酒单品'){
                        	 $("#Adv_3").append("<li class=\"bannerdh\"><div class=\"img\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div></li>");
                         }else if(item.adverDistribution.position=='品牌白酒单品'){
                        	 $("#Adv_4").append("<li class=\"bannerdh\"><div class=\"img\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div></li>");
                         }else if(item.adverDistribution.position=='品牌啤酒单品'){
                        	 $("#Adv_5").append("<li class=\"bannerdh\"><div class=\"img\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div></li>");
                         }
        				    
                           $("#csdiv").animate({
		        					width : 290
		        				}, 5000).css("transition", "all 0.5s").css("right", "350px");
                           
		        				$(".prev,.next").hover(function() {
		        					$(this).stop(true, false).fadeTo("show", 0.9);
		        				}, function() {
		        					$(this).stop(true, false).fadeTo("show", 0.4);
		        				});
		        	            
		        				$(".banner-box").slide({
		        					titCell : ".hd ul",	
		        					mainCell : ".bd ul",
		        					effect : "fold",
		        					interTime : 3500,
		        					delayTime : 500,
		        					autoPlay : true,
		        					autoPage : true,
		        					trigger : "click"
		        				});
   			   });
   		   });
    });
</script>
</head>
<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<!--banner-->
	<div class="banner">
  <div class="banner-box">
	        <div id="csdiv" style="border: 0px solid red; width: 290px; height: 570px; float: left; position: absolute; z-index: 9999; right: -300px;"></div>
		    <jsp:include page="../frontDesk/cate.jsp" />
	    	<div class="bd">
				<ul id="Adv_1">
				</ul>
			</div>
			<div class="banner-btn">
				 <a class="prev" href="javascript:void(0);"></a>
                 <a class="next" href="javascript:void(0);"></a> 
			</div>
			<div class="hd">
				<ul></ul>
			</div>
		</div>
	</div>
	<!--品牌专区-->
	<div class="main_box">
		<div class="content">
			<div class="all1">
				<div class="title1">
					<div class="z1">
						<h2>洋酒专区 Wine Zone</h2>
					</div>
					<a href="#"><div class="z2">查看更多>></div></a>
				</div>
				<ul id="Adv_2">
				</ul>
			</div>

			<div class="all1">
				<div class="title1">
					<div class="z1" style="margin-top: 0px;">
						<h2>红酒专区 Red wine Zone</h2>
					</div>
					<a href="#"><div class="z2" style="margin-top: 15px;">查看更多>></div></a>
				</div>
				<ul  id="Adv_3">
				</ul>
			</div>
			<div class="all1">
				<div class="title1">
					<div class="z1" style="margin-top: 0px;">
						<h2>白酒专区 White spirit Zone</h2>
					</div>
					<a href="#"><div class="z2" style="margin-top: 15px;">查看更多>></div></a>
				</div>
				<ul id="Adv_4">
				</ul>
			</div>
			<div class="all1">
				<div class="title1">
					<div class="z1" style="margin-top: 0px;">
						<h2>啤酒专区 Beer Zone</h2>
					</div>
					<a href="#"><div class="z2" style="margin-top: 15px;">查看更多>></div></a>
				</div>
				<ul id="Adv_5">
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>