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
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/right.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/animation.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/businesses.css"/>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>

<link  href="content/static/css/daxuewen1012.css" rel="stylesheet"/>
<style>
.left li.ysli{ font-weight:bold; border-bottom:2px #A40C59 solid;}
.yslia{border-bottom:2px #A40C59 solid;}
</style>
<script src="content/static/js/tumbler/tz.js"></script>
<script src="content/static/js/tumbler/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<link href="content/static/css/b_style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "商铺页面"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='商铺页面大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 450px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='商铺页面强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;border-bottom:1px #ccc dashed;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='商铺页面强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推A'){
                        	 $("#Adv_2").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品A1'){
                        	 $("#Adv_3").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品A2'){
                        	 $("#Adv_4").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品A3'){
                        	 $("#Adv_5").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品A4'){
                        	 $("#Adv_6").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品A5'){
                        	 $("#Adv_7").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品A6'){
                        	 $("#Adv_8").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推B'){
                        	 $("#Adv_9").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B1'){
                        	 $("#Adv_10").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B2'){
                        	 $("#Adv_11").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B3'){
                        	 $("#Adv_12").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B4'){
                        	 $("#Adv_13").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B5'){
                        	 $("#Adv_14").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B6'){
                        	 $("#Adv_15").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B7'){
                        	 $("#Adv_16").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品B8'){
                        	 $("#Adv_17").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推C'){
                        	 $("#Adv_18").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C1'){
                        	 $("#Adv_19").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C2'){
                        	 $("#Adv_20").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C3'){
                        	 $("#Adv_21").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C4'){
                        	 $("#Adv_22").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C5'){
                        	 $("#Adv_23").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C6'){
                        	 $("#Adv_24").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C7'){
                        	 $("#Adv_25").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品C8'){
                        	 $("#Adv_26").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推D'){
                        	 $("#Adv_27").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D1'){
                        	 $("#Adv_28").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D2'){
                        	 $("#Adv_29").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D3'){
                        	 $("#Adv_30").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D4'){
                        	 $("#Adv_31").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D5'){
                        	 $("#Adv_32").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D6'){
                        	 $("#Adv_33").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D7'){
                        	 $("#Adv_34").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品D8'){
                        	 $("#Adv_35").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推E'){
                        	 $("#Adv_36").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E1'){
                        	 $("#Adv_37").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E2'){
                        	 $("#Adv_38").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E3'){
                        	 $("#Adv_39").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E4'){
                        	 $("#Adv_40").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E5'){
                        	 $("#Adv_41").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E6'){
                        	 $("#Adv_42").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E7'){
                        	 $("#Adv_43").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品E8'){
                        	 $("#Adv_44").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推F'){
                        	 $("#Adv_45").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F1'){
                        	 $("#Adv_46").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F2'){
                        	 $("#Adv_47").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F3'){
                        	 $("#Adv_48").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F4'){
                        	 $("#Adv_49").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F5'){
                        	 $("#Adv_50").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F6'){
                        	 $("#Adv_51").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F7'){
                        	 $("#Adv_52").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
                         }else if(item.adverDistribution.position=='商铺页面主推单品F8'){
                        	 $("#Adv_53").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
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
<style>
	.bgimg{ opacity:0.3;}
</style>
<!--banner-->
<	<div class="banner">
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

<!--商家店铺内容-->
<div class="business">
	<div class="add" id="Adv_2"></div>
	<div class="search1">
    	  <div>
              <form> 
                    <input type="search" name="serach1" value="解百纳" style=" width:180px; margin-left:15px;" />
                    <button>搜本店</button>
              </form>
          </div> 
          <div  class="zi"><span>冰酒</span><span>解百纳</span><span>拉菲</span></div>                                                                                                     
    </div>
    <div class="brand">
    	<ul>
            <li style="border-left:1px #ccc solid; border-bottom:none;" id="Adv_3"></li>
            <li style=" border-bottom:none;" id="Adv_4"></li>
            <li style=" border-bottom:none;" id="Adv_5"></li>
            <li style="border-left:1px #ccc solid;" id="Adv_6"></li>
            <li id="Adv_7"></li>
            <li id="Adv_8"></li>
        </ul>
    </div>
    <div class="ad" id="Adv_9"></div>
    <div class="class">
    	<ul>
        	<li style="border-right:none;" id="Adv_10">
            </li>
            <li style="border-right:none;" id="Adv_11">
            </li>
            <li style="border-right:none;" id="Adv_12">
            </li>
            <li id="Adv_13">
            </li>
            <li style="border-right:none;" id="Adv_14">
            </li>
            <li style="border-right:none;" id="Adv_15">
            </li>
            <li style="border-right:none;" id="Adv_16">
            </li>
            <li id="Adv_17">
            </li>
        </ul>
    </div>
    <div class="ad" id="Adv_18"></div>
    <div class="class">
    	<ul>
        	<li style="border-right:none;" id="Adv_19">
            </li>
            <li style="border-right:none;" id="Adv_20">
            </li>
            <li style="border-right:none;" id="Adv_21">
            </li>
            <li id="Adv_22">
            </li>
            <li style="border-right:none;" id="Adv_23">
            </li>
            <li style="border-right:none;" id="Adv_24">
            </li>
            <li style="border-right:none;" id="Adv_25">
            </li>
            <li id="Adv_26">
            </li>
        </ul>
    </div>
    <div class="ad" id="Adv_27"></div>
    <div class="class">
    	<ul>
        	<li style="border-right:none;" id="Adv_28">
            </li>
            <li style="border-right:none;" id="Adv_29">
            </li>
            <li style="border-right:none;" id="Adv_30">
            </li>
            <li id="Adv_31">
            </li>
            <li style="border-right:none;" id="Adv_32">
            </li>
            <li style="border-right:none;" id="Adv_33">
            </li>
            <li style="border-right:none;" id="Adv_34">
            </li>
            <li id="Adv_35">
            </li>
        </ul>
    </div>
     <div class="ad" id="Adv_36"></div>
    <div class="class">
    	<ul>
        	<li style="border-right:none;" id="Adv_37">
            </li>
            <li style="border-right:none;" id="Adv_38">
            </li>
            <li style="border-right:none;" id="Adv_39">
            </li>
            <li id="Adv_40">
            </li>
            <li style="border-right:none;" id="Adv_41">
            </li>
            <li style="border-right:none;" id="Adv_42">
            </li>
            <li style="border-right:none;" id="Adv_43">
            </li>
            <li id="Adv_44">
            </li>
        </ul>
    </div>
    <div class="ad" id="Adv_45"></div>
    <div class="class">
    	<ul>
        	<li style="border-right:none;" id="Adv_46">
            </li>
            <li style="border-right:none;" id="Adv_47">
            </li>
            <li style="border-right:none;" id="Adv_48">
            </li>
            <li id="Adv_49">
            </li>
            <li style="border-right:none;" id="Adv_50">
            </li>
            <li style="border-right:none;" id="Adv_51">
            </li>
            <li style="border-right:none;" id="Adv_52">
            </li>
            <li id="Adv_53">
            </li>
        </ul>
        </ul>
    </div>
    
</div>
<!--右侧购物车-->
<div class="sidebar">
	<div class="car" onClick="cardiv()" >
    	<a href="#"></a>
    </div>
    
   <div class="bar" onClick="bardiv()" >
   </div>
   
   <div class="cs">
   </div>
<script>
var bool=true;
 function cardiv(){
	var t=$(".jcsdiv").offset().top;
	var sTop=document.body.scrollTop+document.documentElement.scrollTop;
	
	 if(t==sTop){
		 $(".jcsdiv").animate(
				{width:290},100).css("transition","all 0.5s").css("top","100px").css("right","-300px");
				bool=true;
		 }
	 if(bool){
	 bool=false;
	 $("#cardiv").css("transition","all 0.5s").css("right","0px");
	 $(".sidebar").css("transition","all 0.5s").css("right","290px");
	 $("#menu_l").css("transition","all 0.5s").css("right","290px");
		 }else{ 
	 bool=true;
	 $("#cardiv").css("transition","all 0.5s").css("right","-290px");
	 $(".sidebar").css("transition","all 0.5s").css("right","0px");
	 $("#menu_l").css("transition","all 0.5s").css("right","0px");
			 }
	 }
	 /*鼠标脱离当前div*/
	 	   $(document).on('click', function(event){
                var $this = $(event.target),
                    $parent = $this.closest('.sidebar'),
                    isSearch = $parent.length == 0 || $this.hasClass('sidebar');
                if(isSearch){
	 $("#cardiv").css("transition","all 0.5s").css("right","-290px");
	 $(".sidebar").css("transition","all 0.5s").css("right","0px");
	 $("#menu_l").css("transition","all 0.5s").css("right","0px");
                }
            });
</script>
   <div class="sidebar">
	<div class="car" onClick="cardiv()" >
    	<a href="#"></a>
    </div>
    
   <div class="bar" onClick="bardiv()" >
   </div>
   
   <div class="cs">
   </div>
   <script>
   var bools=false;
   		function bardiv(){
			var t=$(".jcsdiv").offset().top;	
	var sTop=document.body.scrollTop+document.documentElement.scrollTop;
	 if($(".jcsdiv").offset().top>sTop){
			$(".jcsdiv").css("z-index","2");
			$(".gwcdiv").css("z-index","1");
			$(".jcsdiv").animate(
				{width:290},100).css("transition","all 0.5s").css("top","0px").css("right","0px");
				bools=true;
		 		}
	 if(bools){
	 $("#cardiv").css("transition","all 0.5s").css("right","0px");
	 $(".sidebar").css("transition","all 0.5s").css("right","290px");
	 $("#menu_l").css("transition","all 0.5s").css("right","290px");
	 bools=false;
		 }else{ 
	 bools=true;
	 $("#cardiv").css("transition","all 0.5s").css("right","-290px");
	 $(".sidebar").css("transition","all 0.5s").css("right","0px");
	 $("#menu_l").css("transition","all 0.5s").css("right","0px");
			 }
			}
   
   </script>
   <div  id="cardiv" class="cardiv" style="height:100%; width:290px;  float:right; position:fixed;  right:0; z-index:9999; top:0; right:-305px; background-color:#901531" >
    <div class="gwcdiv" style="background-color:#ccc; width:290px; position:absolute; z-index:2;  margin-left:10px; margin-top:0px; height:100%; display:block;" >
            <div style="width:100%; height:100%; position:absolute; top:0px; left:0px;  background-color:#f1f1f1">
            	<!--购物车列表-->
            		<div>
                    	<ul style="height:30px; margin-left:15px; ">
                        	<li style="line-height:30px;float:left; " ><input type="checkbox"  /></li>
                            <li style="float:left; margin-top:4px; font-size:12px;"><span style=" margin-top:0px; margin-left:2px;" >全选</span><span style=" margin-left:140px; font-size:14px; margin-top:4px;"><a >全屏查看&gt;</a></span></li>
                        </ul>
                        <hr style="width:240px; margin-top:0px; border:1px solid ; border-bottom:none; "/>
                    	<ul style="height:80px; margin-top:-5px;  margin-left:15px; ">
                        	<li style="line-height:80px;float:left; " ><input type="checkbox"  /></li>
                            <li style="float:left; margin-top:0px;"><img src="images/sp.png" /></li>
                            <li style="float:left;"><div style="font-size:12px; color:#333; width:50px; overflow:hidden; height:30px; margin-top:20px;" >78941...<br/>白酒</div></li>
                            <li style="float:left; font-size:12px;color:#333; line-height:80px; margin-left:20px;">1</li>
                            <li style="float:left; font-size:12px;color:#333; line-height:80px; margin-left:25px;">888.00</li>
                        </ul>
                        <hr style="width:240px; border:1px solid #ccc; border-bottom:none; margin-top:5px;"/>
                        <div style="position:absolute; bottom:0;  width:280px; height:80px; " >
                        	<span style="float:left; font-size:14px; font-family:'微软雅黑'; " >已选1件</span><span style="float:left; margin-left:170px; color:#901531;font-size:12px; font-family:'微软雅黑'; " >￥888.00</span>					
                                    <div style="width:200px; height:40px; background-color:#901531; margin:0 auto; margin-top:20px; line-height:10px; text-align:center;">
                                        <a href="javascript:;"  id="loginsubmit" tabindex="6" style="color:#fff; line-height:40px;" clstag="pageclick|keycount|20150112ABD|2">付&nbsp;&nbsp;&nbsp;&nbsp;款</a>
                                    </div>
                        </div>
                    </div>
            </div>
    </div>
	<!--酒常识-->
    <div class="jcsdiv"  style="background-color:#ccc;position:absolute; z-index:1; right:-300px; width:290px; top:100px; margin-left:10px; height:100%; display:block;" >
    		
            <div>
                    	<ul style="height:30px; margin-left:15px; ">
                        	<li style="line-height:30px;float:left; " ><input type="checkbox"  /></li>
                            <li style="float:left; margin-top:4px; font-size:12px;"><span style=" margin-top:0px; margin-left:2px;" >全选</span><span style=" margin-left:140px; font-size:14px; margin-top:4px;"><a >全屏查看&gt;</a></span></li>
                        </ul>
                        <hr style="width:240px; margin-top:0px; border:1px solid ; border-bottom:none; "/>
                    	<ul style="height:80px; margin-top:-5px;  margin-left:15px; ">
                        	<li style="line-height:80px;float:left; " ><input type="checkbox"  /></li>
                            <li style="float:left; margin-top:0px;"><img src="images/sp.png" /></li>
                            <li style="float:left;"><div style="font-size:12px; color:#333; width:50px; overflow:hidden; height:30px; margin-top:20px;" >78941...<br/>白酒</div></li>
                            <li style="float:left; font-size:12px;color:#333; line-height:80px; margin-left:20px;">1</li>
                            <li style="float:left; font-size:12px;color:#333; line-height:80px; margin-left:25px;">888.00</li>
                        </ul>
                        <hr style="width:240px; border:1px solid #ccc; border-bottom:none; margin-top:5px;"/>
                        <div style="position:absolute; bottom:0;  width:280px; height:80px; " >
                        	
                        </div>
                    </div>
    </div>
</div>
</div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
