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
<title>品牌管理</title>
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
				<ul>
					<c:forEach items="${categories }" var="cate">
						 <li><span><i class="icon-minus-sign"></i>${cate.category }</span><a href="javascript:void(0);" onclick="onclickID('${cate.categoryID}');">&nbsp;&nbsp;<img title="操作" src="content/static/images/banshou.png"></a>
						 </li>  
					</c:forEach>
				</ul>  
			</div>
		</div>
	</div>
	<div class="col-md-6 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">操作</h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
					<br>
					<form class="form-horizontal" action="management/divideSpec"  id="form" name="IUpload" 
						method="post"  enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">产品分类:</label>
								<label class="col-sm-2 control-label">${shopCategory.category }</label>
							<br>
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
							<label class="col-sm-2 control-label">规格名称:</label> 
							<div class="col-sm-8">
							<input id="categoryID" name="categoryID" value="${shopCategory.categoryID }" type="hidden">
								<c:forEach var="specs" items="${list }">
									<c:set var="isok" value="false"></c:set>
									<c:forEach items="${cateSpec }" var="spec">
										<c:if test="${spec.id == specs.id }">
											<c:set var="isok" value="true"></c:set>
										</c:if>
									</c:forEach>
									<input name="specs"  type="checkbox"
										value="${specs.id }" <c:if test="${isok }">checked</c:if>>${specs.specificatName }
								</c:forEach>
								 <br>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8" style="text-align: center;">
								<button type="submit" class="btn btn-default">分配</button>
							</div>
						</div>
					</form>
				</P>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function onclickID(id) {
			location.href = 'management/getCateByID?cateID=' + id;
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