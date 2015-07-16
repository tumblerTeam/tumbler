<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Shop shop = (Shop)request.getSession().getAttribute("shop");
%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>不倒翁</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css"/>
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<script type="text/javascript" src="content/static/js/datetime/jquery.js"></script>

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" />
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

<link rel="stylesheet" href="content/static/css/bootstrap/bootstrap.min.css" />
<script type="text/javascript" src="content/static/js/lib/bootstrap.min.js"></script>
<link rel="stylesheet" href="content/static/css/bootstrap/font-awesome.min.css" />
<link rel="stylesheet" href="content/static/css/bootstrap/elements.less" />

  <link rel="stylesheet" href="content/static/css/bootstrap/summernote.css"/>
  <script type="text/javascript" src="content/static/js/lib/summernote.js"></script>
  <script type="text/javascript" src="content/static/js/lib/summernote-zh-CN.js"></script>



<link href="content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/reception/gr.css" rel="stylesheet"
	type="text/css" />
<!-- <link href="content/static/css/reception/persc.css" rel="stylesheet" -->
<!-- 	type="text/css" /> -->
	
<!-- <script type="text/javascript" -->
<!-- 	src="content/static/js/reception/png.js"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="content/static/js/reception/sdmenu.js"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="content/static/js/reception/jquery-1.4.2.min.js"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="content/static/js/reception/js.js"></script> -->
<!-- <script type="text/javascript" src="content/static/js/reception/ScrollPic.js"></script> -->



</head>

<body>
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        
	<div class="con">
		<div class="perterrtab perterrtab_2">
			<input id="language" type="hidden" value="chinese" />
			<h3>
				商品新增：
			</h3>
			<div class="kd_yz_cont">
				<form action="proscenium/saveCommodity" enctype="multipart/form-data" onsubmit="return validateComm();"
					method="post">
					<input type="hidden" name="edit" value="0"/>
					<dl>
						<dd>
							<span>商品名称&nbsp<label style="color:red">*</label></span><input id="cname" type="text" value="" name="commoidtyName" />
							<label style="color:red" id="promptcname"></label>
						</dd>
						<dd>
							<span>商品条形码号：</span>&nbsp<label style="color:red">*</label><input onchange="changeValidateCommItem();" id="citem" type="text" value="" name="commItem" />
							<label style="color:red" id="promptcitem"></label>
						</dd>
						<dd>
							<span>商品分类</span>&nbsp<label style="color:red">*</label> <select onchange="shopcateOne(this);" id="shopcateTwo"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${shopCategories }" var="shopcate"
									varStatus="loop">
										<option value="${shopcate.categoryID}">${shopcate.category}</option>
								</c:forEach>
							</select>
							<label style="color:red" id="promptshopcateTwo"></label>
						</dd>
						<dd>
							<span>商品分类</span>&nbsp<label style="color:red">*</label> <select name = "categoryid"  id="shopcateThree"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${list2 }" var="shopcate"
									varStatus="loop">
										<option value="${shopcate.categoryID}">${shopcate.category}</option>
								</c:forEach>
							</select>
							<label style="color:red" id="promptshopcateThree"></label>
						</dd>
						<!-- 新增开始 -->
						<dd>
							<span>酒精度</span>&nbsp<label style="color:red">*</label><input id="calcohol" type="text" style="width: 100px;"
								value="" name="alcoholDegree" onblur="checkvalue(this);" /><label>%</label>
							<label style="color:red" id="promptcalcohol"></label>
							<span>净含量</span>&nbsp<label style="color:red">*</label><input id="cweights" type="text" style="width: 100px;"
								value="" name="Weight" /><label>ml(毫升)</label>
							<label style="color:red" id="promptcweights"></label>
						</dd>
						<dd>
							<span>保质期</span><input type="text" style="width: 100px;"
								value="" name="deadline" />天
							<span>包装方式</span><input type="text" style="width: 100px;"
								value="" name="packManner" />
						</dd>
						<dd>
							<span>产地</span><input type="text" style="width: 100px;"
								value="" name="productPlace"/>
							<span>产地省份</span><input type="text" style="width: 100px;"
								value="" name="productProvince"/>
						</dd>
						<dd>
							<span>醒酒时间</span><input type="text" style="width: 100px;"
								value="" name="soberTime" onblur="checkvalue(this);" /><label>小时</label>
							<span>饮酒温度</span><input type="text" style="width: 100px;"
								value="" name="drinkTemperature" onblur="checkvalue(this);" /><label>℃</label>
						</dd>
						<dd>
							<span>生产日期</span>&nbsp<label style="color:red">*</label><input id="cdate" type="date"
								value="" name="productTime"/>
								<label style="color:red" id="promptcdate"></label>
						</dd>
						<dd>
							<span>年份</span><input type="text"
								value="" name="particularYear" onblur="checkvalue(this);" />
						</dd>
						<dd>
							<span>配料表</span>&nbsp<label style="color:red">*</label><input id="cmixture" type="text"
								value="" name="mixtureSheet"/>
							<label style="color:red" id="promptcmixture"></label>
						</dd>
						<dd>
							<span>储藏方法</span>&nbsp<label style="color:red">*</label><input id="cstockway" type="text"
								value="" name="stockWay" />
							<label style="color:red" id="promptcstockway"></label>
						</dd>
						<dd>
							<span>食品添加剂</span>&nbsp&nbsp<label style="color:red">*</label><input id="cfood" type="text"
								value="" name="foodAdditive" />
								<label style="color:red" id="promptcfood"></label>
						</dd>
						<dd>
							<span>生产许可证编号</span>&nbsp<label style="color:red">*</label><input id="cproduct" type="text"
								value="" name="productPerimitNum" />
							<label style="color:red" id="promptcproduct"></label>
						</dd>
						<dd>
							<span>生产标准号</span><input type="text"
								value="" name="productStddNum" />
						</dd>
						<dd>
							<span>生产厂名</span>&nbsp<label style="color:red">*</label><input id="cfactoryname" type="text"
								value="" name="productFactoryName" />
							<label style="color:red" id="promptcfactoryname"></label>
						</dd>
						<dd>
							<span>生产厂址</span>&nbsp<label style="color:red">*</label><input id="cproductaddress" type="text"
								value="" name="productFactoryAddress" />
							<label style="color:red" id="promptcproductaddress"></label>
						</dd>
						<!-- 新增结束 -->
						<dd>
							<span>库存数量</span>&nbsp<label style="color:red">*</label><input id="cstock" type="text" style="width: 100px;"
								value="" name="stock" onblur="checkvalue(this);" />
								<label style="color:red" id="promptcstock"></label>
								<select id="commUnit" name="commUnit" onchange="commUnitHandle();">
									<option value="1">瓶</option>
									<option value="0">箱</option>
								</select>
								<label style="color:red" id="promptcommUnit"></label>
						</dd>
						<dd id="ddUnit" style="display: none">
							<span>每箱</span>&nbsp<label style="color:red">*</label><input id="cperbox" type="text" style="width: 100px;"
							 name="perBoxnum" onblur="checkvalue(this);" />瓶
							<label style="color:red" id="promptcperbox"></label>
						</dd>
						<script>
							function commUnitHandle(){
								var unitValue = document.getElementById("commUnit").value;
								if(unitValue==0){
									document.getElementById("ddUnit").style.display="";
								}if(unitValue==1){
									document.getElementById("ddUnit").style.display="none";
								}
							}
						</script>
						
						<dd>
							<span>单价</span>&nbsp<label style="color:red">*</label><input id="cprice" type="text" style="width: 100px;" value=""
								name="unitPrice"  onblur="checkvalue(this);"/>元
							<label style="color:red" id="promptcprice"></label>
							<span>单瓶重量</span>&nbsp<label style="color:red">*</label><input id="cperweight" type="text"
								style="width: 100px;" value="" name="probablyWeight"  onblur="checkvalue(this);"/>kg(公斤)
							<label style="color:red" id="promptcperweight"></label>
						</dd>
						<dd>
							<span>是否上架</span><input type="radio"
								style="width: 15px; height: 15px;" value="true" name="shelves"
								checked="checked" id="shelvesTrue"/>
								上架&nbsp;&nbsp;&nbsp;&nbsp;<input
								style="width: 15px; height: 15px;" type="radio" value="false"
								name="shelves" id="shelvesFalse" />暂不上架 
								
								<span>是否精品</span><input type="radio"
								style="width: 15px; height: 15px;" value="true" name="iscChoice"
								checked="checked" />精品&nbsp;&nbsp;&nbsp;&nbsp;<input
								style="width: 15px; height: 15px;" type="radio" value="false"
								name="iscChoice" checked="checked" />普通
						</dd>
						<dd id="checkShow">
<!-- 							<span>是否团购</span><input type="radio" -->
<!-- 								style="width: 15px; height: 15px;" value="true" name="auction" -->
<!-- 								checked="checked" />团购&nbsp;&nbsp;&nbsp;&nbsp;<input -->
<!-- 								style="width: 15px; height: 15px;" type="radio" value="false" -->
<!-- 								name="auction" checked="checked" />不团购&nbsp;&nbsp;&nbsp;&nbsp; -->
								
								<span>是否折扣</span><input style="width: 15px; height: 15px;" type="radio" value="false"
								name="isSpecial" checked="checked" id="noIsSpecial"/>不折扣<input
								type="radio" style="width: 15px; height: 15px;" value="true"
								name="isSpecial" id="isSpecial"/>折扣<input type="text" style="width: 100px; display: none;"
								value="" name="special" id="special" onblur="checkvalue(this);"/>
						</dd>
						<dd>
							<span>所属品牌</span><select id="cbrand" name="brandName"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${listBrand }" var="b"
									varStatus="loop">
										<option value="${b.brandID}">${b.brandName}</option>
								</c:forEach>
							</select>
							<label style="color:red" id="promptcbrand"></label>
						</dd>
						<dd>
							<span>是否名庄</span><select name="famousManorId"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${famousManors }" var="fm"
									varStatus="loop">
										<option value="${fm.id}">${fm.manorName}</option>
								</c:forEach>
							</select>
							</dd>
						<c:forEach items="${shop.shopCat.specifications }" var="sp" varStatus="status">
							<dd>
								<span>${sp.specificatName }</span>
								<input type="hidden" name="commspecName${status.count}" value="${sp.specificatName}"/>
								<input type="text" name="${sp.specificatName}"/>
							</dd>
						</c:forEach>	
						<dd>
							<span>照片上传</span>&nbsp<label style="color:red">*</label><input style="margin-left: 126px;" id="uploadfile" type="file" name="myfile" />
							<label style="color:red" id="promptuploadfile"></label>
						</dd>
							<div id="newUpload2" style="padding-top: 50px;"></div>
						<dd>
							<span></span><input type="button" id="btn_add2"
								style="height: 35px; width: 80px;margin-left: 200px;" value="再增加一张">
						</dd>
						
						<dd style="height:0px;">
							<button type="submit" class="btn" style="float:left;margin-top:300px; background-color: #901531; color:#fff; border:none; font-size:14px; ">添加</button>
							<label style="color:red" id="promptallsub"></label>
						</dd>
						<span>商品详情</span>
						<div class="form-group" id="text">
							<div class="col-sm-10">
								<textarea class="summernote" name="describes"></textarea>
								<input type="hidden" name="effect" id="effect">
							</div>
						</div>
						<script type="text/javascript">
							$(function() {
								$('.summernote').summernote({
									height : 100,
									minHeight : null, // set minimum height of editor
									maxHeight : null, // set maximum height of editor
									focus : true,
									lang : 'zh-CN'
								});
							});
						</script>
						
					</dl>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function changeValidateCommItem(){
			var citem = $("#citem").val();
			//验证货号
      		$.ajax({
      			type:'GET',
      			contentType:'application/json',
      			url:'proscenium/checkCommItem?citem='+citem,
      			dataType:'json',
      			success:function(data){
      				if(data.success=='true'){
      					$("#promptcitem").text("数据库中已存在该货号,请换一个货号");
      					return false;
      				}if(data.success=='false'){
      					$("#promptcitem").text("该货号可用");
      				}
      			}
      		});
		}
		function validateComm(){
			var flag = 0;
			var cname = $("#cname").val();
			if(cname==''){
				flag = 1;
				$("#promptcname").text("不得为空");
				return false;
			}else{
				$("#promptcname").text("");
			}
			
			var citem = $("#citem").val();
			if(citem==''){
				flag = 1;
				$("#promptcitem").text("不得为空");
				return false;
			}else {
				$("#promptcitem").text("");
			}
			
			//验证货号
      		$.ajax({
      			type:'GET',
      			contentType:'application/json',
      			url:'proscenium/checkCommItem?citem='+citem,
      			dataType:'json',
      			success:function(data){
      				if(data.success=='true'){
      					flag = 1;
      					$("#promptcitem").text("数据库中已存在该货号,请换一个货号");
      					return false;
      				}if(data.success=='false'){
      					$("#promptcitem").text("该货号可用");
      				}
      			}
      		});
						
			var shopcateTwo = $("#shopcateTwo option:selected").val();
			if(shopcateTwo==-1){
				flag = 1;
				$("#promptshopcateTwo").text("请选择类别");
				return false;
			}else{
				$("#promptshopcateTwo").text("");
			}
			var shopcateThree = $("#shopcateThree option:selected").val();
			if(shopcateThree==-1){
				flag = 1;
				$("#promptshopcateThree").text("请选择类别");
				return false;
			}else{
				$("#promptshopcateThree").text("");
			}
			
			var calcohol = $("#calcohol").val();
			if (calcohol=='') {
				flag = 1;
				$("#promptcalcohol").text("不得为空");
				return false;
			}else{
				$("#promptcalcohol").text("");
			}
			
			var cweight = $("#cweights").val();
			if(cweight==''){
				flag = 1;
				$("#promptcweights").text("不得为空");
				return false;
			}else if(cweight!=null){
				$("#promptcweights").text("");
			}
			
			var cdate = $("#cdate").val();
			if(cdate==''){
				flag = 1;
				$("#promptcdate").text("不得为空");
				return false;
			}else{
				$("#promptcdate").text("");
			}
			
			var cmixture = $("#cmixture").val();
			if(cmixture==''){
				flag = 1;
				$("#promptcmixture").text("不得为空");
				return false;	
			}else{
				$("#promptcmixture").text("");
			}
			
			var cweight = $("#cweight").val();
			if(cweight==''){
				flag = 1;
				$("#promptcweight").text("不得为空");	
				return false;
			}else{
				$("#promptcweight").text("");
			}
			
			var cstockway = $("#cstockway").val();
			if(cstockway==''){
				flag = 1;
				$("#promptcstockway").text("不得为空");
				return false;
			}else{
				$("#promptcstockway").text("");
			}
			
			var cfood = $("#cfood").val();
			if(cfood==''){
				flag = 1;
				$("#promptcfood").text("不得为空");
				return false;
			}else{
				$("#promptcfood").text("");
			}
			
			var cproduct = $("#cproduct").val();
			if(cproduct==''){
				flag = 1;
				$("#promptcproduct").text("不得为空");
				return false;
			}else{
				$("#promptcproduct").text("");
			}
			
			var cfactoryname = $("#cfactoryname").val();
			if (cfactoryname=='') {
				flag = 1;
				$("#promptcfactoryname").text("不得为空");
				return false;
			}else{
				$("#promptcfactoryname").text("");
			}
			
			var cproductaddress = $("#cproductaddress").val();
			if(cproductaddress==''){
				flag = 1;
				$("#promptcproductaddress").text("不得为空");
				return false;
			}else{
				$("#promptcproductaddress").text("");
			}
			
			var cstock = $("#cstock").val();
			if(cstock==''){
				flag = 1;
				$("#promptcstock").text("不得为空");
				return false;
			}else{
				$("#promptcstock").text("");
			}
			
			var commUnit = $("#commUnit").val();
			var commUnitoption = $("#commUnit option:selected").val();
			alert(commUnitoption);
			if(commUnitoption==1){
				if(commUnit==''){
					$("#promptcommUnit").text("");
				}
			}
			if(commUnitoption==0){
				if(commUnit==''){
					flag = 1;
					$("#promptcommUnit").text("不得为空");
					return false;
				}
				var cperbox = $("#cperbox").val();
				if(cperbox==''){
					flag = 1;
					$("#promptcperbox").text("不得为空");
					return false;
				}else{
					$("#promptcperbox").text("");
				}
			}
			
			
			
			var cprice = $("#cprice").val();
			if(cprice==''){
				flag = 1;
				$("#promptcprice").text("不得为空");
				return false;
			}else{
				$("#promptcprice").text("");
			}
			
			var cperweight = $("#cperweight").val();
			if(cperweight==''){
				flag = 1;
				$("#promptcperweight").text("不得为空");
				return false;
			}else{
				$("#promptcperweight").text("");
			}
			
			var uploadfile = $("#uploadfile").val();
			alert(uploadfile);
			if (uploadfile=='') {
				flag = 1;
				$("#promptuploadfile").text("需至少上传一张图片");
				return false;
			}else if (uploadfile!='') {
				$("#promptuploadfile").text("");
			}
			if(flag == 1){
				$("#promptallsub").text("带*的选项务必填写");
				return false;
			}else if(flag == 0){
				return true;
			}
		}
	</script>
	<script type="text/javascript">
		j = 1;
		$(document)
				.ready(
						function() {
							$("#btn_add2")
									.click(
											function() {
												document
														.getElementById("newUpload2").innerHTML += '<div id="div_'+j+'"><dd style="height:80px;"><span></span><input  name="myfile" type="file" style="margin-left:126px;"  /><input type="button"  style="width: 35px; height: 35px;margin:6px 0px 50px 126px;" value="删除"  onclick="del_2('
														+ j + ')"/></dd></div>';
												j = j + 1;
											});
						});
		function del_2(o) {
			document.getElementById("newUpload2").removeChild(
					document.getElementById("div_" + o));
		}
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
		$(document).ready(function(){
			$("#noIsSpecial").click(function(){
				$("#special").val("");
				$("#special").hide();
			});
			$("#isSpecial").click(function(){
				$("#special").show();
			});
			$("#shelvesFalse").click(function(){
				$("#special").val("");
				$("#checkShow").hide();
			});
			$("#shelvesTrue").click(function(){
				$("#checkShow").show();
			});
			
		});
		
		function addLanguage(obj) {		
			var dd=document.getElementById("new"); 
			if(obj.checked){				 
				dd.style.display='block'; 
			}else{
				dd.style.display='none';
			}
		}
// 		function shopcateOne(obj) {
// 			var Code = obj.value;
// 			alert(Code);
// 			var shopcateTwo = document.getElementById('shopcateTwo');
// 			var num = shopcateTwo.options.length;
// 			for (i = num - 1; i >= 0; i--) {
//  				shopcateTwo.remove(i);
//  			}
// 			var shopcateThree = document.getElementById('shopcateThree');
// 			var num = shopcateThree.options.length;
// 			for (i = num - 1; i >= 0; i--) {
// 				shopcateThree.remove(i);
// 			}
// 			var objOption = new Option("----请选择----", -1);
// 			shopcateTwo.options[shopcateTwo.options.length] = objOption;
// 			var objOptionT = new Option("----请选择----", -1);
// 			shopcateThree.options[shopcateThree.options.length] = objOptionT;
// 			<c:forEach items="${list2 }" var="leiBieTwo">
// 				if ('${leiBieTwo.parentLevel.categoryID }' == Code) {
// 					alert('${leiBieTwo.parentLevel.categoryID }');
// 					var objOption = new Option("${leiBieTwo.category }",'${leiBieTwo.categoryID}');
// 					shopcateThree.options[shopcateTwo.options.length] = objOption;
// 				}
// 			</c:forEach>
// 		}
		
		function shopcateOne(obj) {
			var Code = obj.value;
			var shopcateTwo = document.getElementById('shopcateTwo');
			var num = shopcateTwo.options.length;
			var shopcateThree = document.getElementById('shopcateThree');
			var num = shopcateThree.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateThree.remove(i);
			}
			var objOptionT = new Option("----请选择----", -1);
			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			<c:forEach items="${list2 }" var="leiBieTwo">
				if ('${leiBieTwo.parentLevel.categoryID }' == Code) {
					//alert(Code+":"+'${leiBieTwo.parentLevel.categoryID }'+'${leiBieTwo.category}');
					var objOption = new Option("${leiBieTwo.category}",'${leiBieTwo.categoryID}');
					shopcateThree.options[shopcateThree.options.length] = objOption;
				}
			</c:forEach>
		}
		
		function shopcate(obj) {
			var language = $("#language").val();
			var Code = obj.value;
			var shopcateThree = document.getElementById('shopcateThree');
			var num = shopcateThree.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateThree.remove(i);
			}
			var objOptionT = new Option("----请选择----", -1);
			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			<c:forEach items="${shopCategory }" var="leiBieThree">
			if ('${leiBieThree.parentLevel.categoryID }' == Code
					&& '${leiBieThree.level}' == 3) {
				if ( language == "chinese" ) {
					var objOption = new Option("${leiBieThree.category }",
					'${leiBieThree.categoryID}');
				} else if ( language == "russina" ) {
					var objOption = new Option("${leiBieThree.russinaCategory }",
					'${leiBieThree.categoryID}');
				}				
				shopcateThree.options[shopcateThree.options.length] = objOption;
			}
			</c:forEach>
		}
		function shopBrand(obj) {
			var Code = obj.value;
			jQuery
			.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : './getSpecific?ids=' + Code,
				dataType : 'json',
				success : function(data) {
					$('#guige').empty();
					$('#guize').val("");
					if (data && data.success == "true") {
						var $guige = "";
						$.each(data.spec,function(i, item) {
											var gui = item.attribute
													.split(',');
											var d = "";
											for (var j = 0; j < gui.length; j++) {
												d = d
														+ "<option value='"+gui[j]+"'>"
														+ gui[j]
														+ "</option>";
											}
											$guige = $guige
													+ "<dd><span id='"+i+"'>"
													+ item.specificatName
													+ "</span><select onchange='guigechange(this,"
													+ i
													+ ");'  name='' style='height:35px; width:303px; border:1px solid #ccc; margin-left: 7px'><option value='-1'>----请选择----</option>"
													+ d
													+ "</select></dd>";
										});
					}
					$('#guige').append($guige);
				}
			});
		}
		function guigechange(obj, id) {
			var gui = $('#' + id).html();
			if(gui == '颜色'){
				$('#yanse').remove();
				var $guige ="<dd id='yanse'><span>该颜色商品照片</span><input type='file' name='yanse' /></dd>";
				$('#guige').append($guige);
			}
			var ze = obj.value;
			var guizes = $('#guize').val();
			var guize = guizes.split(',');
			var isok = false;
			var str = "";
			for (var i = 1; i < guize.length; i++) {
				if (guize[i].split('-')[0] == gui) {
					if (ze != '-1') {
						guize[i] = gui + '-' + ze;
						str = str + "," + guize[i];
					} else {
						guize[i] = "";
						str = str + guize[i];
					}
					isok = true;
				} else {
					str = str + "," + guize[i];
				}
			}
			if (isok) {
				$('#guize').val(str);
			} else {
				guizes = guizes + "," + gui + "-" + ze;
				$('#guize').val(guizes);
			}
		}
	</script>
	<div class="clear"></div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
