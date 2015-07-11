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
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>不倒翁</title>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/right.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/daxuewen1012.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/animation.css" />
<link rel="stylesheet" type="text/css" href="content/static/css/b_style.css" />
<script type="text/javascript"  src="content/static/js/tumbler/tz.js"></script>
<script type="text/javascript">
         $(function(){
        	   $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "名庄特卖"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='名庄特卖大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 571px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='名庄特卖强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='名庄特卖强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='名庄特卖强力推荐A3'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='名庄特卖名庄单品A'){
                       	     $("#Adv_5").append("<div class=\"bander_class\" style=\"border-top:none; border-left:none;\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div>");
                         }else if(item.adverDistribution.position=='名庄特卖名庄单品B'){
                       	     $("#Adv_6").append("<div class=\"bander_class\" style=\"border-top:none; border-left:none;\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div>");
                         }else if(item.adverDistribution.position=='名庄特卖名庄单品C'){
                       	     $("#Adv_7").append("<div class=\"bander_class\" style=\"border-top:none; border-left:none;\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div>");
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
<!--酒内容-->
<div class="main_box">
<div class="content" >
  <div class="title"><b>名庄特卖</b><font> Chateau Sale</font></div>
    <div class="box"  id="Adv_5">
	<a href="javascript:void(0)"><div class="bander">
    	<img src="content/static/images/band1_03.jpg"/>
        <div class="bander_zi">拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。</div>
    </div>
    </a>
    
  </div>     
   <div class="box"  id="Adv_6">
	<div class="bander">
    	<a href="#"><img src="content/static/images/band1_03.jpg"></a>
        <a href="#"><div class="bander_zi">奔富酒庄的故事就是一部欧洲人一名澳洲分都有成功的历史，反映了澳洲过去二百年的发展。有荒芜的大陆成为现在稳站世界舞台的先进国家。创办人克里斯多夫.洛神.奔富医生一百六十多年期来到澳洲，开始了葡萄酒传奇之路</div></a>
    </div>
  </div>
    <div class="box" id="Adv_7">
	<div class="bander">
    	<a href="#"><img src="content/static/images/band1_03.jpg"></a>
        <a href="#"><div class="bander_zi">拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。改庄出产的葡萄酒是享誉世界的波多尔葡萄酒之一。</div></a>
    </div>
    </div>
</div>
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>