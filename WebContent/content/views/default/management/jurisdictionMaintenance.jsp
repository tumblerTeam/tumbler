<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<title>不倒翁后台管理系统</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href="content/static/css/bootstrap/bootstrap.css" rel="stylesheet">

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="content/static/img/favicon.png">

<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>
</head>
<script type="text/javascript">
	function popupWindow(url) {
		popupWindow = window
				.open(
						url,
						'popUpWindow',
						'height=600,width=600,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
	}
</script>
<jsp:include page='../common/header.jsp' />
<div class="row clearfix">
	<br> <br> <br>
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-10 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">入驻商家列表</h3>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr>
									<th style="text-align: center;">商家名称</th>
									<th style="text-align: center;">商家等级</th>
									<th style="text-align: center;">开通日期</th>
									<th style="text-align: center;">截至日期</th>
									<th style="text-align: center;">权限关闭</th>
								</tr>
							</thead>
							<c:forEach var="mainter" items="${list }" varStatus="loop">
								<tbody>
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td align="center">${mainter.shop.shopName }</td>
									<td>
										<c:if test="${mainter.shop.ratings == 'oneLevel' }">一级</c:if>
										<c:if test="${mainter.shop.ratings == 'twoLevel' }">二级</c:if>
										<c:if test="${mainter.shop.ratings == 'threeLevel' }">三级</c:if>
										<c:if test="${mainter.shop.ratings == 'fourLevel' }">四级</c:if>
									</td>
									<td>${mainter.startDate }</td>
									<td>
										<c:if test="${mainter.endDate == '-1' }">----</c:if>
										<c:if test="${mainter.endDate != '-1' }">${mainter.endDate }</c:if>
									</td>
									<td><button onclick="onBlick('management/closeManor?id=${mainter.shop.id}');">权限关闭</button></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function onBlick(url){
					location.href = url;
				}
			</script>
		</div>
	</div>
</div>
<jsp:include page='../common/footer.jsp' />