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
</head>
<body>
	<!--页面通用栏目开始-->
	<!--左侧翻页效果-->
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
	<!--页面通用栏目结束-->
	<div id="fsvs-body">
		<!--第一屏-->
		<div class="slide" id="fsvs-initial-setup"position:relative;">
			<img src="content/static/images/bg.jpg"></img>
			<div>
				<div>
					<!--产品选项卡-->
					<div class="option_box">
						<div class="option">
							<div class="button_img">
								<div class="button_img1">
									<a href="#basic-html-setup"></a>
								</div>
							</div>
							<div class="button_img" style="float: left;">
								<div class="button_img2">
									<a href="#basic-html-setup"></a>
								</div>
							</div>
							<div class="button_img" style="float: left;">
								<div class="button_img3">
									<a href="#basic-html-setup"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--第二屏-->
		<div class="slide" id="basic-html-setup"position:relative;">
			<img src="content/static/images/bg02.jpg"></img>
			<div id="second">
				<div>
					<!--导航栏-->
					<div class="nav" style="top: 120%; left: 10%; position: absolute;">
						<c:forEach items="${list }" var="agricult" varStatus="loop">
							<li><a href="#basic-html-setup"
								onclick="checkme(${agricult.id });return ture;">${agricult.departmentname }</a></li>
							<!--           <li><a href="#basic-html-setup" onclick="checkme2();return ture;">农&nbsp;&nbsp;&nbsp;&nbsp;药</a></li> -->
							<!--           <li><a href="#basic-html-setup" onclick="checkme();return ture;">种&nbsp;&nbsp;&nbsp;&nbsp;子</a></li> -->
						</c:forEach>
						<li><a href="#footer">联系信息</a></li>
						<li><a href="#fsvs-initial-setup">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
					</div>
				</div>
				<div class="news"
					style="height: 460px; top: 135%; position: absolute; margin: 0 auto; padding: 0;">
					<li
						style="width: 534px; height: 45px; line-height: 45px; text-align: left; font-size: 18px; padding-left: 0; background: url(content/static/images/news.png) no-repeat center center;"><span
						style="margin-left: 40px; color: #fff;"
						onclick="news_contentupDiv('news_content-div');"><a
							style="color: #fff">${news[0].title }</a></span></li>
					<div id='news_content-div' class="news_content-box">
						<div class="news_content-box-body"
							style="font-size: 16px; width: 520px;">
							<c:forEach items="${news }" var="myNews" varStatus="loop">
								<li class="click1" style="width: 500px;"><a
									href="javascript:void(${loop.index });"
									onclick="show(${loop.index });">${myNews.title }</a></li>
							</c:forEach>
						</div>
						<!-- 标题关闭 -->
						<span id="guanbi"> <a href="javascript:void(0);"
							onclick="hideDiv('news_content-div');"> <img
								src="content/static/images/guanbi.png" />
						</a>
						</span>
					</div>
				</div>
				<!--首先设置一个层:-->
				<div class="bg"></div>
				<div id="news_content" class="news_content"
					style="font-size: 16px; top: 120%; position: absolute;">
					<span style="float: right; text-align: right; cursor: pointer;">
						<a id="close_bg" onclick="hideDiv('news_content');"> <img
							src="content/static/images/guanbi.png" /></a>
					</span>
					<div class="news_content_body"></div>
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
<!-- 	document.getElementById('news_content').onclick = EX.stop; -->
	<script type="text/javascript">	
	function show(id){
	<c:forEach items="${news }" var="myNew" varStatus="loop">
	 if('${loop.index}' == id){
		 xx = '${myNew.content}';
	 }
	</c:forEach>
	$('.news_content_body').html(xx);
var o = document.getElementById('news_content');
o.style.display = "";
setTimeout(function(){EX.addEvent.call(document,'click',hide);});
}
</script>	
				
		
				<!--肥料产品选择-->
				<div class="friend_box" name="second" style="top: 165%;">
					<div class="friend">
						<div class="mr_frbox">
							<img class="mr_frBtnL prev"
								src="content/static/images/scroll_left.png" />
							<div class="mr_frUl">
								<!--种子系列-->
								<div id="zzxl">
									<ul id="mr_fu" style="margin-left: 120px">
										<c:forEach items="${brands }" var="br">
											<li id='qtxx'><a href='getXiLie?id=${br.id }'> <img
													src='${fn:substring(br.describes,1,fn:length(br.describes))}' /></a></li>
										</c:forEach>
									</ul>
								</div>

							</div>
							<img class="mr_frBtnR next"
								src="content/static/images/scroll_right.png" />
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
	 	$(document).ready(function(e) {
            var url=window.location.search; 
			var param = url.substr(1).split('=')[1];
				checkme(param);
        });
		function checkme(id)
		{
			var $zhongzi ="<ul id='mr_fu' >"
			<c:forEach items="${brands }" var="brand" >
			 
				 $zhongzi =  $zhongzi + "<li id='qtxx'><a href='getXiLie?id=${brand.id }'> <img src='${fn:substring(brand.describes,1,fn:length(brand.describes))}' /></a></li>";
			 
		</c:forEach>
//  			var $zhongzi = "<ul id='mr_fu' ><li id='qtxx'><a href='index_sub1.html'> <img src='content/static/images/zf.png' /></a></li><li id='qtxx'><a href='index_sub1.html'> <img src='content/static/images/qt.png' /> </a> </li> </ul>";
			$zhongzi = $zhongzi +"</ul>";
			$('#zzxl').html($zhongzi);
		}
		
	 </script>
			<script type="text/javascript">
$(document).ready(function () {
	
	/* 图片滚动效果 */
	$(".mr_frbox").slide({
		titCell: "",
		mainCell: ".mr_frUl ul",
		autoPage: false,
		effect: "leftLoop",
		autoPlay: false,
		vis: 2,
		
		
	});		
});
</script>

			<!--效果html结束-->
			<!--[if lte IE 8]>
<script src="js/ieBetter.js"></script>
<![endif]-->
			<script type="text/javascript">
//var image=document.getElementById("image")<bgsound src="" loop="-1" id="image">;
document.getElementById("an").onmousedown=function(){
    if(this.src.indexOf("play1pressed")!=-1){
        this.src="../../images/weixin_code_145.png";
    }else{
        this.src="../../images/yy.jpg";
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
	</script>
		</div>
		<!--第二屏结束-->
		<!--第三屏开始-->
		<jsp:include page="footNav.jsp" />
		<!--第三屏结束-->
	</div>
</body>
</html>
