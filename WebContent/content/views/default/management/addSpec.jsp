<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	// Popup window code
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
		<c:if test="${page == 'add' }">
			<form class="form-horizontal" action="management/specAdd" method="POST">
				<div class="form-group" style="text-align: center;">
					<label><font style="font-size: 40px;">规格添加</font> </label> <br>
					<br>
				</div>
		</c:if>
		<c:if test="${page == 'update' }">
			<form class="form-horizontal" action="management/updateSpec" method="POST">
				<div class="form-group" style="text-align: center;">
					<label><font style="font-size: 40px;">规格修改</font> </label> <br>
					<br>
				</div>
		</c:if>
			
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"><a
					class="frred">*</a>规格名称</label>
				<div class="col-sm-8">
					<input type="hidden" name="id" value="${spec.id }">
					<input type="text" name="specificatName" class="form-control"
						id="inputEmail3" value="${spec.specificatName }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"><a
					class="frred">*</a>属性名称</label>
				<div class="col-sm-8">
					<input type="text" name="attribute" class="form-control"
						id="inputEmail3"  placeholder="格式xxx,xxx" value="${spec.attribute }">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8" style="text-align: center;">
					<c:if test="${page == 'add' }">
						<button type="submit" class="btn btn-default">添加</button>
					</c:if>
					<c:if test="${page == 'update' }">
						<button type="submit" class="btn btn-default">修改</button>
					</c:if>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default" onclick="cancel()">取消返回</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function cancel() {
		location.href = "management/specManage";
	}
</script>
<jsp:include page='../common/footer.jsp' />