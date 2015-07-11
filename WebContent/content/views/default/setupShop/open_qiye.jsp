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
</head>

<body>
<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        <!--中间开始-->        
        <div class="bread">
        	<div class="left1"><a href="open.html">我是卖家</a> < 我要开店</div>
            <a href="#"><span class="right1">开店帮助</span></a>
        </div>
        <div class="geren" style="font-size: 12px;">
        	<h2>企业免费开店</h2>
            <div class="box">
            	<form action="<%=path%>/proscenium/setupCompanyShop" onsubmit="return validateCompany();" method="post" enctype="multipart/form-data">
                        <label style="color: red;">*</label>企业名称：<input id="cname" name="cname" style="width:150px; height:25px; margin-left:65px;"  />
                        <label style="color: red;" id="promptComName"></label>
                        <br />	
                        <div>  
                        <label style="color: red;">*</label>居住地：
						 <select id="cmbProvince" name="cmbProvince"></select>
						 <label style="margin:0px 10px 0px 2px;">省</label>
						 <select id="cmbCity" name="cmbCity"></select>
						 <label style="margin:0px 10px 0px 2px;">市</label>
						<select id="cmbArea" name="cmbArea"></select>
						 <label style="margin:0px 10px 0px 2px;">区</label><br>
						<script type="text/javascript">
							addressInit('cmbProvince', 'cmbCity', 'cmbArea', '新疆', '乌鲁木齐市', '新市区');
						</script> 
					</div>
                        	  <div class="file-box"> 
                          		   <label style="color: red;">*</label>申请人身份证 ：<input name="idCard" type="text" id="idCard" onchange="checkIdCard(this);"/>
                          		   <input onchange="checkFileSize(this,'promptIdCardFile');" type="file" name="myfile" id="idCardFile"/>
                                    <br/>
                          		   <label style="color: red;" id="promptIdCard"></label>
                          		   <label style="margin-left:250px;color: red;" id="promptIdCardFile"></label>
						      </div>
						      <div class="file-box"> 
                                   <label style="color: red;">*</label>
                                   	公司营业执照：<input onchange="checkFileSize(this,'promptYingyeFile');" type="file" name="myfile" id="yingyeFile"/> 
                          		   <label style="color: red;" id="promptYingyeFile"></label>
						      </div>
						      <div class="file-box"> 
                                   <label style="color: red;">*</label>
                                   	授权委托书：<input onchange="checkFileSize(this,'promptWeituoFile');" type="file" name="myfile" id="weituoFile" /> 
                                   <label style="color: red;" id="promptWeituoFile"></label>
						      </div>
                              <div class="file-box"> 
                                   <label style="color: red;">*</label>
                                   	食品流通许可证：<input onchange="checkFileSize(this,'promptLiutongFile');" type="file" name="myfile" id="liutongFile" /> 
                                   <label style="color: red;" id="promptLiutongFile"></label>
						      </div>
                              <div class="file-box"> 
                                   <label style="color: red;">*</label>
                                   	税务登记证：<input onchange="checkFileSize(this,'promptTaxRegFile');" type="file" name="myfile" id="taxRegFile" /> 
                                   <label style="color: red;" id="promptTaxRegFile"></label>
						      </div>
						      请选择您的类型：<select onchange="selected(this);" name="PY_type" id="thisSelect">
						      		<option id="cs" value="1">厂商</option>
						      		<option id="pf" value="2">批发</option>
						      		<option id="ls" value="3">零售</option>
						      	</select>
						      	<script type="text/javascript">
							      	function selected(objSelect){
							      		var thisValue = document.getElementById("thisSelect").value;
							      		if(thisValue==1){
							      			document.getElementById("div1").style.display="";
							      			document.getElementById("div2").style.display="none";
							      			document.getElementById("div3").style.display="none";
							      		}if(thisValue==2){
							      			document.getElementById("div2").style.display="";
							      			document.getElementById("div1").style.display="none";
							      			document.getElementById("div3").style.display="none";
							      		}if(thisValue==3){
							      			document.getElementById("div3").style.display="";
							      			document.getElementById("div2").style.display="none";
							      			document.getElementById("div1").style.display="none";
							      		}
							      	}
						      	</script>
                              <div class="file-box" id="div1"> 
                                   <label style="color: red;">*</label>
                                   	生产经营许可证：<input onchange="checkFileSize(this,'promptJingyingPerFile');" type="file" name="myfile" id="jingyingPerFile" />
                                   <label style="color: red;" id="promptJingyingPerFile"></label>
                                   <br>
                                   <label style="color: red;">*</label>
                                   	国家 Q S 认证：<input onchange="checkFileSize(this,'promptQSFile');" type="file" name="myfile" id="QSFile" />
                                   <label style="color: red;" id="promptQSFile"></label>
						      </div>
						      <div style="display: none;" class="file-box" id="div2"> 
                                   <label style="color: red;">*</label>
                                   	自治区酒类批发许可证：<input onchange="checkFileSize(this,'promptAlcoholPerFile');" type="file" name="myfile" id="alcoholPerFile" />
                                   <label style="color: red;" id="promptAlcoholPerFile"></label>
                                   <br>
                                   <label style="color: red;">*</label>
                                   	酒类经销合同（图片）：<input onchange="checkFileSize(this,'promptJingxiaoFile');" type="file" name="myfile" id="jingxiaoFile" />
                                   <label style="color: red;" id="promptJingxiaoFile"></label>
                                   <br>
                                   <label style="color: red;">*</label>
                                   	经销授权书（图片）：<input onchange="checkFileSize(this,'promptShouquanFile');" type="file" name="myfile" id="shouquanFile" />
                                   <label style="color: red;" id="promptShouquanFile"></label>
						      </div>
						      <div style="display: none;" class="file-box" id="div3">
                                   <label style="color: red;">*</label>
                                   	酒类经营许可证：<input onchange="checkFileSize(this,'promptAlcoJingyingPerFile');" type="file" name="myfile" id="alcoJingyingPerFile" />
                                   <label style="color: red;" id="promptAlcoJingyingPerFile"></label>
                                   <br>
                                   <label style="color: red;">*</label>
                                   	零售备案登记证：<input onchange="checkFileSize(this,'promptBeianRegFile');" type="file" name="myfile" id="beianRegFile" />
                                   <label style="color: red;" id="promptBeianRegFile"></label>
						      </div>
                             <button class="sq">申请开店</button>   
                    </form>
            </div>
        </div>
      <script type="text/javascript">
      	function validateCompany(obj){
      		var flag = 0;
      		var comName = $("#cname").val();
      		var idCard = $("#idCard").val();
      		var idCardFile = $("#idCardFile").val();
      		var yingyeFile = $("#yingyeFile").val();
      		var weituoFile = $("#weituoFile").val();
      		var liutongFile = $("#liutongFile").val();
      		var taxRegFile = $("#taxRegFile").val();
      		var jingyingPerFile = $("#jingyingPerFile").val();
      		var QSFile = $("#QSFile").val();
      		var alcoholPerFile = $("#alcoholPerFile").val();
      		var jingxiaoFile = $("#jingxiaoFile").val();
      		var shouquanFile = $("#shouquanFile").val();
      		var alcoJingyingPerFile = $("#alcoJingyingPerFile").val();
      		var beianRegFile = $("#beianRegFile").val();
      		var thisSelect = $("#thisSelect option:selected").val();
      		
      		var promptComName = $("#promptComName");
      		var promptIdCard = $("#promptIdCard");
      		var promptIdCardFile = $("#promptIdCardFile");
      		var promptYingyeFile = $("#promptYingyeFile");
      		var promptWeituoFile = $("#promptWeituoFile");
      		var promptLiutongFile = $("#promptLiutongFile");
      		var promptTaxRegFile = $("#promptTaxRegFile");
      		var promptJingyingPerFile = $("#promptJingyingPerFile");
      		var promptQSFile = $("#promptQSFile");
      		var promptAlcoholPerFile = $("#promptAlcoholPerFile");
      		var promptJingxiaoFile = $("#promptJingxiaoFile");
      		var promptShouquanFile = $("#promptShouquanFile");
      		var promptAlcoJingyingPerFile = $("#promptAlcoJingyingPerFile");
      		var promptBeianRegFile = $("#promptBeianRegFile");

      		if(comName==''){
          		promptComName.text("企业名称不得为空");
          		return false;
      		}else if(comName!=''){
          		promptComName.text("");
      		}
      		//身份证验证
      		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
      		if(reg.test(idCard)==false){
      			promptIdCard.text("身份证输入信息有误");
      			return false;
      		}else if(reg.test(idCard)){
      			promptIdCard.text("");
      		}
      		//验证身份证是否存在
      		$.ajax({
      			type:'GET',
      			contentType:'application/json',
      			url:'proscenium/checkIdCard?idcard='+idCard,
      			dataType:'json',
      			success:function(data){
      				if(data.success=='false'){
      					flag = 1;
      					promptIdCard.text("该身份证号已经注册店铺,不能再次注册");
      					return false;
      				}if(data.success=='true'){
      					promptIdCard.text("恭喜你,该身份证号可用");
      				}
      			}
      		});
      		var f = 0;
      		getFileValid(idCardFile,promptIdCardFile);
      		getFileValid(yingyeFile,promptYingyeFile);
      		getFileValid(weituoFile,promptWeituoFile);
      		getFileValid(liutongFile,promptLiutongFile);
      		getFileValid(taxRegFile,promptTaxRegFile);

      		if(thisSelect==1){//厂商：生产经营许可证、QS
          		getFileValid(jingyingPerFile,promptJingyingPerFile);
          		getFileValid(QSFile,promptQSFile);
      		}if(thisSelect==2){//批发：
          		getFileValid(alcoholPerFile,promptAlcoholPerFile);
          		getFileValid(jingxiaoFile,promptJingxiaoFile);
          		getFileValid(shouquanFile,promptShouquanFile);
      		}if(thisSelect==3){//零售
          		getFileValid(alcoJingyingPerFile,promptAlcoJingyingPerFile);
          		getFileValid(beianRegFile,promptBeianRegFile);
      		}
      		
      		function getFileValid(obj,prompt){
          		//验证图片为jpg,jpeg,bmp
    			var idCardFileLast = obj.substr(obj.lastIndexOf(".")).toLowerCase();
      		  	if(!(idCardFileLast=='.png'||idCardFileLast=='.jpg'||idCardFileLast=='jpeg')){
      		  		prompt.text("照片有误,后缀名为png/jpg/jpeg格式");
      		  		f = 1;
      		  		return false;
      		  	}else if((idCardFileLast=='.png'||idCardFileLast=='.jpg'||idCardFileLast=='jpeg')){
      		  		prompt.text("");
      		  	}
          	}
      		if(comName!=''&&reg.test(idCard)&&flag==0&&f==0){
      			return true;
      		}else{
      			return false;
      		}
      	}
      	
      	function checkIdCard(obj){
      		var promptIdCard = $("#promptIdCard");
      		//身份证验证
      		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
      		if(reg.test(obj.value)==false){
      			promptIdCard.text("身份证输入信息有误");
      			return false;
      		}else if(reg.test(idCard)){
      			promptIdCard.text("");
      		}
      		//验证身份证是否存在
      		$.ajax({
      			type:'GET',
      			contentType:'application/json',
      			url:'proscenium/checkIdCard?idcard='+obj.value,
      			dataType:'json',
      			success:function(data){
      				if(data.success=='false'){
      					promptIdCard.text("该身份证号已经注册店铺,不能再次注册");
      				}if(data.success=='true'){
      					promptIdCard.text("恭喜你,该身份证号可用");
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

<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
