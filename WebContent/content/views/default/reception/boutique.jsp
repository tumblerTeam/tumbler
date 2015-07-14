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
<script type="text/javascript" src="content/static/js/tumbler/StackBlur.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/tz.js"></script>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/right.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/jw.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/b_style.css" />
<!--全部分类js-->
<style>
	.bgimg{ opacity:0.3;}
</style>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "酒翁精品"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='酒翁精品大眼睛'){
                       	    $("#Adv_1").append("<li><a href=\""+item.link+"\"><div class=\"m-width\"style=\"width: 100%; height: 450px; background: url("+item.imagePath+") center center;\"></div></a></li>");
                         }else if(item.adverDistribution.position=='酒翁精品强力推荐A1'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;border-bottom:1px #ccc dashed;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='酒翁精品强力推荐A2'){
                       	     $("#csdiv").append("<a href=\""+item.link+"\"><div style=\"width: 100%; height: 225px;background: url("+item.imagePath+") center center;\"></div></a>");
                         }else if(item.adverDistribution.position=='酒庄精品主推'){
                        	 $("#Adv_2").append("<a href=\""+item.link+"\"  class=\"jw_banner1\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='酒庄推荐A1'){
                        	 $("#Adv_3").append("<a href=\""+item.link+"\"><div class=\"shop_list\"><img src=\""+item.imagePath+"\" /></div></a>");
                         }else if(item.adverDistribution.position=='酒庄推荐A2'){
                        	 $("#Adv_4").append( "<a href=\""+item.link+"\"><div class=\"shop_list\"><img src=\""+item.imagePath+"\" /></div></a>");
                         }else if(item.adverDistribution.position=='酒庄推荐A3'){
                        	 $("#Adv_5").append( "<a href=\""+item.link+"\"><div class=\"shop_list\"><img src=\""+item.imagePath+"\" /></div></a>");
                         }else if(item.adverDistribution.position=='酒庄推荐A4'){
                        	 $("#Adv_6").append( "<a href=\""+item.link+"\"><div class=\"shop_list\"><img src=\""+item.imagePath+"\" /></div></a>");
                         }else if(item.adverDistribution.position=='酒庄推荐A5'){
                        	 $("#Adv_7").append( "<a href=\""+item.link+"\"><div class=\"shop_list\"><img src=\""+item.imagePath+"\" /></div></a>");
                         }else if(item.adverDistribution.position=='酒庄推荐A6'){
                        	 $("#Adv_8").append( "<a href=\""+item.link+"\"><div class=\"shop_list\"><img src=\""+item.imagePath+"\" /></div></a>");
                         }else if(item.adverDistribution.position=='品牌展示A1'){
                        	 $("#Adv_9").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A2'){
                        	 $("#Adv_10").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A3'){
                        	 $("#Adv_11").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A4'){
                        	 $("#Adv_12").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A5'){
                        	 $("#Adv_13").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A6'){
                        	 $("#Adv_14").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A7'){
                        	 $("#Adv_15").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A8'){
                        	 $("#Adv_16").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A9'){
                        	 $("#Adv_17").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
                         }else if(item.adverDistribution.position=='品牌展示A10'){
                        	 $("#Adv_18").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
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

<!--酒翁精品-->
<div class="main_box">
<div class="content">
	<div class="jw_box">
    	<ul>
        	<li class="list1" id="Adv_2">
            </li>
            <li class="list2" id="Adv_3">
           </li>
            <li class="list3" id="Adv_4">
            </li>
           
            <li class="list4">
            	<div class="list4_tt" style="border-bottom:1px solid #e6e6e6;">
            	<b style="padding-left:10px; font-family: "Microsoft Yahei";">热销推荐</b>
                </div>
            	
                <div class="sale_top">
                	<div class="top_1">
                    	<div class="img-1">
                    		<a href="preview.html"><img src="images/shoplist1.gif"/></a>
                        </div>
                        <div class="sale_p">
                        	<em><a href="preview.html">拉菲传奇波尔多红葡萄酒 2012</a></em>
                        	<i>零售参考价：¥124.00</i>
                            <b>促销价 ¥59.00</b>
                            <span>已售：24749</span>
                        </div>
                        <div class="num">1</div>
            		</div>
                	<div class="top_2">
                    	<div class="img-1">
                    		<a href="preview.html"><img src="images/shoplist1.gif"></a>
                        </div>
                        <div class="sale_p">
                        	<em><a href="preview.html">拉菲传奇波尔多红葡萄酒 2012</a></em>
                        	<i>零售参考价：¥124.00</i>
                            <b>促销价 ¥59.00</b>
                            <span>已售：24749</span>
                        </div>
                        <div class="num">2</div>
            		</div>
                	<div class="top_3">
                    	<div class="img-1">
                    		<a href="preview.html"><img src="images/shoplist1.gif"></a>
                        </div>
                        <div class="sale_p">
                        	<em><a href="preview.html">拉菲传奇波尔多红葡萄酒 2012</a></em>
                        	<i>零售参考价：¥124.00</i>
                            <b>促销价 ¥59.00</b>
                            <span>已售：24749</span>
                        </div>
                        <div class="num">3</div>
            		</div>
                	<div class="top_4">
                    	<em>4</em>
                        <a href="#">【名庄】作品一号 2009</a>
                    </div>
                	<div class="top_5">
                    	<em>5</em>
                        <a href="#">【名庄】博斯克酒庄教皇新堡老藤干红葡萄酒 2009</a>
                    </div>
                    
                    
            	</div>
            </li>
            <li class="list5" id="Adv_5">
            </li>
             <li class="list6" id="Adv_6">
            </li>
              <li class="list7" id="Adv_7">
            </li>
             <li class="list8" id="Adv_8">
            </li>
        
        
        </ul>
    </div>
    <!--logo品牌-->
    <div class="brand_logo">
    	<ul>
        <li id="Adv_9"></li>
        <li id="Adv_10"></li>
        <li id="Adv_11"></li>
        <li id="Adv_12"></li>
        <li id="Adv_13"></li>
        <li id="Adv_14"></li>
        <li id="Adv_15"></li>
        <li id="Adv_16"></li>
        <li id="Adv_17"></li>
		<li style="width:118px; border-right:1px solid #e6e6e6;" id="Adv_18"></li>
        </ul>
    </div>
    <!--商品精选列表-->
    <div class="mn_list">
    	<div class="mn_tt">
        	<b>酒翁精品</b>
        </div> 
    	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"/></a>
                </div>
            </dt>
            <dd></dd>
        </dl>
        <!--2-->
    	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"/></a>
                </div>
            </dt>
            <dd>
            </dd>
        </dl>
        <!--3-->
    	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"></a>
                </div>
            </dt>
            <dd>
            </dd>
        </dl>
        <!--4-->
            	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"></a>
                </div>
            </dt>
            <dd>
            </dd>
        </dl>
        <!--5-->
            	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"></a>
                </div>
            </dt>
            <dd>
            </dd>
        </dl>
        <!--6-->
            	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"/></a>
                </div>
            </dt>
            <dd>
            </dd>
        </dl>
        <!--7-->
            	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"/></a>
                </div>
            </dt>
            <dd>
            	<h2>
                	<a href="preview.html">拉菲巴斯克赤霞珠干红葡萄酒 2011（拉菲华诗歌）*2+双支皮盒</a>
                </h2>
                <div class="price">
                	<b>¥217</b>
                    <i>¥500</i>
                </div>
                <div class="evaluate">
                	<span>
                    	<a href="#">已有6241人评价</a>
                    </span>
                    <a class="sc" href="#"></a>
                </div>
            </dd>
        </dl>
        <!--8-->
		    	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"></a>
                </div>
            </dt>
            <dd>
            	<h2>
                	<a href="preview.html">拉菲巴斯克赤霞珠干红葡萄酒 2011（拉菲华诗歌）*2+双支皮盒</a>
                </h2>
                <div class="price">
                	<b>¥217</b>
                    <i>¥500</i>
                </div>
                <div class="evaluate">
                	<span>
                    	<a href="#">已有6241人评价</a>
                    </span>
                    <a class="sc" href="#"></a>
                </div>
            </dd>
        </dl>
        <!--9-->
            	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"></a>
                </div>
            </dt>
            <dd>
            	<h2>
                	<a href="preview.html">拉菲巴斯克赤霞珠干红葡萄酒 2011（拉菲华诗歌）*2+双支皮盒</a>
                </h2>
                <div class="price">
                	<b>¥217</b>
                    <i>¥500</i>
                </div>
                <div class="evaluate">
                	<span>
                    	<a href="#">已有6241人评价</a>
                    </span>
                    <a class="sc" href="#"></a>
                </div>
            </dd>
        </dl>
        <!--10-->
            	<dl>
        	<dt>
            	<div class="mn_img">
                	<a href="preview.html"><img src="images/51485956079778832_MD.jpg"></a>
                </div>
            </dt>
            <dd>
            	<h2>
                	<a href="preview.html">拉菲巴斯克赤霞珠干红葡萄酒 2011（拉菲华诗歌）*2+双支皮盒</a>
                </h2>
                <div class="price">
                	<b>¥217</b>
                    <i>¥500</i>
                </div>
                <div class="evaluate">
                	<span>
                    	<a href="#">已有6241人评价</a>
                    </span>
                    <a class="sc" href="#"></a>
                </div>
            </dd>
        </dl>        
        
        
        
    </div>
</div>
</div>

<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
