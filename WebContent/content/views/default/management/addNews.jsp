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
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" />
  <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

  <!-- include summernote -->
  <link rel="stylesheet" href="content/static/css/bootstrap/summernote.css"/>
  <script type="text/javascript" src="content/static/js/lib/summernote.js"></script>
  <script type="text/javascript" src="content/static/js/lib/summernote-zh-CN.js"></script>
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
					<a href="management/news">新闻添加<span class="badge navbar-right">返回</span></a>
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" method="post"
					id="noticeForm" name="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">类型:</label>
						<div class="col-sm-8">
							<input type="hidden" id="id" name="noticeId"
								value="${news.noticeId }"> <select name="type" id="type"
								class="form-control" onchange="onType(this);">
								<option value="news"
									<c:if test="${news.announType == 'news' }">selected</c:if>>新闻
								
								<option value="activity"
									<c:if test="${news.announType == 'activity' }">selected</c:if>>促销活动
								
							</select>
						</div>
					</div>
					<div id="activityID" style="display: none;">
						<div class="form-group">
							<label class="col-sm-2 control-label">活动名称:</label>
							<div class="col-sm-8">
								<input name="activityTitle" id="activityTitle"
									value="${news.title }" class="form-control"> <br>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">宣传链接:</label>
							<div class="col-sm-8">
								<input name="activityUrl" id="activityUrl"
									value="${news.activityUrl }" class="form-control"> <br>
							</div>
						</div>
					</div>
					<div id="newsID" style="display: block;">
						<div class="form-group">
							<label class="col-sm-2 control-label">新闻标题:</label>
							<div class="col-sm-8">
								<input name="title" id="title" value="${news.title }"
									class="form-control"> <br>
							</div>
						</div>
						<div class="form-group" id="text">
							<label for="inputIdentifier" class="col-sm-2 control-label">内容</label>
							<div class="col-sm-8">
									<textarea class="summernote" id="contentNews"
										name="contentNews">${news.content }</textarea>
							</div>
						</div>
					</div>
					<div class="form-group">

						<label class="col-sm-2 control-label">是否发布:</label>
						<div class="col-sm-8">
							<select class="form-control" name="isThrough">
								<option value="false"
									<c:if test="${news.isThrough == 'false' }">selected</c:if>>稍后发布
								
								<option value="true"
									<c:if test="${news.isThrough == 'true' }">selected</c:if>>现在发布
								
							</select> <br>
						</div>
					</div>
					<script>
					$(function() {
						$('.summernote').summernote({
							height : 400,
							minHeight : null, // set minimum height of editor
							maxHeight : null, // set maximum height of editor
							focus : true,
							lang: 'zh-CN'
						});

						// 							$('form').on('submit', function(e) {
						// 								e.preventDefault();
						// 								alert($('.summernote').code());

						// 							});
					});
						function onType(obj) {
							var type = obj.value;
							if (type == 'news') {
								$('#activityTitle').val("");
								$('#activityUrl').val("");
							} else {
								$('#title').val("");
								$('#contentNews').text("");
								$('#editors').html("输入内容&hellip;");
							}
							$('#activityID').hide();
							$('#newsID').hide();
							$('#' + type + 'ID').show();
						}
					</script>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-12">
							<button type="button" value="${page }" id="subForm"
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
	$(document).ready(function() {
		var type = $("#type").val();
		$('#activityID').hide();
		$('#newsID').hide();
		$('#' + type + 'ID').show();
	});
	$(document).ready(function() {
		$('#subForm').on('click', function(e) {
			e.preventDefault();
			$('#contentNews').val($('.summernote').code());
			$('#noticeForm').submit();
		});
	});
	function onclickBut(obj) {
		if (obj == 'update') {
			$('#contentNews').val($('#editors').html().trim());
			document.form.action = "management/updateNews";
			document.form.submit();
		} else {
			$('#contentNews').val($('#editors').html().trim());
			document.form.action = "management/addNews";
			document.form.submit();
		}
	}
</script>
<jsp:include page='../common/footer.jsp' />