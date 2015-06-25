<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加广告</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="content/static/img/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="content/static/img/favicon.png" />
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>

<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet" />
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<body>
	<jsp:include page='../common/header.jsp' />
	<br />
	<br />
	<div class="row clearfix">
		<jsp:include page='../common/menu.jsp' />
		<div class="col-md-10 column">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title" style="height: 16px;">
						<a href="management/advertisement"><c:if test="${method != 'update' }">添加广告</c:if><c:if test="${method == 'update' }">更新广告</c:if><span
							class="badge navbar-right">返回</span></a>
					</h3>
				</div>
				<div class="panel-body">
				<form class="form-horizontal" id="form" name="IUpload" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">投放位置</label>
						<div class="col-sm-3">
							<select name="whichPage" id="whichPage" class="form-control"
								onchange="depChange(this);">
								<option value="0">所在页面</option>
								<c:forEach var="AdvertisementPage" items="${list }"
									varStatus="pool">
									<option value="${AdvertisementPage }" <c:if test="${advertisement.adverDistribution.whichPage == AdvertisementPage }">selected</c:if>>
										${AdvertisementPage }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-3">
							<select name="position" id="position" class="form-control" onchange="posChange(this);">
								<option value="0">所在位置</option>
								<c:if test="${advertisement.adverDistribution !=null }">
									<option value="${advertisement.adverDistribution.position }" selected="selected">${advertisement.adverDistribution.position }</option>
								</c:if>
							</select>
							<input id="lAndW" type="hidden" value="${advertisement.adverDistribution.lAndW }">
						</div><label id="tishi"></label>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">商品ID</label>
						<div class="col-sm-8">
							<input id="commID" class="form-control" name="commID"
								value="${advertisement.commodity.commCode}"  onblur="checkvalue(this)">
						</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">图片路径</label>
							<div class="col-sm-8">
								<input id="imagePath" class="form-control" name="imagePath"
									type="file" onchange="PreviewImage(this);" />
							</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"> </label>
						<div class="col-sm-8" id="brandLogo">
							<c:if test="${advertisement.commodity.actityImage != null}">
								<img alt="" src="${advertisement.commodity.actityImage }">
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">URL链接</label>
						<div class="col-sm-8">
							<input id="link" class="form-control" name="link"
								value="${advertisement.link}">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">广告支出</label>
							<input type="hidden" name="id" value="${advertisement.id }">
						<div class="col-sm-8">
							<input id="expenditure" class="form-control" name="expenditure" 
								value="${advertisement.expenditure}">
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">广告收入</label>
						<div class="col-sm-8">
							<input id="income" class="form-control" name="income"  onblur="checkvalue(this)"
								value="${advertisement.income}">
						</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">起始时间</label>
						<div class="col-sm-8">
							<input id="startDate" class="form-control" name="startDate"
								value="${advertisement.startDate}" onclick="dateInfoxxx('startDate')">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">投放天数</label>
						<div class="col-sm-8">
							<input id="during" class="form-control" name="during"
								value="${advertisement.during}"  onblur="checkvalue(this)">
						</div>
						天
					</div>
					<div class="form-group">
						<div class=" col-sm-12" style="text-align: center;">
								<button type="button" class="btn btn-default"
									onclick="detect('${method}');"><c:if test="${method != 'update' }">添加广告</c:if><c:if test="${method == 'update' }">更新广告</c:if></button>
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
			if (!document.IUpload.imagePath.value == "") {
				if (picshow.width != w || picshow.height != h) {
					alert("图像尺寸：" + picshow.width + "X" + picshow.height
							+ "。图像尺寸过大！你只能上传尺寸为 " + w + "×" + h
							+ "的图像，请重新浏览图片！");
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
				if (!document.IUpload.imagePath.value == "") {
					if($('#lAndW').val() != ''){
						ok = imgExceedSize($('#lAndW').val().split('*')[0], $('#lAndW').val().split('*')[1]);
						if (ok) {
							document.IUpload.reset();
						} else {
							document.IUpload.action = "management/updateAdvertisement";
							document.IUpload.submit();
						}
					}else{
						alert('请选择广告页面和广告所在位置！！');
					}
				} else {
					document.IUpload.action = "management/updateAdvertisement";
					document.IUpload.submit();
				}

			} else {
				if($('#lAndW').val() != ''){
					ok = imgExceedSize($('#lAndW').val().split('*')[0], $('#lAndW').val().split('*')[1]);
					if (ok) {
						document.IUpload.reset();
					} else {
						document.IUpload.action = "management/addAdvertisement";
						document.IUpload.submit();
					}
				}else{
					alert('请选择广告页面和广告所在位置！！');
				}
			}
		}
		function depChange(obj) {
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : 'toJsonFmatUtil/getAdverPositions?whichPage='
						+ obj.value,
				dataType : 'json',
				success : function(data) {
					if (data.success == 'true') {
						var pos = document.getElementById('position');
						var numd = pos.options.length;
						for (i = numd - 1; i >= 0; i--) {
							pos.remove(i);
						}
						var objOption = new Option("所在位置", "0");
						pos.options[pos.options.length] = objOption;
						$.each(data.list, function(i, position) {
							var objOption = new Option(position, position);
							pos.options[pos.options.length] = objOption;
						});
					}
				}
			});
		}
		
		function posChange(obj){
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : 'toJsonFmatUtil/getImgeWitch?whichPage='
						+ $('#whichPage').val()+'&posID='+obj.value,
				dataType : 'json',
				success : function(data) {
					if (data.success == 'true') {
						$('#lAndW').val(data.lAndW);
						$('#tishi').html("<font color='blue'>该广告位宣传图片大小为：</font>&nbsp;&nbsp;<font color='red'>"+data.lAndW+"</font>");
					}
				}
			});
		}

		function popupwindow(url) {
			var w = 700;
			var h = 800;
			var title = "";
			var left = (screen.width / 2) - (w / 2);
			var top = (screen.height / 2) - (h / 2);
			return window
					.open(
							url,
							title,
							'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes, width='
									+ w
									+ ', height='
									+ h
									+ ', top='
									+ top
									+ ', left=' + left);
		}
	</script>
</body>
</html>