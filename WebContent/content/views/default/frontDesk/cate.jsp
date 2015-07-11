<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="menu_nav" id="menu_nav">
 <div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 1 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 1 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 2 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 2 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 3 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 3 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 4 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
											<!-- 										<li><a href="javascript:void(0);" rel="nofollow" -->
											<%-- 											class="black" onclick="cate2Click('${cate2.categoryID }');">${cate2.category }</a></li> --%>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 4 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="showdivs">
				<div class="showdivs_left" style="width: 220px; float: left;">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 5 }">
							<c:forEach var="cate1" items="${category.children }">
								<c:if test="${not empty cate1.children }">
									<h2
										style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">${cate1.category }</h2>
									<hr style="float: none; border-color: #FFF;" width="200" />
									<div class="list_con" style="margin-left: 10px;">
										<c:forEach items="${cate1.children }" var="cate2">
											<a href="search/result?id=${cate2.categoryID }">${cate2.category }</a>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
				<div class="showdivs_right" style="float: right; width: 220px">
					<c:forEach items="${categories }" var="category">
						<c:if test="${category.categoryID == 5 }">
							<c:if test="${not empty category.brands }">
								<h2 style="font-family: 微软雅黑; color: #fff; margin-left: 10px; margin-top: 20px; font-size: 13px;">品牌</h2>
								<hr    style="float:none; border-color:#FFF; " width="200"  />
	                    		<div class="list_con" style="margin-left:10px;" >
								<c:forEach items="${category.brands }" var="brand">
									<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a> 
								</c:forEach>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
	<div class="menu_left" style="display: none;" id="fen_class">
		<c:forEach items="${categories }" var="category">
			<c:if test="${category.categoryID != 3 }">
				<div class="list">
					<h2>
						<a href="search/result?cateid=${category.categoryID }">${category.category }</a>
					</h2>
					<div class="list_con">
						<c:set value="0" var="loop"></c:set>
						<c:forEach items="${category.children }" var="cate2">
							<c:if
								test="${cate2.parentLevel.categoryID == category.categoryID}">
								<c:forEach items="${cate2.children }" var="cate3">
									<c:set var="loop" value="${loop + 1 }"></c:set>
									<c:if test="${loop < 7 }">
										<a href="search/result?id=${cate3.categoryID }">${cate3.category }</a>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<c:if test="${category.categoryID == 3 }">
				<div class="list">
					<h2>
						<a href="search/result?cateid=${category.categoryID }">${category.category }</a>
					</h2>
					<div class="list_con">
						<c:forEach items="${category.brands }" var="brand"
							varStatus="loop">
							<c:if test="${loop.index < 7 }">
								<a
									href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
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
<!--价格排列-->
<script type="text/javascript"> 
$(document).ready(function(){
$("#jg").click(function(){
    $("#jiage").slideToggle("slow");
  });
});
</script>
<!--更多分类-->
<script type="text/ecmascript">
	var boolean=true;
	function f1(){
		var gd=document.getElementById("gd");
		var gd1=document.getElementById("gd1");
		var btn=document.getElementById("btn");	
		if(boolean==true){
			gd.style.display="block";
			gd1.style.display="block";
			btn.innerHTML="收起";
			boolean=false;
			}else if(boolean==false){
				gd.style.display="none";
				gd1.style.display="none";
				btn.innerHTML="更多选项";	
				boolean=true;
				}
		}
		function f2(){
		var div2=document.getElementById("big");
		div2.style.borderColor="red";
		}
		function f3(){
		var div2=document.getElementById("big");
		div2.style.borderColor="#ccc";
		}
		function f4(){
			var pp1=document.getElementById("pp1");
			var pp2=document.getElementById("pp2");
			pp1.style.color="red";
			pp2.style.borderColor="red";
		}
		function f5(){
			var pp1=document.getElementById("pp1");
			var pp2=document.getElementById("pp2");
			pp1.style.color="#000";
			pp2.style.borderColor="#ccc";
		}
</script>
<script type="text/ecmascript">
	var boolean=true;
	function f6(){
		var pp1=document.getElementById("pp1");
	    var text1=document.getElementById("text1");
		var bdiv=document.getElementById("nav2");
		var pp2=document.getElementById("pp2");
		if(boolean==true){
			text1.style.display="block";
			pp1.innerHTML="收起";
			bdiv.style.transition="all 0.1s";
			bdiv.style.border="2px solid #ccc";
			pp2.style.background="url(images/gd2.png)";
			pp2.style.backgroundPosition="2px 2px";
			boolean=false;
			}else{
			bdiv.style.border="0px solid #ccc";
			bdiv.style.borderTop="1px solid #ccc";
				text1.style.display="none";
				pp1.innerHTML="更多";
				boolean=true;	
				pp2.style.background="url(images/gd.png)";
				}
		}
		function gbred(){	
		var pp2=document.getElementById("pp2");
		pp2.style.transition="all 0.4s";
		pp2.style.borderColor="red";
		pp2.style.backgroundPosition="2px 17px";
			}
		function gbredt(){	
		var pp2=document.getElementById("pp2");
		pp2.style.transition="all 0.7s";
		pp2.style.borderColor="#ccc";
		pp2.style.backgroundPosition="2px 2px";
			}
</script>
<script type="text/javascript">
    $(function(){
		$("#oneul").children(this).click(event,function(){
			var li=event.target
			$c=$(li);
			$c.parent($c).parent($c.parent($c)).css("display","none");
			$("#csspan").append("<span class='spancl' >"+$c.text()+"</span>");
			});
			
		});
		
</script>