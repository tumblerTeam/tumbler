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
<link
	href="content/static/css/bootstrap/bootstrap-combined.no-icons.min.css"
	rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
	rel="stylesheet">
<link href="content/static/css/bootstrap/index.css" rel="stylesheet">
<script src="content/static/js/lib/bootstrap-wysiwyg.js"
	type="text/javascript"></script>
<script src="content/static/js/lib/jquery.hotkeys.js"
	type="text/javascript"></script>
<jsp:include page='../common/header.jsp' />
<br />
<br />
<br />
<div class="row clearfix">
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-10 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title" style="height: 16px;">
					<a href="management/activityStyle">活动类型添加<span
						class="badge navbar-right">返回</span></a>
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" method="post"
					id="noticeForm" name="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">活动方式:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="activityStyle"
								name="activityStyle" value="${style.activityStyle }"><br> <input
								type="hidden" id="activityStyleId" name="activityStyleId"
								value="${style.activityStyleId }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-12">
							<button type="button" onclick="onclickBut('${page }');"
								class="btn btn-default">
								<c:if test="${page == 'update'}">修改</c:if>
								<c:if test="${page != 'update'}">添加</c:if>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checkvalue(obj) {
		if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
			alert('你输入的不是数字，或关闭输入法后再输入');
			obj.select();
		}
	}
	function onclickBut(obj) {
		if (obj == 'update') {
			document.form.action = "management/updateActivityStyle";
			document.form.submit();
		} else {
			document.form.action = "management/addActivityStyle";
			document.form.submit();
		}
	}
</script>
<jsp:include page='../common/footer.jsp' />