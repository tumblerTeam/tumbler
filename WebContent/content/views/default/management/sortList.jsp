<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<title>不倒翁后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理</title>
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="content/static/js/echart/ie-emulation-modes-warning.js"></script>
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

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="content/static/css/bootstrap/bootstrap-tree.css"
	rel="stylesheet">
</head>
	<!-- Static navbar -->
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
<br><br>
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-4 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					分类
				</h3>
			</div>
			<div class="tree well">
				<c:set var="index" value="0" scope="request" />
				<!-- 自增序号，注意scope-->
				<c:set var="level" value="0" scope="request" />
				<!-- 记录树的层次，注意scope-->
				<c:import url="__department.jsp" />
			</div>
		</div>
	</div>
	<div class="col-md-6 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">当前分类：<font color="red">${shopCategory.category }</font></h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
					<br>
					<form class="form-horizontal" id="form" name="form" 
						method="POST"  enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">上级分类:</label>
							<c:if test="${shopCategory.parentLevel != null }">
								<label class="col-sm-2 control-label">${shopCategory.parentLevel.category }</label>
							</c:if>
							<br>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分类名称:</label> 
							<div class="col-sm-8">
							<input id="departmentID" name="departmentID" value="${shopCategory.categoryID }" type="hidden">
								<input name="departmentname" class="form-control"
									value="${shopCategory.category }" > <br>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分类状态:</label> 
							<div class="col-sm-8">
								<label class="control-label">
									<c:if test="${shopCategory.isForbidden == false }"><font color="green">启用中</font></c:if>	
									<c:if test="${shopCategory.isForbidden == true }"><font color="red">禁用中</font></c:if>	
								</label>
								<br>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8" style="text-align: center;">
								<button type="button" class="btn btn-default" onclick="addOrUpdateDep();">添加下级分类</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default" onclick="updateDepartmen();">修改此分类</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default" onclick="deleteDepartmen();">禁用或启用此分类</button>
							</div>
						</div>
					</form>
				</P>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function onclickID(id) {
			location.href = 'management/getAgriculturalsSort?id=' + id+"&page=sortList";
		}
		function addOrUpdateDep(){
			document.form.action="management/addOrUpdateDep";
			document.form.submit();
		}
		function updateDepartmen(){
			document.form.action="management/updateDepartmen?departmentId="+$('#departmentID').val();
			document.form.submit();
		}
		function deleteDepartmen(){
			document.form.action="management/deleteDepartmen?departmentId="+$('#departmentID').val();
			document.form.submit();
		}
		$(function() {
			$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr(
					'title', 'Collapse this branch');
			$('.tree li.parent_li > span').on(
					'click',
					function(e) {
						var children = $(this).parent('li.parent_li').find(
								' > ul > li');
						if (children.is(":visible")) {
							children.hide('fast');
							$(this).attr('title', 'Expand this branch').find(
									' > i').addClass('icon-plus-sign')
									.removeClass('icon-minus-sign');
						} else {
							children.show('fast');
							$(this).attr('title', 'Collapse this branch').find(
									' > i').addClass('icon-minus-sign')
									.removeClass('icon-plus-sign');
						}
						e.stopPropagation();
					});
		});
	</script>
<jsp:include page='../common/footer.jsp' />