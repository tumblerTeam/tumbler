<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>不倒翁会员注册</title>

<link href="../content/static/css/bootstrap/bootstrap.css"
	rel="stylesheet">

<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="../content/static/img/favicon.png">

<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="../content/static/js/lib/scripts.js"></script>

<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<style>
.frred {
	color: #FF0000;
	font-size: 12px;
}

.frbule {
	color: #0066CC;
	font-size: 12px;
}

.fgren {
	color: #339933;
	font-size: 12px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<br> <br>
				</div>
				<div class="row clearfix">
					<div class="col-md-3 column"></div>
					<div class="col-md-6 column">
						<form class="form-horizontal" action="../user/regist"
							method="POST">
							<div class="form-group" style="text-align: center;">
								<label><font style="font-size: 40px;">用户注册</font> </label> <br>
								<br>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label"><a
									class="frred">*</a>昵称</label>
								<div class="col-sm-10">
									<input type="text" name="userName" class="form-control"
										id="inputEmail3" onblur="checkformname()"> <span
										id="sname" class="frbule">输入至少2位用户名</span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword4" class="col-sm-2 control-label"><a
									class="frred">*</a>登录名</label>
								<div class="col-sm-6">
									<input id="mobile" class="form-control" name="mobile" placeholder="输入手机号码" type="text" size="25" /> 
								</div>
								<div class="col-sm-4">
									<input class="form-control" id="zphone" type="button" value=" 发送手机验证码 " onClick="get_mobile_code();">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword4" class="col-sm-2 control-label"><a
									class="frred">*</a>验证码</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" size="8" name="mobile_code" class="inputBg" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label"><a
									class="frred">*</a>密码 </label>
								<div class="col-sm-10">
									<input type="password" name="password1" class="form-control"
										id="inputPassword3" onblur="checkpwd()"><span
										id="spwd" class="frbule"> 请输入至少6为密码</span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword4" class="col-sm-2 control-label"><a
									class="frred">*</a>确认密码</label>
								<div class="col-sm-10">
									<input type="password" name="password" class="form-control"
										id="inputPassword4" onblur="rcheckpwd()"><span
										id="srpwd" class="frbule"> 请输入重复密码</span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10"
									style="text-align: center;">
									<button type="submit" class="btn btn-default">注册</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-default"
										onclick="cancel()">取消</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-3 column"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function dateInfoxxx(obj) {
			var date = obj;
			$('#' + date).datetimepicker({
				lang : 'ch',
				timepicker : false,
				format : 'Y-m-d',
				formatDate : 'Y-m-d',
			});
		}
		function cancel() {
			window.location.href = "../login?backurl="
					+ window.location.href;
		}
		function checkformname() {
			var fname = document.getElementById("inputEmail3");
			var ftname = document.getElementById("sname");
			if (fname.value == ""
					|| fname.value.length<2||fname.value.length>10) {
				ftname.className = "frred";
				fname.focus();
				ftname.innerHTML = "× 请输入2-10位用户名，可包含数字、字母、下划线";
			} else {
				ftname.className = "fgren";
				ftname.innerHTML = "√用户名可用!";
			}
		}
		function checkpwd() {
			var fpwd = document.getElementById("inputPassword3");
			var ftpwd = document.getElementById("spwd");
			if (fpwd.value == "" || fpwd.value.length<6||fpwd.value.length>20) {
				ftpwd.className = "frred";
				fpwd.focus();
				ftpwd.innerHTML = "× 请输入6-20位用户密码！";
			} else {
				ftpwd.className = "fgren";
				ftpwd.innerHTML = "√密码可用！"
			}
		}
		function rcheckpwd() {
			var fpwd = document.getElementById("inputPassword3");
			var frpwd = document.getElementById("inputPassword4");
			var ftrpwd = document.getElementById("srpwd");
			if (frpwd.value == "") {
				ftrpwd.className = "frred";
				frpwd.focus();
				ftrpwd.innerHTML = "× 请输入您的重复密码！"
			} else {
				if (frpwd.value != fpwd.value) {
					ftrpwd.className = "frred";
					fpwd.focus();
					ftrpwd.innerHTML = "× 俩次密码输入不一致，请重新输入！";
				} else {
					ftrpwd.className = "fgren";
					ftrpwd.innerHTML = " √ 密码输入正确"
				}
			}
		}
	</script>
		
<script language="javascript">
	function get_mobile_code(){
		alert('../getDo?mobile='+jQuery.trim($('#mobile').val()));
		$.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : '../verification/smsVerification?mobile='+jQuery.trim($('#mobile').val()),
			dataType : 'json',
			success : function(msg) {
				if(msg.name=='提交成功'){
					RemainTime();
				}
			}
		});
	};
	var iTime = 59;
	var Account;
	function RemainTime(){
		document.getElementById('zphone').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60)
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "分" + iSecond + "秒";
				}else{
					sSecond = iSecond + "秒";
				}
			}
			sTime=sSecond;
			if(iTime==0){
				clearTimeout(Account);
				sTime='获取手机验证码';
				iTime = 59;
				document.getElementById('zphone').disabled = false;
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('zphone').value = sTime;
	}
</script>
</body>
</html>
