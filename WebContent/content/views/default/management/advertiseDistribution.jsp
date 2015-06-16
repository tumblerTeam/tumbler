<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<title>不倒翁后台管理系统</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href="content/static/css/bootstrap/bootstrap.css"
	rel="stylesheet">

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

<script type="text/javascript"
	src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>
</head>
<jsp:include page='../common/header.jsp' />
<script type="text/javascript">
	// Popup window code
	function popupWindow(url) {
		popupWindow = window
				.open(
						url,
						'popUpWindow',
						'height=600,width=600,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
	}
</script>
<br><br><br>
<div class="row clearfix">
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-10 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a href="management/addAdverDis">广告分布<span class="badge navbar-right">添加&nbsp;+</span></a>
				</h3>
			</div>
			<div class="list-group">
				<div class="list-group-item">
					<p class="list-group-item-text">
					<table class="table table-striped" id="talble1">
							<tr>
								<th>广告所在页</th>
								<th>位置</th>
								<th>此广告数量</th>
								<th>图片大小</th>
								<th></th>
							</tr>
							<c:forEach var="notice" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr >
									</c:when>
									<c:otherwise>
										<tr >
									</c:otherwise>
								</c:choose>
									<td>${notice.whichPage }</td>
									<td>${notice.position }</td>
									<td>${notice.num }</td>
									<td>${notice.lAndW }</td>
								<td>
								<a href="management/updateAdverDis?id=${notice.adverDisId }"><span
										class="badge">修改</span></a>
								<a onclick="return confirm('确定删除该广告么？')"
									href="management/deleteAdverDis?id=${notice.adverDisId }"><span
										class="badge">删除</span></a></td>
								</tr>
							</c:forEach>
					</table>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page='../common/footer.jsp' />