<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='header.jsp' />
<script type="text/javascript">
	// Popup window code
	function popupWindow(url) {
		popupWindow = window
				.open(
						url,
						'popUpWindow',
						'height=800,width=1800,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
	}
</script>
<div class="row clearfix">
	<jsp:include page='menu.jsp' />
	<div class="col-md-10 column">
		<div class="list-group">
			<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a href="#" onclick="popupWindow('addProducts');">产品列表<span class="badge navbar-right">添加&nbsp;+</span></a>
				</h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
				<table class="table table-striped">
					<tr class="">
						<th>产品名称</th>
						<th>语言</th>
						<th>所属系列</th>
						<th>产品照片</th>
						<th></th>
					</tr>
					<c:forEach var="cdc" items="${list }" varStatus="loop">
						<c:choose>
							<c:when test="${loop.index%2==0 }">
								<tr>
							</c:when>
							<c:otherwise>
								<tr class="success">
							</c:otherwise>
						</c:choose>
						<td>${cdc.productsName }</td>
						<td><c:if test="${cdc.language == 'Chinese'}">汉语</c:if><c:if test="${cdc.language == 'Uighur'}">维语</c:if></td>
						<td>${cdc.agriculturalsSort.departmentname }</td>
						<td><img alt="" src="..${cdc.productsPhoto }"> </td>
						<td>
							<a onclick="popupWindow('./updateProducts?id=${cdc.id }');" href="#"><span class="badge">修改</span></a>
							<a onclick="" href="./deleteProducts?id=${cdc.id }"><span class="badge">删除</span></a></td>
						</tr>
					</c:forEach>
				</table>
				</p>
			</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page='footer.jsp' />