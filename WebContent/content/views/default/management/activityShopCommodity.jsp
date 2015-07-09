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
					<a href="management/addActivityShopComm">活动商品<span class="badge navbar-right">添加&nbsp;+</span></a>
				</h3>
			</div>
			<div class="list-group">
				<div class="list-group-item">
					<p class="list-group-item-text">
					<table class="table table-striped" id="talble1">
							<tr>
								<th>商品名称</th>
								<th>活动照片</th>
								<th>所属店铺</th>
								<th>链接地址</th>
								<th>活动数量</th>
								<th></th>
							</tr>
							<c:forEach var="actity" items="${list }" varStatus="loop">
								<tr style="background-color: #CCFF99;">
									<td colspan="1">活动类型：${actity.activityStyle.activityType }</td>
									<td colspan="5">活动名称：${actity.activityName }</td>
								</tr>
								<c:forEach	var="comm" items="${actity.commodities }">
									<tr>
										<td>${comm.commoidtyName }</td>
										<td>${comm.actityImage }</td>
										<td>${comm.belongTo.shopName }</td>
										<td>${comm.link }</td>
										<td>${comm.activityAmount }</td>
										<td>
										<a href="management/updateCommActivity?commCode=${comm.commCode }&page=update"><span
											class="badge">修改</span></a>
										<a onclick="return confirm('确定取消该商品参与此活动的资格么？')"
											href="management/deleteActitiy?id=${comm.commCode }"><span
											class="badge">删除</span></a>
										</td>
									</tr>
								</c:forEach>
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