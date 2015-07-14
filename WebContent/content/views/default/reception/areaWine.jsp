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
<style>
	.bgimg{ opacity:0.3;}
</style>
<script type="text/javascript">
         $(function(){
        	   $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "地方名酒"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='地方名酒大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 450px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='地方名酒强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;border-bottom:1px #ccc dashed;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='地方名酒强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='地方名酒名庄单品A'){
                       	     $("#Adv_5").append("<div class=\"bander_class\" style=\"border-top:none; border-left:none;\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div>");
                         }else if(item.adverDistribution.position=='地方名酒名庄单品B'){
                       	     $("#Adv_6").append("<div class=\"bander_class\" style=\"border-top:none; border-left:none;\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div>");
                         }else if(item.adverDistribution.position=='地方名酒名庄单品C'){
                       	     $("#Adv_7").append("<div class=\"bander_class\" style=\"border-top:none; border-left:none;\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a></div>");
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
	<!--banner-->
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
<!--酒内容-->
<div class="main_box">
<div class="content" >
  <div class="title"><b>地方名酒</b><font> Chateau Sale</font></div>
    <div class="box"  id="Adv_5">
	<a href="javascript:void(0)"><div class="bander">
    	<img src="content/static/images/yili.jpg"/>
        <div class="bander_zi">男人的故事，就是一瓶酒。几分豪气，几分义气，时间珍酿，情义自然真切。一瓶酒，品味一生。岁月如酒醇香，情义地久天长，52度伊力老窖。小酌天地方圆，尽享精致人生；大隐浮华喧市，智品世间百态；心自远，天地宽。小老窖，大智慧，46度伊力老窖。 </div>
    </div>
    </a>
    
  </div>     
   <div class="box"  id="Adv_6">
	<div class="bander">
    	<a href="#"><img src="content/static/images/wu.jpg"></a>
        <div class="bander_zi">四川酿酒自古兴盛，酿酒的原料、水性、土质和气候条件得天独厚。临邛酒早在汉代即远近驰名；西川郫筒酒，工艺独特，享誉四方；宋代宜宾的荔枝酒，颇负盛名。并创造出许多酒的传说和活动。汉代文君酒当垆、相如涤器，传为千古美谈；宋代诗人黄庭坚在宜宾凿池流觞，至今遗址犹存。四川名酒荟萃，五粮液、泸州老窖特曲、剑南春、郎酒、全兴大曲、沱牌曲酒被评为全国名酒，人称“六朵金花”。</div>
    </div>
  </div>
    <div class="box" id="Adv_7">
	<div class="bander">
    	<img src="content/static/images/yili.jpg">
        <div class="bander_zi">男人的故事，就是一瓶酒。几分豪气，几分义气，时间珍酿，情义自然真切。一瓶酒，品味一生。岁月如酒醇香，情义地久天长，52度伊力老窖。小酌天地方圆，尽享精致人生；大隐浮华喧市，智品世间百态；心自远，天地宽。小老窖，大智慧，46度伊力老窖。 </div>
    </div>
    </div>
</div>
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>