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
							<ul>
							<c:forEach var="cur" items="${cate.brands }" varStatus="vs">  
								<li><span><i class="icon-minus-sign"></i>${cur.brandName }</span><a href="javascript:void(0);" onclick="onclickbrandID('${cate.categoryID }','${cur.brandID}');">&nbsp;&nbsp;<img title="操作" src="content/static/images/banshou.png"></a>
							</c:forEach> 
							</ul>
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
					<form class="form-horizontal" action="management/addBrand"  id="form" name="IUpload" 
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
							<label class="col-sm-2 control-label">品牌名称:</label> 
							<div class="col-sm-8">
							<input id="categoryID" name="categoryID" value="${shopCategory.categoryID }" type="hidden">
							<input id="brandID" name="brandID" value="${brand.brandID }" type="hidden">
								<input name="brandName" class="form-control" 
									value="${brand.brandName }"> <br>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								logo照片</label>
							<div class="col-sm-8">
								<input name="sendFile" type="file" size="40" maxlength="40" class="form-control" onchange="PreviewImage(this);">
								图片大小&nbsp;&nbsp;<font color="red">120x70</font>
								<br>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								</label>
							<div class="col-sm-8" id="brandLogo">
								<c:if test="${brand.logo != null}">
									<img alt="" src="${brand.logo }" >
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8" style="text-align: center;">
								<button type="button" onclick="detect();" class="btn btn-default">添加品牌</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default" onclick="updateDepartmen();">修改该品牌</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default" onclick="deleteDepartmen();">删除该品牌</button>
							</div>
						</div>
					</form>
				</P>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 function PreviewImage(imgFile) 
	   { 
	    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
	    if(!pattern.test(imgFile.value)) 
	    { 
	     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
	     imgFile.focus(); 
	    } 
	    else 
	    { 
	     var path; 
	     if(document.all)//IE 
	     { 
	      imgFile.select(); 
	      path = document.selection.createRange().text; 
	      document.getElementById("brandLogo").innerHTML=""; 
	      document.getElementById("brandLogo").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
	     } 
	     else//FF 
	     { 
	      path = URL.createObjectURL(imgFile.files[0]);
	      document.getElementById("brandLogo").innerHTML = "<img name='picshow' src='"+path+"'/>"; 
	     } 
	    } 
	   } 
	   function imgExceedSize(w,h){
			if(!document.IUpload.sendFile.value==""){
				if(picshow.width !=w||picshow.height !=h){
					alert("图像尺寸："+picshow.width+"X"+picshow.height+"。图像尺寸过大！你只能上传尺寸为 "+w+"×"+h+"的图像，请重新浏览图片！");
					document.getElementById("brandLogo").innerHTML = "";
					return true;
				}else{
					return false;
				}
			}else{
				return true;
			}
		}
	   function detect(){
			var ok=imgExceedSize(120,70);
			if(ok){
				document.IUpload.reset();
			}else{
				document.IUpload.submit();
			}
		}
		function onclickID(id) {
			location.href = 'management/getCateByCateID?cateID=' + id;
		}
		function onclickbrandID(cateid,id) {
			location.href = "management/getBrandByCateID?cateID="+cateid+"&brandID=" + id;
		}
		function updateDepartmen(){
			if (document.IUpload.sendFile.value != "") {
				var ok=imgExceedSize(120,70);
				if(ok){
	 				document.IUpload.reset();
	 			}else{
	 				document.IUpload.action="management/updateBrand";
	 				document.IUpload.submit();
	 			}
			}else{
				document.IUpload.action="management/updateBrand";
				document.IUpload.submit();
			}
		}
		function deleteDepartmen(){
			location.href = "management/deleteBrand?categoryID="+$('#categoryID').val()+"&brandID="+$('#brandID').val();
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