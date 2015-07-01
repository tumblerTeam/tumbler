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
<title>公告列表</title>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/news.css"/>	
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/tz.js"></script>
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
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
<!--面包屑-->
    <div class="breadCrumb">
    	<div class="con">
    		<a href="index.html">首页</a>
    		       <a href="javaScript:void(0)">>${sign}</a>
        </div>
    </div>
<!--公告列表-->	
	<div class="center_list">
        	<div class="news_01">
            	<div class="news_tt">
                	<div class="tt_h1">
                    	<h1>${sign}</h1>
                    </div>
                </div>
                
                <c:forEach items="${newList}" var="new">
                     <div class="news_list">
                	<div class="news_list1">
                    	<a href="javascript:void(0);"><img src="content/static/images/b2.jpg"/></a>
						<div class="text_01">
                        	<h3 class="text_tt">
                        	  <c:if test="${new.announType=='activity'}">
                        	         <a href="${new.activityUrl}">${new.title}</a>
                        	  </c:if>
                        	  <c:if test="${new.announType=='news'}">
                        	         <a href="proscenium/getNewDetails?newId=${new.noticeId}">${new.title}</a>
                        	  </c:if>
                            </h3>
                            <p>
                                 ${new.content}
                                 <c:if test="${new.announType=='news'}">
                                	<a href="proscenium/getNewDetails?newId=${new.noticeId}">[详细]</a>
                                </c:if>
                                 <c:if test="${new.announType=='activity'}">
                                	<a href="${new.activityUrl }">[详细]</a>
                                </c:if>
                            </p>
                            <div class="text_info">
                            	<span class="text_time">${new.newsDate}</span>
                            </div>
                        </div>
                    </div>
					<div style="border-top: #eee 1px dashed; overflow: hidden; height: 1px; width:916px; margin:0 auto;">
                    </div>
                  </div>
                </c:forEach>
            </div>
    </div>

<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
