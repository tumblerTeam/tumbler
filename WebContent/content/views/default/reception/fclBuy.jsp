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
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/b_style.css" />
<script type="text/javascript" src="content/static/js/tumbler/StackBlur.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/animation.css" />
<script type="text/javascript" src="content/static/js/tumbler/tz.js"></script>
<script>
	stackBlurImage( "blur", "canvas", 50, false );
</script>
<!--全部分类js-->
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "整箱特惠"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='整箱特惠大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 571px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='整箱特惠强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='整箱特惠强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='整箱特惠强力推荐A3'){
                        	 $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 185px;margin-top: 5px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A1'){
                        	 $("#Adv_2").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A2'){
                        	 $("#Adv_3").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A4'){
                        	 $("#Adv_4").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A5'){
                        	 $("#Adv_5").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A1'){
                        	 $("#Adv_6").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A2'){
                        	 $("#Adv_7").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A3'){
                        	 $("#Adv_8").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A3'){
                        	 $("#Adv_9").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" height=\"202px\"  width=\"478px\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A1'){
                        	 $("#Adv_10").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A2'){
                        	 $("#Adv_11").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A3'){
                        	 $("#Adv_12").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A4'){
                        	 $("#Adv_13").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A5'){
                        	 $("#Adv_14").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A6'){
                        	 $("#Adv_15").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='品牌展示滚动A7'){
                        	 $("#Adv_16").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A1'){
                        	 $("#Adv_17").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A2'){
                        	 $("#Adv_18").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A4'){
                        	 $("#Adv_19").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A5'){
                        	 $("#Adv_20").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A1'){
                        	 $("#Adv_21").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A2'){
                        	 $("#Adv_22").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A3'){
                        	 $("#Adv_23").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A3'){
                        	 $("#Adv_24").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" height=\"202px\"  width=\"478px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A1'){
                        	 $("#Adv_25").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A2'){
                        	 $("#Adv_26").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A4'){
                        	 $("#Adv_27").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A5'){
                        	 $("#Adv_28").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A1'){
                        	 $("#Adv_29").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A2'){
                        	 $("#Adv_30").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠单品A3'){
                        	 $("#Adv_31").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='整箱特惠推荐A3'){
                        	 $("#Adv_32").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" height=\"202px\"  width=\"478px\"/></a>");
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
<!--头部内容-->
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
<!--商城精选-->
<div class="main_box">
	<div class="mall">
    	<div class="title"><b>整箱特惠</b> Mall of Selected</font></div>
		<div class="mall_box">
            <div class="ad" id="Adv_2" ></div>
            <div class="ad" id="Adv_3" ></div>
            <div class="pro" id="Adv_4">
           </div>
           <div class="pro" id="Adv_5">
           </div>
           <div class="pro1" id="Adv_6">
          </div>
           <div class="pro1" id="Adv_7">
          </div>
           <div class="pro1" id="Adv_8">
          </div>
            <div class="ad1" id="Adv_9"></div>  
      </div>
       <div class="logo_box" >
       		<div class="logo_img" style="margin-left:5px; border-left:none;" id="Adv_10"></div>
            <div class="logo_img" id="Adv_11"></div>
            <div class="logo_img" id="Adv_12"></div>
            <div class="logo_img" id="Adv_13"></div>
            <div class="logo_img" id="Adv_14"></div>
            <div class="logo_img" id="Adv_15"></div>
            <div class="logo_img" style="border-right:none;" id="Adv_16"></div> 
       </div>
     <div class="mall_box">
            <div class="ad" id="Adv_17" ></div>
            <div class="ad" id="Adv_18" ></div>
            <div class="pro" id="Adv_19">
           </div>
           <div class="pro" id="Adv_20">
           </div>
           <div class="pro1" id="Adv_21">
          </div>
           <div class="pro1" id="Adv_22">
          </div>
           <div class="pro1" id="Adv_23">
          </div>
            <div class="ad1" id="Adv_24"></div>  
      </div>
      
    <div class="mall_box">
            <div class="ad" id="Adv_25" ></div>
            <div class="ad" id="Adv_26" ></div>
            <div class="pro" id="Adv_27">
           </div>
           <div class="pro" id="Adv_28">
           </div>
           <div class="pro1" id="Adv_29">
          </div>
           <div class="pro1" id="Adv_30">
          </div>
           <div class="pro1" id="Adv_31">
          </div>
            <div class="ad1" id="Adv_32"></div>  
      </div>
    </div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
