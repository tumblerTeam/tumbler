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
<link
	href="content/static/css/bootstrap/bootstrap-combined.no-icons.min.css"
	rel="stylesheet">
<link
	href="content/static/css/bootstrap/bootstrap-responsive.min.css"
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
<br/><br/><br/>
<div class="row clearfix">
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-10 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title" style="height: 16px; ">
					<a href="management/news">新闻添加<span class="badge navbar-right">返回</span></a>
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form"
					method="post" id="noticeForm" name="form">
					<div class="form-group">
							<label class="col-sm-2 control-label">类型:</label> 
							<div class="col-sm-8">
							<input type="hidden" id="id" name="noticeId" value="${news.noticeId }">
								<select name="type" id="type" class="form-control" onchange="onType(this);">
									<option value="news" <c:if test="${news.announType == 'news' }">selected</c:if>>新闻
									<option value="activity" <c:if test="${news.announType == 'activity' }">selected</c:if>>促销活动
								</select>
							</div>
						</div>
					<div id="activityID" style="display: none;">
						<div class="form-group">
							<label class="col-sm-2 control-label">活动名称:</label> 
							<div class="col-sm-8">
								<input name="activityTitle" id="activityTitle" value="${news.title }" class="form-control"> <br>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">宣传链接:</label> 
							<div class="col-sm-8">
								<input name="activityUrl" id="activityUrl" value="${news.activityUrl }" class="form-control"> <br>
							</div>
						</div>
					</div>
					<div id="newsID" style="display: block;">
					<div class="form-group">
							<label class="col-sm-2 control-label">新闻标题:</label> 
							<div class="col-sm-8">
								<input name="title" id="title" value="${news.title }" class="form-control"> <br>
							</div>
						</div>
					<div class="form-group" id="text">
						<label for="inputIdentifier" class="col-sm-2 control-label">内容</label>
						<div class="col-sm-8">
							<div  style="display: none;"><textarea id="contentNews" name="contentNews"></textarea></div>
								<DIV class="btn-toolbar" DATA-role="editor-toolbar"
									DATA-target="#editor">
									<DIV class="btn-group">
										<a class="btn dropdown-toggle" DATA-toggle="dropdown"
											title="Font"><i class="icon-font"></i><b class="caret"></b></a>
										<ul class="dropdown-menu">
										</ul>
									</DIV>
									<DIV class="btn-group">
										<a class="btn dropdown-toggle" DATA-toggle="dropdown"
											title="Font Size"><i class="icon-text-height"></i>&nbsp;<b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a DATA-edit="fontSize 5"><font size="5">Huge</font></a></li>
											<li><a DATA-edit="fontSize 3"><font size="3">Normal</font></a></li>
											<li><a DATA-edit="fontSize 1"><font size="1">Small</font></a></li>
										</ul>
									</DIV>
									<DIV class="btn-group">
										<a class="btn" DATA-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
											class="icon-bold"></i></a> <a class="btn" DATA-edit="italic"
											title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a> <a
											class="btn" DATA-edit="strikethrough" title="Strikethrough"><i
											class="icon-strikethrough"></i></a> <a class="btn"
											DATA-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
											class="icon-underline"></i></a>
									</DIV>
									<DIV class="btn-group">
										<a class="btn" DATA-edit="insertunorderedlist"
											title="Bullet list"><i class="icon-list-ul"></i></a> <a
											class="btn" DATA-edit="insertorderedlist" title="Number list"><i
											class="icon-list-ol"></i></a> <a class="btn" DATA-edit="outdent"
											title="Reduce indent (Shift+Tab)"><i
											class="icon-indent-left"></i></a> <a class="btn"
											DATA-edit="indent" title="Indent (Tab)"><i
											class="icon-indent-right"></i></a>
									</DIV>
									<DIV class="btn-group">
										<a class="btn" DATA-edit="justifyleft"
											title="Align Left (Ctrl/Cmd+L)"><i
											class="icon-align-left"></i></a> <a class="btn"
											DATA-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
											class="icon-align-center"></i></a> <a class="btn"
											DATA-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
											class="icon-align-right"></i></a> <a class="btn"
											DATA-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
											class="icon-align-justify"></i></a>
									</DIV>
									<DIV class="btn-group">
										<a class="btn dropdown-toggle" DATA-toggle="dropdown"
											title="Hyperlink"><i class="icon-link"></i></a> <a
											class="btn" DATA-edit="unlink" title="Remove Hyperlink"><i
											class="icon-cut"></i></a>
									</DIV>

									<DIV class="btn-group">
										<a class="btn" DATA-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
											class="icon-undo"></i></a> <a class="btn" DATA-edit="redo"
											title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
									</DIV>
									<input TYPE="text" DATA-edit="inserttext" id="voiceBtn"
										X-webkit-speech="">
								</DIV>
								<DIV id="editors" style="overflow:scroll; height: 300px; border: 2px solid #D8D8D8; ">
									<c:if test="${news.content !=null }">${news.content }</c:if>
								<c:if test="${news.content ==null }">输入内容&hellip;</c:if></DIV>
								
							</div>
					</div>
					</div>
					<div class="form-group"> 
						
							<label class="col-sm-2 control-label">是否发布:</label> 
							<div class="col-sm-8">
								<select class="form-control" name="isThrough">
									<option value="false" <c:if test="${news.isThrough == 'false' }">selected</c:if>>稍后发布
									<option value="true" <c:if test="${news.isThrough == 'true' }">selected</c:if>>现在发布
								</select> <br>
							</div>
						</div>
					<script>
					function onType(obj){
						var type = obj.value;
						if(type == 'news'){
							$('#activityTitle').val("");
							$('#activityUrl').val("");
						}else{
							$('#title').val("");
							$('#contentNews').text("");
							$('#editors').html("输入内容&hellip;");
						}
						$('#activityID').hide();
						$('#newsID').hide();
						$('#'+type+'ID').show();
					}
				
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editors').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings(); 
	$('#editors').wysiwyg({ fileUploadError: showErrorAlert} );
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
  });
</script>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-12">
							<button type="button" onclick="onclickBut('${page }');" class="btn btn-default"><c:if test="${page == 'update'}">修改</c:if><c:if test="${page != 'update'}">添加</c:if></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var type = $("#type").val();
		$('#activityID').hide();
		$('#newsID').hide();
		$('#'+type+'ID').show();
	});
	function onclickBut(obj){
		if(obj == 'update'){
			$('#contentNews').val($('#editors').html().trim());
			document.form.action="management/updateNews";
	 		document.form.submit();
		}else{
			$('#contentNews').val($('#editors').html().trim());
	 		document.form.action="management/addNews";
	 		document.form.submit();
		}
	}
</script>
<jsp:include page='../common/footer.jsp' />