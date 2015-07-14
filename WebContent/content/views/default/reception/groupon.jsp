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
<title>倒翁精品</title>
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
<style>
	.bgimg{ opacity:0.3;}
</style>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "团购"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='团购大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 450px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='团购强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;border-bottom:1px #ccc dashed;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='团购强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='团购推荐A1'){
                        	 $("#Adv_2").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='团购推荐A2'){
                        	 $("#Adv_3").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='团购单品A4'){
                        	 $("#Adv_4").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='团购单品A5'){
                        	 $("#Adv_5").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='团购单品A1'){
                        	 $("#Adv_6").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='团购单品A2'){
                        	 $("#Adv_7").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='团购单品A3'){
                        	 $("#Adv_8").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"  width=\"238px\"/></a>");
                         }else if(item.adverDistribution.position=='团购推荐A3'){
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
	<jsp:include page="../frontDesk/header.jsp" />
     <!--banner内容-->
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
<!--商城精选-->
<div class="main_box">
	<div class="mall">
    	<div class="title"><b>团购精选</b> Hotsale of Selected</font></div>
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
      <!--团购-->
      <h2 class="tg_tt">每日团购</h2>
      <ul class="tg">
      		<li class="hotsale_1">
            	<a class="left_pic">
                	<img src="images/shop/tg_1.jpg" />
                </a>
            	<div class="right_box">
                	<div class="tg_time">
                    	限时团购
                        <strong class="day">00</strong>
                        <span>天</span>
                        <strong class="hour">00</strong>
                        <span>时</span>
                        <strong class="min">00</strong>
                        <span>分</span>
                        <strong class="sec">00</strong>
                        <span>秒</span>
                    </div>
                	<div class="tg_brand">
                    </div>
                    <h3 class="p_tt">
                    	<a href="#"><strong>拉菲传奇波尔多干红葡萄酒</strong> 2012</a>
                  	</h3>
                    <p class="desc">
                    	拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。该庄出产的葡萄酒是享誉世界的波尔多葡萄酒之一，法国波尔多五大名庄之一1354年拉菲创园。被称为葡萄酒王国 中的“皇后”。历经几个世纪的变迁，拉菲红酒作为世界顶级葡萄酒的质量和声誉维持至今。
                    </p>
                    <p class="tg_price">
                    	团购价
                        <strong>¥158</strong>
                        <span class="tg_price2">
                        	<b>8.0</b>
                       	折
                        </span>
                        <br />
                        <span class="tg_price1">
                        	不倒翁原价
                            <del>¥198</del>
                        </span>
                        参考价 ¥208
                    </p>
                    <a class="tg_btn" href="#">
                    	<img src="content/static/images/sc.png" />
                    </a>
                </div>	
      		</li>
            <li class="hotsale_1">
            	<a class="left_pic">
                	<img src="images/shop/tg_1.jpg" />
                </a>
            	<div class="right_box">
                	<div class="tg_time">
                    	限时团购
                        <strong class="day">00</strong>
                        <span>天</span>
                        <strong class="hour">00</strong>
                        <span>时</span>
                        <strong class="min">00</strong>
                        <span>分</span>
                        <strong class="sec">00</strong>
                        <span>秒</span>
                    </div>
                	<div class="tg_brand">
                    </div>
                    <h3 class="p_tt">
                    	<a href="#"><strong>拉菲传奇波尔多干红葡萄酒</strong> 2012</a>
                  	</h3>
                    <p class="desc">
                    	拉菲位于法国梅多克地区，占地达178公顷的葡萄酒庄园。该庄出产的葡萄酒是享誉世界的波尔多葡萄酒之一，法国波尔多五大名庄之一1354年拉菲创园。被称为葡萄酒王国 中的“皇后”。历经几个世纪的变迁，拉菲红酒作为世界顶级葡萄酒的质量和声誉维持至今。
                    </p>
                    <p class="tg_price">
                    	团购价
                        <strong>¥158</strong>
                        <span class="tg_price2">
                        	<b>8.0</b>
                       	折
                        </span>
                        <br />
                        <span class="tg_price1">
                        	不倒翁原价
                            <del>¥198</del>
                        </span>
                        参考价 ¥208
                    </p>
                    <a class="tg_btn" href="#">
                    	<img src="content/static/images/sc.png" />
                    </a>
                </div>	
      		</li>
      </ul>
     
    </div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
