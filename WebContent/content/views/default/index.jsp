<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>不倒翁</title>
<meta name="description"
	content="CSS3 Full Screen Vertical Scroller with jQuery animation fallback" />
<meta name="viewport" content="width=device-width, user-scalable=no" />
<script type="text/javascript"
	src="content/static/js/lib/jquery.min.js"></script>
</head>
<body>
<a href="#" onclick="hrefPage();">ddddd</a>
<a href="#" onclick="page();">fffff</a>
<script type="text/javascript">
	function hrefPage(){
		location.href = "login?page="+window.location.href;
	}
	function page(){
		location.href = "../user/binding?action=register&id=1&email=251851509@qq.com";
	}
</script>
</body>
</html>
