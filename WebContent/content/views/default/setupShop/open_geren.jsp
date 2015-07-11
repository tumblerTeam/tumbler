<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>不倒翁首页</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<link rel="stylesheet" type="text/css" href="content/static/css/datetime/jquery.mobile.flatui.css">
<link rel="stylesheet" type="text/css" href="content/static/js/datetime/jquery.mobile-1.4.0-rc.1.js">
<script type="text/javascript" src="content/static/js/datetime/jquery.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jsAddress.js"></script>
<script>
	function f1(div1,div2){
		if(div2.style.display=="none"){
			div2.style.display="block";
			}else{
				 div2.style.display="none";
			}
		}
</script>
<style type="text/css">
	#inputs{
		margin:20px 0px 0px 1px;
	}
</style>

</head>

<body>
<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        <!--中间开始-->
        
        <div class="bread" >
        	<div class="left1"><a href="open.html">我是卖家</a> < 我要开店</div>
            <a href="#"><span class="right1">开店帮助</span></a>
        </div>
                
        <div class="geren" style="font-size: 12px;">
        	<h2>个人免费开店</h2>
            <div class="box">
            	<form id="form1" action = "<%=path%>/proscenium/setupPeronShop" onsubmit="return validation();" enctype="multipart/form-data" method="post"> 
                        <label style="color: red;">*</label>
                        	姓名：<input id="uname" name="name" style="width:150px; height:25px; margin-left:75px;"  />
                        	<label style="color: red;" id="promptUname"></label>
							<br />
                        <label style="color: red;">*</label>性别：
                        <input name="sex" value="1" type="radio" style="margin-left:80px;"/> 男
                       	<input name="sex" value="0" type="radio"/> 女
                       	<label style="color: red;" id="promptSex"></label>
                        <br />
                        <label style="color: red;">*</label>
                        	出生年月：<input id="birthday" type="date" name="birthday"/>
                        	<label style="color: red;" id="promptBirthday"></label>
                        <br />	 
                        <div>  
                        <label style="color: red;">*</label>居住地：
						 <select id="cmbProvince" name="cmbProvince"></select>
						<label style="margin:0px 10px 0px 1px;">省</label> 
						  <select id="cmbCity" name="cmbCity"></select>
						  <label style="margin:0px 10px 0px 1px;">市</label>
						<select id="cmbArea" name="cmbArea"></select>
						<label style="margin:0px 10px 0px 1px;">区</label>
						<br>
						<script type="text/javascript">
							addressInit('cmbProvince', 'cmbCity', 'cmbArea', '新疆', '乌鲁木齐市', '新市区');
						</script>
					</div>
                        	 
                              <div class="file-box" style="width:700px;"> 
                             		   <label style="color: red;">*</label>
                             		   身  份  证 ：<input id="idcard" onchange="checkIdcard(this);" style="margin-left: 50px;" type="text" name="idCard"/>
                             		    <span><input id="idcardFile" onchange="checkFileSize(this,'promptIdcardFile');" type="file" name="myfile" id="required" /></span>
                        				<label style="color: red;" id="promptIdcardFile"></label>
                        				<br/><label style="color: red;" id="promptIdcard"></label>
                                      	<br />
						      </div>
						      <div class="file-box" style="width:700px;"> 
                                   <label style="color: red;">*</label>
                                   	食品流通许可证：<input id="foodCriLis" style="margin-left: 18px;" type="text" name="foodCriLis"/>
                                   <span><input id="liutongFile" type="file" onchange="checkFileSize(this,'promptLiutong');" name="myfile" id="required" /></span>
                                   <label style="color: red;" id="promptLiutong"></label>
						      </div>
                              <div class="file-box" style="width:700px;"> 
                                   <label style="color: red;">*</label>
                                   	税务登记证：<input id="taxReg" style="margin-left: 50px;" type="text" name="taxReg"/>
                                   <span><input id="taxRegFile" type="file" onchange="checkFileSize(this,'promptTaxReg');" name="myfile" id="required" /></span>
                                   <label style="color: red;" id="promptTaxReg"></label>
						      </div>
                             <input id="applyShop" class="sq" type="submit" value="申请开店"/>   
                    </form>
            </div>
        </div>
        <script type="text/javascript">
        	function validation(){
        		var flag=0;
        		var uname = $("#uname").val();
        		var sex = $("input:radio[name=sex]:checked").val();
        		var birthday = $("#birthday").val();
        		var idcard = $("#idcard").val();
        		var idcardFile = $("#idcardFile").val();
        		var liutongFile = $("#liutongFile").val();
        		var taxRegFile = $("#taxRegFile").val();
        		
        		var promptUname = $("#promptUname");
        		var promptSex = $("#promptSex");
        		var promptBirthday = $("#promptBirthday");
        		var promptIdcard = $("#promptIdcard");
        		var promptIdcardFile = $("#promptIdcardFile");
        		var promptLiutong = $("#promptLiutong");
        		var promptTaxReg = $("#promptTaxReg");
        		
        		if (uname=='') {
        			flag=1;
        			promptUname.text("姓名不得为空");
				}else if(uname!=''){
					promptUname.text("");
				}
        		if(sex==null){
        			flag=1;
        			promptSex.text("请选择性别");
        		}else if(sex!=null){
        			promptSex.text("");
        		}
        		if(birthday==''){
        			flag=1;
        			promptBirthday.text("出生年月不得为空");
        		}else if(birthday!=''){
        			promptBirthday.text("");
        		}
        		//身份证验证
          		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
          		if(reg.test(idcard)==false){
          			flag=1;
          			promptIdcard.text("身份证输入信息有误");
          			return false;
          		}else if(reg.test(idcard)){
          			promptIdcard.text("");
          		}
          		//验证身份证是否存在
          		$.ajax({
          			type:'GET',
          			contentType:'application/json',
          			url:'proscenium/checkIdCard?idcard='+idcard,
          			dataType:'json',
          			success:function(data){
          				if(data.success=='false'){
          					flag = 1;
          					promptIdcard.text("该身份证号已经注册店铺,不能再次注册");
          					return false;
          				}if(data.success=='true'){
          					promptIdcard.text("恭喜你,该身份证号可用");
          				}
          			}
          		});
          		getFileValid(idcardFile,promptIdcardFile);
          		getFileValid(liutongFile,promptLiutong);
          		getFileValid(taxRegFile,promptTaxReg);
          		
          		function getFileValid(obj,prompt){
              		//验证图片为jpg,jpeg,bmp
        			var idCardFileLast = obj.substr(obj.lastIndexOf(".")).toLowerCase();
          		  	if(!(idCardFileLast=='.png'||idCardFileLast=='.jpg'||idCardFileLast=='jpeg')){
          		  		prompt.text("照片有误,后缀名为png/jpg/jpeg格式");
          		  		flag=1;
          		  		return false;
          		  	}else if((idCardFileLast=='.png'||idCardFileLast=='.jpg'||idCardFileLast=='jpeg')){
          		  		prompt.text("");
          		  	}
              	}
          		if (flag==0) {
					return true;
				}else{
					return false;
				}
        		
        	}
        	
        	//onchange:验证身份证：
        	function checkIdcard(obj){
        		var promptIdcard = $("#promptIdcard");
        		//验证身份证是否存在
          		$.ajax({
          			type:'GET',
          			contentType:'application/json',
          			url:'proscenium/checkIdCard?idcard='+obj.value,
          			dataType:'json',
          			success:function(data){
          				if(data.success=='false'){
          					promptIdcard.text("该身份证号已经注册店铺,不能再次注册");
          					return false;
          				}if(data.success=='true'){
          					promptIdcard.text("恭喜你,该身份证号可用");
          				}
          			}
          		});
        	}
        	
        	//验证文件大小：
        	function checkFileSize(obj,prompt){
        		if(obj.files[0].size/1024>1024){
            		$("#"+prompt).text("大小不要超过1M");
        		}else if(obj.files[0].size/1024<1024){
        			$("#"+prompt).text("");
        		}
        	}
        	
        </script>
      
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
