<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>金牌农资</title>
<meta name="description"
	content="CSS3 Full Screen Vertical Scroller with jQuery animation fallback" />
<meta name="viewport" content="width=device-width, user-scalable=no" />
<link rel="stylesheet"
	href="content/static/css/goldCss/scroll_style.css"></link>
<link rel="stylesheet" href="content/static/css/goldCss/home-style.css"></link>
<link rel="stylesheet" href="content/static/css/goldCss/footer.css"></link>
<script src="content/static/js/goldJs/jquery.min.js"></script>
<script src="content/static/js/goldJs/fsvs.js"></script>
<script src="content/static/js/goldJs/main.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/goldCss/nav_right.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/goldCss/flxz_style.css" />
<script type="text/javascript"
	src="content/static/js/goldJs/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="content/static/js/goldJs/jquery.SuperSlide.2.1.1.js"></script>
<script src="content/static/js/goldJs/news.js"></script>
<link href="content/static/css/goldCss/sub1_style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/goldCss/3D-style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/goldCss/nav_right.css" />
<script src="content/static/js/goldJs/ZoomPic.js"></script>
</head>
<body >
	<!--页面通用栏目开始-->
	<!--左侧翻页效果-->
	<div class="background" style="background:url(content/static/images/bg02.jpg)">
	<div class="left" style="position: fixed">
		<a href="#fsvs-initial-setup" class="btu_top"></a> <a
			href="#fsvs-initial-setup" class="home"></a> <a
			href="#basic-html-setup" class="btu_buttom"></a>
	</div>
	<!--logo图标-->
	<a href="index">
		<div class="logo_icon" style="position: fixed"></div>
	</a>
	<jsp:include page="rightNav.jsp" />
	
	<div class="nav">
		<c:forEach items="${list }" var="agricult" varStatus="loop">
			<li><a target="new"
				href="index?param=${agricult.id }#basic-html-setup">${agricult.departmentname }</a></li>
		</c:forEach>
		<li><a target="new" href="index.html#footer">联系信息</a></li>
		<li><a target="new" href="index.html">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
	</div>
	
	<div class="news"
		style="height: 460px; top: 14%; *top: 114%; position: absolute; *position: fixed; margin: 0 auto; padding: 0;">
		<li
			style="width: 534px; height: 45px; line-height: 45px; text-align: left; font-size: 18px; padding-left: 0; background: url(content/static/images/news.png) no-repeat center center;"><span
			style="margin-left: 40px; color: #fff;"
			onclick="news_contentupDiv('news_content-div');"><a href="#"
				style="color: #fff">${news[0].title }</a></span></li>
		<div id='news_content-div' class="news_content-box">
			<div class="news_content-box-body" style="font-size: 16px">
				<c:forEach items="${news }" var="myNews" varStatus="loop">
					<li class="click1" style="width: 500px;"><a
						href="javascript:void(${loop.index });"
						onclick="show(${loop.index });">${myNews.title }</a></li>
				</c:forEach>
			</div>
			<span id="guanbi"><a href="javascript:void(0);"
				onclick="hideDiv('news_content-div','.bg');"><img
					src="content/static/images/guanbi.png" /></a></span>
					
		</div>
	</div>
	<!--首先设置一个层:-->
	<div class="bg"></div>
	<div id="news_content" class="news_content"
		style="font-size: 16px; top: 20%; position: absolute;">
		<span style="float: right; text-align: right;"><a id="close_bg"
			href="#" onclick="hideDiv('news_content','.bg');"><img
				src="content/static/images/guanbi.png" /></a></span>
		<div class="news_content_body" style="width: 670px"></div>
	</div>
	
	<!-- 右边导航栏 -->		
				<script type="text/javascript">			
				function langage(){
					location.href = "getLanguage";
				}
				function f1(){
					var d1=document.getElementById("yy");
					var d2=document.getElementById("yy_xz");
					d2.style.display="inline";
					d1.style.display="none";	
				}
				function f2(){
					var d1=document.getElementById("yy");
					var d2=document.getElementById("yy_xz");
					d2.style.display="none";
					d1.style.display="block";
				}
				</script>
	<script type="text/javascript">
	document.getElementById('news_content').onclick = EX.stop;
	var url = '#';
	function show(id){
		var xx = "";
		<c:forEach items="${news }" var="myNew" varStatus="loop">
		 if('${loop.index}' == id){
			 xx = xx +'${myNew.content}';
		 }
		</c:forEach>
		$('.news_content_body').html(xx);
		var o = document.getElementById('news_content');
	o.style.display = "block";
	setTimeout(function(){EX.addEvent.call(document,'click',hide);});
	}
	function hide(){
	var o = document.getElementById('news_content');
	o.style.display = "none";
	EX.removeEvent.call(document,'click',hide);
	}
	function hideDiv(div_id) {   
        $("#mask").remove();   
        $("#" + div_id).animate({right: 0, top: 150, opacity: "hide" }, "slow");  
    }
</script>
	<!--主体样式-->
	<div class="sd_box"
		style="width: 100%; height: 560px; float: left; margin: 0 auto; padding: 0; margin-top: 10px;">
		<span class="cp">请选择产品</span>
		<div class="kePublic">
			<!--效果html开始-->
			<div id="focus_Box">
				<span class="prev">&nbsp;</span> <span class="next">&nbsp;</span>
				<ul>
					<c:forEach items="${agriculturals.products }" var="product">
						<li><a href="getProduct?id=${product.id }"><img width="20%" height="20%"
								alt="${product.productsName }" src="${fn:substring(product.productsPhoto,1,fn:length(product.productsPhoto))}" /></a>
							<p>
								<span>${product.agriculturalsSort.departmentname }：${product.productsName }</span>
							</p></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript">
//var image=document.getElementById("image")<bgsound src="" loop="-1" id="image">;
document.getElementById("an").onmousedown=function(){
    if(this.src.indexOf("play1pressed")!=-1){
        this.src="content/static/images/weixin_code_145.png";
    }else{
        this.src="content/static/images/yy.jpg";
    }
}
</script>
	<SCRIPT type=text/javascript>
$(document).ready(function(){
            $('.quick_link_mian').hide();
			$('#button_gnj').click(function(){
				$('.quick_link_mian').fadeToggle();
				$("#quick_links").fadeToggle();
                $("#div2").fadeToggle("slow");
                $("#div3").fadeToggle("slow");
	            $("#div4").fadeToggle("slow");
    });
  });
$(document).ready(function(){
  $("#button_gnj").click(function(){
    $("#quick_links").fadeIn();
    $("#div2").fadeIn("slow");
    $("#div3").fadeIn("slow");
	$("#div4").fadeIn("slow");
  });
});
</script>
	<script type="text/javascript"
		src="content/static/js/goldJs/parabola.js"></script>
	<script type="text/javascript">
	$(".quick_links_panel li").mouseenter(function(){
		$(this).children(".mp_tooltip").animate({left:-300,queue:true});
		$(this).children(".mp_tooltip").css("visibility","visible");
		$(this).children(".ibar_login_box").css("display","block");
	});
	$(".quick_links_panel li").mouseleave(function(){
		$(this).children(".mp_tooltip").css("visibility","hidden");
		$(this).children(".mp_tooltip").animate({left:-120,queue:true});
		$(this).children(".ibar_login_box").css("display","none");
	});
	$(".quick_weixin_toggle li").mouseover(function(){
		$(this).children(".mp_qrcode").show();
	});
	$(".quick_weixin_toggle li").mouseleave(function(){
		$(this).children(".mp_qrcode").hide();
	});
	$("#yuy").mousedown.click(function(){
		$("#div3").show(".language");
	});
	$(function(){ ("#yuy").toggle(function(){ $("#yuy").css("background-image"," url(content/static/images/yy.jpg)"); },function(){ $("#yuy").css("background-image"," url(content/static/images/xiez.jpg)"); }) })
</script>
</body>
</html>