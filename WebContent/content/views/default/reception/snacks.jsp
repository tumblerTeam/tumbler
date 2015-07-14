<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小食品</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/StackBlur.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/tz.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/right.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/b_style.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/sf.css" />
<!--全部分类js-->
<style>
	.bgimg{ opacity:0.3;}
</style>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "周边和食品"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
        				//   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='周边和食品大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 450px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='周边和食品强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;border-bottom:1px #ccc dashed;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='周边和食品强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='周边和食品主推A1'){
                        	 $("#Adv_2").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='周边和食品主推A2'){
                        	 $("#Adv_3").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='周边和食品单品A1'){
                        	 $("#Adv_4").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='周边和食品单品A2'){
                        	 $("#Adv_5").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='周边和食品单品A3'){
                        	 $("#Adv_6").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }
        			   });//动态生成广告
        			   if(window.screen.width<=1680){
        					$("#csdiv").animate(
        								{width:190},5000).css("transition","all 0.5s").css("right","120px");
        						}else{
        					$("#csdiv").animate(
        								{width:190},5000).css("transition","all 0.5s").css("right","350px");
        						}
        						 		
        					$(".prev,.next").hover(function(){
        						$(this).stop(true,false).fadeTo("show",0.9);
        					},function(){
        						$(this).stop(true,false).fadeTo("show",0.4);
        					});
        					
        					$(".banner-box").slide({
        						titCell:".hd ul",
        						mainCell:".bd ul",
        						effect:"fold",
        						interTime:3500,
        						delayTime:500,
        						autoPlay:true,
        						autoPage:true, 
        						trigger:"click" 
        					});
		        				$(".banner-box2").slide({
		        					titCell : ".hd ul",	
		        					mainCell : ".bd ul",
		        					effect : "fold",
		        					interTime : 3500,
		        					delayTime : 500,
		        					autoPlay : true,
		        					autoPage : true,
		        					trigger : "click"
		        				});
		        				//start
		        				$("#csdiv").children(this).hover(function(){
		            				var index=$("#csdiv").children(this).index($(this)); //当前鼠标悬停索引
		            				var a = new Array(2);
		            				a[0]=0;
		            				a[1]=1;
		            			
		            				for(var i=0;i<a.length;i++){
		            					if(index==i){
		    		            			$("#csdiv").children(this).eq(i).children($("#csdiv").children(this).eq(i)).html("");
		            						}else{
		            							$("#csdiv").children(this).eq(i).children($("#csdiv").children(this).eq(i)).html("<img class='bgimg' src='content/static/images/bgblack.jpg'/>");
		            							}
		            					}
		            				},function(){
		            			$(this).css("position","all 0.1s").css("marginLeft","0px");
		            			$("#csdiv").children(this).children($("#csdiv").children(this)).find("img").remove();
		            				});
		            			//end
        		   });
         });
</script>
</head>

<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<div class="banner">
  <div class="banner-box">
	        <div id="csdiv" style="border: 0px solid red; width: 190px; height: 450px; float: left; position: absolute; z-index: 9999; right: -300px;"></div>
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
	<!--小食品列表-->
	<div class="content">
		<div class="main_sf">
			<div class="item_1">
				<div class="item_1_left" id="Adv_2">
				</div>
				<div class="item_1_right" id="Adv_3">
				</div>
			</div>
			<div class="item_2">
				<div style="width: 344px; height: 300px; float: left; background: url(content/static/img/sf_bg.jpg); padding-top: 30px;">
					<div class="img1" id="Adv_4">
					</div>

				</div>
				<div style="width: 423px; height: 300px; float: left; margin-left: 5px; background: url(content/static/img/sf_bg.jpg); padding-top: 30px;">
					<div class="img1" id="Adv_5">
					</div>
				</div>
				<div style="width: 423px; height: 300px; float: right; margin-left: 5px; background: url(content/static/img/sf_bg.jpg); padding-top: 30px;">
					<div class="img1" id="Adv_6">
					</div>
				</div>
			</div>

			<ul class="item_3">
				<c:forEach items="${snacksList}" var="snacks">
					<li style="margin-left: 5px;">
						<div class="img_3">
							<a href="#"><img src="${snacks.shopCommImages[0].imagePath}" /></a>
						</div>
						<div class="inf_3">
							<h3>
								<a href="#">${snacks.commoidtyName}</a>
							</h3>
							<div class="price">
								零售参考价：<span>¥${snacks.unitPrice}</span>
							</div>
							<div class="sale">
								<em>不倒翁价</em> <span>¥${snacks.unitPrice}</span>
							</div>
							<a href="#" class="shopcar"><img
								src="content/static/images/sc.png" /></a>
						</div>
					</li>
				</c:forEach>

			</ul>


		</div>

	</div>

	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />

</body>
</html>
