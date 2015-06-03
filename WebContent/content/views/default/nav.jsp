<%@page import="com.yc.entity.user.Personnel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="personnel"
	value='<%=(Personnel) request.getSession().getAttribute(
						"loginPersonnle")%>'></c:set>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle" data-toggle="dropdown">管理 <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="management/missionPlan">任务计划</a></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">运输</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0);">运输方式</a></li>
								<li><a href="javascript:void(0);">关税</a></li>
								<li><a href="javascript:void(0);">部门格子</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">管理</a>
							<ul class="dropdown-menu">
								<li><a href="management/department">组织机构</a></li>
								<li><a href="management/position">职位角色</a></li>
								<li><a href="management/deparDivide">机构角色分配</a></li>
								<li><a href="management/posDivide">角色员工分配</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">其它</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0);">淘宝账户</a></li>
								<li><a href="management/ticket">票的类型</a></li>
								<li><a href="management/posAndTicket">职位与票</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">内容</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0);">语言</a></li>
								<li><a href="management/advertisement">广告</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">折扣</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0);">参与折扣</a></li>
								<li><a href="management/promotionCode">促销码</a></li>
								<li><a href="javascript:void(0);">折扣</a></li>
								<li><a href="javascript:void(0);">折扣类型</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">商品</a>
							<ul class="dropdown-menu">
								<li><a href="management/shopCategory">商品分类</a></li>
								<li><a href="javascript:void(0);">成批商品</a></li>
								<li><a href="javascript:void(0);">首页商品</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">翻译</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0);">翻译产品名称</a></li>
								<li><a href="javascript:void(0);">翻译选项名称</a></li>
								<li><a href="javascript:void(0);">翻译选项内容</a></li>
								<li><a href="javascript:void(0);">翻译搜索短语</a></li>
								<li><a href="javascript:void(0);">产品名称</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="javascript:void(0);">黑名单</a>
							<ul class="dropdown-menu">
								<li><a href="management/blacklistStores">店家黑名单</a></li>
								<li><a href="management/blacklistGoods">商品黑名单</a></li>
							</ul></li>
						<li><a href="management/merchantsSettled">入驻商家</a></li>
						<li><a href="management/personnel">员工</a></li>
						<li><a href="management/user">用户</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="management/missionPlan"><font color="blue"><div
								id="nums"></div></font></a></li>
				<li><a href="javascript:void(0);"><c:out
							value="${personnel.userName }"></c:out></a></li>
				<li><a href="personnel/logout">退出</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</nav>
<script type="text/javascript">
	$(document).ready(function() {
		jQuery.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : 'getShopCategory/getPlanNum',
			dataType : 'json',
			success : function(data) {
				if (data.success == 'true') {
					$('#nums').html("您有任务(" + data.num + ")");
				}
			}
		});
	});
</script>
