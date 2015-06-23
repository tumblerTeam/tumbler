<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="menu_nav" style="position:absolute; margin-left:161px;">
		<div class="menu_left" style="display:none;" id="fen_class">
		<c:forEach items="${categories }" var="category">
			<div class="list">
            	<h2><a href="search/result?cateid=${category.categoryID }">${category.category }</a></h2>
            		<div class="list_con">
            		<c:forEach items="${category.brands }" var="brand">
	                	<a href="search/result?cateid=${category.categoryID }&brand=brand-${brand.brandID }">${brand.brandName }</a>
            		</c:forEach>
	                </div>
            </div>
		</c:forEach>
		</div>
	</div>
<script type="text/javascript">
	window.onload = function() {
		var fen = document.getElementById("fen");
		var fen_class = document.getElementById("fen_class");
		var timer = null;
		fen_class.onmouseover = fen.onmouseover = function() {
			clearTimeout(timer);
			fen_class.style.display = "block";
		};
		fen_class.onmouseout = fen.onmouseout = function() {
			timer = setTimeout(function() {
				fen_class.style.display = "none";
			}, 500);
		};
	}
</script>