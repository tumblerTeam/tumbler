<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>尊享洋酒</title>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/xiugai.css" />

</head>
<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="breadCrumb"
		style="background-color: #E8E8E8; height: 30px; line-height: 30px; width: 100%;">
		<div class="con" style="width: 1200px; margin: 0px auto;">
			<a href="index">首页</a> <a>我的酒翁</a>
		</div>
	</div>
	<div class="personal">
		<jsp:include page="../frontDesk/left.jsp" />

		<div class="wuliu">
			<div class="info">
				<h3>你的快递已被签收</h3>
				<input type="text" id="wuliuParam" /> 
				<select id="searchParam">
				</select>
				<button onclick="search();">查询</button>
				<hr />
				<script type="text/javascript">
					$(document).ready(function(){
						jQuery.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : 'http://v.juhe.cn/exp/com?key=56da3d699d0582892ec1982d84ac3c98',
							dataType : 'JSONP',
							success : function(data) {
								var $guige2 = "";
								if(data.resultcode == 200){
									$.each(data.result,function(i, item) {
										$guige2 = $guige2 +"<option value='"+item.no+"'>"+item.com+"</option>";
									});
									$('#searchParam').append($guige2);
								}
							}});
						
					});
					function search() {
						$('.info').html("");
						$(document).ready(function() {
							jQuery.ajax({
								type : 'GET',
								contentType : 'application/json',
								url : "http://v.juhe.cn/exp/index?key=56da3d699d0582892ec1982d84ac3c98&com="+$('#searchParam').val()+"&no="+$('#wuliuParam').val(),
								dataType : 'JSONP',
								success : function(data) {
									var $guige2 = "";
									if(data.resultcode == 200){
										$.each(data.result.list,function(i, item) {
											$guige2 = $guige2 + "<div class='info_class1'><span class='sp1'>"+item.datetime+"</span> <span class='sp2'>"+item.remark+"</span><span class='sp3'>"+item.zone+"</span></div>";
										});
										$('.info').append($guige2);
									}
									if(data.resultcode ==204302){
										$('.info').html("请填写正确的运单号");
									}
									if(data.resultcode ==204301){
										$('.info').html("未被识别的快递公司");
									}
									if(data.resultcode ==204303 || data.resultcode == 204304){
										$('.info').html("查询失败");
									}
								}
							});
						})
					}
				</script>
				
			</div>
			<hr style="margin-top: 20px;" />
			<div class="xinxi_info">
				<div>
					<span>运单号码：</span> <strong>363819556747 </strong> <span>物流公司：</span>
					<strong>中通快递</strong> <span>客服电话：</span> <strong>0571-87579622</strong>
				</div>
				<div>
					<span>卖家昵称：</span> <strong> 王晓琴</strong>
				</div>
				<div>
					<span>发货地址： 四川省成都市金牛区西岸观邸 </span> <strong>614000 王晓琴
						18780279901</strong>
				</div>
				<div>
					<span>收货地址： 新疆维吾尔自治区乌鲁木齐市天山区新华北路街道 新华南路街道人民路151号君泰大厦15-A3室</span> <strong>000000
						vvv 13565965701</strong>
				</div>
			</div>
		</div>



		<jsp:include page="../frontDesk/right.jsp" />
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
	<!--右边-->
</body>
</html>
