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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公告详情</title>
<link rel="stylesheet" type="text/css" href="content/static/css/news.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<script type="text/javascript" src="content/static/js/tumbler/StackBlur.js"></script>
<script src="content/static/js/tumbler/jquery-1.11.1.min.js"></script>
<script src="content/static/js/tumbler/tz.js"></script>
<script>
	stackBlurImage( "blur", "canvas", 50, false );
</script>
<!--全部分类js-->
<script>
	window.onload= function(){
		var fen=document.getElementById("fen");
		var fen_class=document.getElementById("fen_class");
		var timer=null;	
		fen_class.onmouseover=fen.onmouseover=function(){
			clearTimeout(timer);
			fen_class.style.display="block";
			};	
			
		/*全部分类*/   
	                                                                                                                                                    
	  $(".list").hover(function(){  
		$(this).animate({width:192},300)
					.css("backgroundColor","#A71234");
					
		$(".showdivs").eq($(".list").index(this)).animate({width:500},300)
					.css("display","block");
					/*鼠标移入右边*/
					var listindex=$(".list").index(this); //当前悬停list索引
					
					$(".showdivs").hover(function(){
							$(this).eq($(".list").index(this)).animate({width:500},300)
								.css("display","block");
								
							$(".list").eq($(".showdivs").index(this)).css("backgroundColor","#A71234");
							if(fen_class.style.display=="none"){
								fen_class.style.display="block";
								}	
						},function(){
								
								fen_class.style.display="none";
							$(this).eq($(".list").index(this)).animate({width:500},300)
								.css("display","none");
								
							$(".list").eq($(".showdivs").index(this)).css("backgroundColor","#901531");	
									});
	  },function(){
		  $(this).animate({width:192},300)
					.css("backgroundColor","#901531");
			$(".showdivs").eq($(".list").index(this)).animate({width:500},300)
					.css("display","none");
			fen_class.style.display="none";	
		  }); 
		  
		  <!--搜索框-->
		var d1=document.getElementById("hj");
			d1.onclick=function(){
				d1.placeholder="";
				}
}
</script>
</head>

<body>
<!--顶部内容-->

<!--头部内容-->

<!--导航内容-->

<!--banner-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
<!--新闻详情页-->
	<div class="breadCrumb" style="background-color:#E8E8E8; height:30px; line-height:30px; width:100%;" >
     <div class="con" style="width:1200px; margin:0px auto;">
        <a href="index.html">首页</a> >
        <span>新闻详情</span>
     </div>
</div>
	<div class="new_class">
    	<div class="left">
    		<ul>
    	    <c:forEach items="${newList}" var="new">
    	      <a href="proscenium/getNewDetails?newId=${new.noticeId}"><li>${new.title}</li></a>
    	    </c:forEach>
    	    </ul>
        </div>
        <div class="right">
        	<h2>${newDe.title}</h2>
            <div class="time">
            	<span>${newDe.newsDate} 来源：<a href="index">雨岑不倒翁</a></span>
                <a href="javascript:void(0)"><span style="float:right;">分享</span></a>
            </div>
            <hr/>
            <div class="content">
                 <p>
                    ${newDe.content}
                 </p>
            	<span>来源：雨岑不倒翁</span>
               <div class="zi">版权为雨岑不倒翁所有 转载请联系（info@yucen.com）并注明出处</div>
            </div>
            
        </div>
    </div>

<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
<script>
//IE10+ blur			
if (typeof document.msHidden != "undefined") {
	[].slice.call(document.querySelectorAll(".cover img")).forEach(function(img) {
		img.classList.add("hidden");
		
		var myImage = new Image(), src = img.src;
		img.insertAdjacentHTML("afterend", '<svg class="blur" width="160" height="140">\
			<image xlink:href="'+ src +'" src="'+ src +'" width="160" height="140" y="0" x="0" filter="url(index3data/httpwwwzhang36y201502#blur.com/study/201502/#blur)" />\
		</svg>');
	});
}
</script>
</body>
</html>
