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

<!---->
<script type="text/javascript"
	src="content/static/js/goldJs/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="content/static/js/goldJs/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript"
	src="content/static/js/goldJs/jquery.touchSlider.js"></script>
<script type="text/javascript"
	src="content/static/js/goldJs/jquery.SuperSlide.2.1.1.js"></script>
<script src="content/static/js/goldJs/news.js"></script>
<!---->
<link href="content/static/css/goldCss/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/goldCss/nav_right.css" />
<link href="content/static/css/goldCss/sub2_style.css" rel="stylesheet" />
<link rel="stylesheet" href="content/static/css/goldCss/footer.css" />
<script type="text/javascript">
$(document).ready(function () {
	$(".main_visual").hover(function(){
		$("#btn_prev,#btn_next").fadeIn()
		},function(){
		$("#btn_prev,#btn_next").fadeOut()
		})
	$dragBln = false;
	$(".main_image").touchSlider({
		flexible : true,
		speed : 200,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e) {
			$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});
	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	})
	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	})
	$(".main_image a").click(function() {
		if($dragBln) {
			return false;
		}
	})
	timer = setInterval(function() { $("#btn_next").click();}, 5000);
	$(".main_visual").hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(function() { $("#btn_next").click();}, 5000);
	})
	$(".main_image").bind("touchstart", function() {
		clearInterval(timer);
	}).bind("touchend", function() {
		timer = setInterval(function() { $("#btn_next").click();}, 5000);
	})
});
</script>
</head>
<body style="height:auto;">
	<div style="background: url(content/static/images/bg02.jpg) no-repeat; height: 988px;">
		<!--导航栏-->
		<div class="nav">
			<c:forEach items="${list }" var="agricult" varStatus="loop">
				<li><a target="new"
					href="index?param=${agricult.id }#basic-html-setup">${agricult.departmentname }</a></li>
			</c:forEach>
			<li><a href="index.html#footer">联系信息</a></li>
			<li><a href="index.html">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
		</div>
		<!-- 右侧导航栏 -->
		<div  style="top:0; right:0; *position:fixed; width:75px; height:100%; position:absolute;">
  		<div class="mui-mbar-tabs">
    <div class="button_gnj" id="button_gnj"> <!--功能键按钮-->
      <li><img src="content/static/images/gnj.png" /></li>
    </div>
    <div class="quick_link_mian">
      <div class="quick_links_panel" >
        <div id="quick_links" class="quick_links"><!--所有产品-->
          <li > <img src="content/static/images/sy_arw.jpg" width="110%" style="margin-top:180%;" />
            <div class="ibar_login_box status_login">
              <div class="status_login">
                <ul class="user_info">
					<c:forEach items="${brands }" var="brand">
					<a href="getXiLie?id=${brand.id }">${brand.departmentname }</a>
					</c:forEach>
                </ul>
              </div>
            </div>
          </li>
        </div>
        <div class="quick_weixin_toggle" >
        <ul>
          <li id="div2" style="top:75px;"> <!--微信扫码--> 
            <img src="content/static/images/weixin.jpg" />
            <div class="mp_qrcode">
            <img src="content/static/images/weixin_code_145.png"/></div>
          </li>
          
          <li class="language" id="div3" onmouseover="f1()" onmouseout="f2()" style="top:150px;"><!--语言选择id="div3"--> 
          	<img id="yy" src="content/static/images/yy.jpg" onclick="langage();"/>
          	<img id="yy_xz" src="content/static/images/yy_xz.jpg" style="display:none;" onclick="langage();"/>
          </li>
          
          <li id="div4" style="z-index:99999;top:150px;"> <!--联系电话<--> 
            <img src="content/static/images/call.jpg" />
            <div class="mp_tooltip">咨询热线：181609204</div>
          </li>
        </ul> 
        </div>
      </div>
    </div>
  </div>
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
		<!--logo图标-->
		<a href="index">
			<div class="logo_icon"></div>
		</a>
		<jsp:include page="rightNav.jsp" />
		<div class="news"
			style="height: 360px; top: 14%; *top: 114%; _position: absolute; *position: fixed;">
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
					onclick="hideDiv('news_content-div');"><img
						src="content/static/images/guanbi.png" /></a></span>
			</div>
		</div>
		<!--首先设置一个层:-->
		<div class="bg"></div>
		<div id="news_content" class="news_content"
			style="font-size: 16px; top: 20%; position: absolute;">
			<span style="float: right; text-align: right;"><a
				id="close_bg" href="#" onclick="hideDiv('news_content','.bg');"><img
					src="content/static/images/guanbi.png" /></a></span>
			<div class="news_content_body" style="width: 670px"></div>
		</div>
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
		<div class="main_visual">
			<div class="flicking_con">
				<div class="flicking_inner">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
					<a href="#">5</a>
				</div>
			</div>
			<div class="main_image">
				<ul>
					<!--第一张图-->
					<li><span>
							<div class="p_left">
								<h1>${products.productsName }sss的作用</h1>
								<p>${products.effect }aaaa</p>
							</div> <img src="content/static/images/tp_x.png" /> <!--图片区域-->
							<div class="p_right">
								<h2>产品功效</h2>
								<p>${products.benefits }ddddd</p>
							</div>
					</span>
						<div class="call_zx">
							<a href="#"><img src="content/static/images/tel.jpg" /> </a>
						</div></li>
				</ul>
				<a href="javascript:;" id="btn_prev"></a> <a href="javascript:;"
					id="btn_next"></a>
			</div>
		</div>
		<div class="main_image_bg"></div>
		<!--产品推荐-->
		<span
			style="font-size: 30px; color: #fff; left: 18%; top: 660px; z-index: 999999; font-family: '微软雅黑'; position: absolute">产品推荐</span>
		<div class="slidBox">
			<div class="slb_frbox">
				<img class="slb_frBtnL prev" src="content/static/images/fly_20.png" />
				<div class="slb_frUl">
					<ul id="slb_fu">
						<c:forEach items="${products.recommends }" var="recommend">
							<li><a href="#"> <img
									src="${fn:substring(recommend,1,fn:length(recommend))}" />
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<img class="slb_frBtnR next" src="content/static/images/fly_21.png" />
			</div>
			<script type="text/javascript">
$(document).ready(function () {
	
	/* 图片滚动效果 */
	$(".slb_frbox").slide({
		titCell: "",
		mainCell: ".slb_frUl ul",
		autoPage: false,
		effect: "leftLoop",
		autoPlay: false,
		vis: 4
	});		
});
</script>
			<!--滚动块-->
			<div class="block"></div>
		</div>
	</div>
	<!--页脚-->
	<footer id="lxfs"
		style="width:100%; z-index:999; color:#fff; text-align:center; height:380px; top:980px; margin:0 auto; position:absolute">
	<div class="f_bottom" style="height: 380px">
		<div class="link">
			<div class="link_box">
				<a target="new" href="http://www.ampcn.com/"><img
					src="content/static/images/url1.jpg" />
					<h1>中国农资网</h1> </a>
			</div>
			<div class="link_box">
				<a target="new" href="http://www.cast.net.cn/"><img
					src="content/static/images/url2.jpg" />
					<h1>中国农业科技信息网</h1> </a>
			</div>
			<div class="link_box">
				<a target="new" href="http://www.agri.gov.cn/"><img
					src="content/static/images/url3.jpg" />
					<h1>中国农业信息网</h1> </a>
			</div>
			<div class="link_box">
				<a target="new" href="http://www.zzys.moa.gov.cn/"><img
					src="content/static/images/url4.jpg" />
					<h1>中国种植业信息网</h1> </a>
			</div>
			<div class="link_box">
				<a target="new" href="http://www.sannong.net/"><img
					src="content/static/images/url5.jpg" />
					<h1>中国三农网</h1> </a>
			</div>
			<div class="link_box">
				<a target="new" href="http://www.agrichem.cn/"><img
					src="content/static/images/url6.jpg" />
					<h1>中国农药网</h1> </a>
			</div>
		</div>
		<div class="adress">
			<img src="content/static/images/footer_logo.png" />
			<p style="font-size: 15px; color: #cccccc; line-height: 24px;">
				沪ICP备13005943号 &nbsp;&nbsp; 版权所有：上海雨岑信息科技有限公司
				&nbsp;&nbsp;服务热线：021-62340162 62340169</p>
			<p style="font-size: 15px; color: #cccccc; line-height: 24px;">地
				址：上海市杨浦区隆昌路619号城市概念创意园2号楼E21-E26 &nbsp;&nbsp;邮编：200082
				&nbsp;&nbsp;传真：021-52799113</p>
			<p style="font-size: 15px; color: #cccccc; line-height: 24px;">邮件咨询：kefu@yc-e.net
				&nbsp;&nbsp;附近交通：地铁：12号线 隆昌路站;8号线 黄兴路站</p>
		</div>
	</footer>

	<!--右侧导航引用的js[if lte IE 8]>
<!--[if lte IE 8]>
<script src="js/ieBetter.js"></script>
<![endif]-->
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