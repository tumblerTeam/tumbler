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
					<a href="management/famousManorList">名庄添加<span
						class="badge navbar-right">返回</span></a>
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" method="post"
					id="noticeForm" name="IUpload" enctype="multipart/form-data">
					<div class="form-group">
						<label class="col-sm-2 control-label">名庄名称:</label>
						<div class="col-sm-8">
							<input type="hidden" id="id" name="id" value="${manor.id }">
							<input name="manorName" id="manorName"
								value="${manor.manorName }" class="form-control"> <br>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">广告标题:</label>
						<div class="col-sm-8">
							<input name="title" id="title"
								value="${manor.title }" class="form-control"> <br>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">logo标志:</label>
						<div class="col-sm-8">
							<input name="path" id="path" type="file" class="form-control"
								size="40" maxlength="40" onchange="PreviewImage(this);">
							图片大小&nbsp;&nbsp;<font color="red">200X176</font><br>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"> </label>
						<div class="col-sm-8" id="brandLogo">
							<c:if test="${manor.logoPath != null}">
								<img alt="" src="${manor.logoPath }">
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">酒庄描述:</label>
						<div class="col-sm-8">
							<textarea cols="200" rows="3" name="describes" id="describes"
								class="form-control">
								${manor.describes }
							</textarea>
							<br>
						</div>
					</div>
					<div class="form-group"> 
						
							<label class="col-sm-2 control-label">是否启用:</label> 
							<div class="col-sm-8">
								<select class="form-control" name="isForbidden">
									<option value="true" <c:if test="${manor.isForbidden == 'true' }">selected</c:if>>启用
									<option value="false" <c:if test="${manor.isForbidden == 'false' }">selected</c:if>>禁用
								</select> <br>
							</div>
						</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-12">
							<button type="button" onclick="detect('${page }');"
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
	function imgExceedSize(w, h) {
		if (!document.IUpload.path.value == "") {
			if (picshow.width != w || picshow.height != h) {
				alert("图像尺寸：" + picshow.width + "X" + picshow.height
						+ "。图像尺寸过大！你只能上传尺寸为 " + w + "×" + h + "的图像，请重新浏览图片！");
				document.getElementById("brandLogo").innerHTML = "";
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
	function detect(obj) {
		if (obj == 'update') {
			if(!document.IUpload.path.value == ""){
				ok = imgExceedSize(200, 176);
				if (ok) {
					document.IUpload.reset();
				} else {
					document.IUpload.action = "management/updateManor";
					document.IUpload.submit();
				}
			}else{
				document.IUpload.action = "management/updateManor";
				document.IUpload.submit();
			}
			
		} else {
			ok = imgExceedSize(200, 176);
			if (ok) {
				document.IUpload.reset();
			} else {
				document.IUpload.action = "management/addManor";
				document.IUpload.submit();
			}
		}
	}
</script>
<jsp:include page='../common/footer.jsp' />