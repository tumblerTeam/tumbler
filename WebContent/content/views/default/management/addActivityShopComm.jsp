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

<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>

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
					<a href="management/activityShopCommodity">活动商品添加<span
						class="badge navbar-right">返回</span></a>
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" method="post"
					id="noticeForm" name="form" enctype="multipart/form-data">
					<div class="form-group">
						<label class="col-sm-2 control-label">活动名称:</label>
						<div class="col-sm-8">
							<select id="activityId" name="activityId"  class="form-control">
								<c:forEach items="${activitys }" var="style">
									<option value="${style.activityId }"
										<c:if test="${shopcommodity.activity.activityId == style.activityId }">selected</c:if>>${style.activityName }
								</c:forEach>
							</select><br> <input type="hidden" id="commCode" name="commCode"
								value="${shopcommodity.commCode }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品ID:</label>
						<div class="col-sm-8">
							<input name="commID" id="commID"
								value="${shopcommodity.commCode }" class="form-control">
							<br>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品数目:</label>
						<div class="col-sm-8">
							<input name="activityAmount" id="activityAmount"
								value="${shopcommodity.activityAmount }" class="form-control">
							<br>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品链接:</label>
						<div class="col-sm-8">
							<input name="link" id="link" value="${shopcommodity.link }"
								class="form-control"> <br>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">活动照片:</label>
						<div class="col-sm-8">
							<input name="actityImage" id="actityImage"
								value="${shopcommodity.actityImage }" class="form-control"
								type="file" onchange="PreviewImage(this);"> <br>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"> </label>
						<div class="col-sm-8" id="brandLogo">
							<c:if test="${shopcommodity.actityImage != null}">
								<img alt="" src="${shopcommodity.actityImage }">
							</c:if>
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
	function PreviewImage(imgFile) {
		var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
		if (!pattern.test(imgFile.value)) {
			alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");
			imgFile.focus();
		} else {
			var path;
			if (document.all)//IE 
			{
				imgFile.select();
				path = document.selection.createRange().text;
				document.getElementById("brandLogo").innerHTML = "";
				document.getElementById("brandLogo").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""
						+ path + "\")";//使用滤镜效果 
			} else//FF 
			{
				path = URL.createObjectURL(imgFile.files[0]);
				document.getElementById("brandLogo").innerHTML = "<img name='picshow' src='"+path+"'/>";
			}
		}
	}
	function dateInfoxxx(obj) {
		var date = obj;
		$('#' + date).datetimepicker({
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		});
	}
	function checkvalue(obj) {
		if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
			alert('你输入的不是数字，或关闭输入法后再输入');
			obj.select();
		}
	}
	function onclickBut(obj) {
		if (obj == 'update') {
			document.form.action = "management/updateCommActivity";
			document.form.submit();
		} else {
			document.form.action = "management/addCommActivity";
			document.form.submit();
		}
	}
</script>
<jsp:include page='../common/footer.jsp' />