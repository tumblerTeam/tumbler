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
<link rel="stylesheet" type="text/css" href="content/static/js/datetime/jquery.js">
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
<!-- 顶部部分 -->
<jsp:include page="setupShopCommons/header.jsp" />
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />
        <!--中间开始-->
        
        <div class="bread" >
        	<div class="left1"><a href="open.html">我是卖家</a> < 我要开店</div>
            <a href="#"><span class="right1">开店帮助</span></a>
        </div>
                
        <div class="geren">
        	<h2>个人免费开店</h2>
            <div class="box">
            	<form id="form1" action = "<%=path%>/proscenium/setupPeronShop" enctype="multipart/form-data" method="post"> 
                        *姓名：<input name="name" style="width:150px; height:25px; margin-left:75px;"  /> <br />
                        *性别：<input name="sex" value="1"type="radio" style="margin-left:80px;"/> 男
                        	  <input name="sex" value="0" type="radio"/> 女<br />
                        *出生年月：<input type="date" name="birthday"/><br />	 
                        <div>  
                        *居住地：
						 省：<select id="cmbProvince" name="cmbProvince"></select> 市：<select id="cmbCity" name="cmbCity"></select>
						区：<select id="cmbArea" name="cmbArea"></select><br>
						<script type="text/javascript">
							addressInit('cmbProvince', 'cmbCity', 'cmbArea', '新疆', '乌鲁木齐市', '新市区');
						</script> 
					</div>
                        	 
                              <div class="file-box" style="width:700px;"> 
                             		   * 身  份  证 ：<input style="margin-left: 50px;" type="text" name="idCard"/>
                             		   <span><input id="inputs" type="file" name="myfile" id="required" /></span>
                                       <br />
						      </div>
						      <div class="file-box" style="width:700px;"> 
                                   *食品流通许可证：<input style="margin-left: 18px;" type="text" name="foodCriLis"/>
                                   <span><input id="inputs" type="file" name="myfile" id="required" /></span> 
						      </div>
                              <div class="file-box" style="width:700px;"> 
                                   *税务登记证：<input style="margin-left: 50px;" type="text" name="taxReg"/>
                                   <span><input id="inputs" type="file" name="myfile" id="required" /></span>
						      </div>
                             <input class="sq" type="submit" onclick="javascript:submits();" value="申请开店"/>   
                    </form>
            </div>
        </div>
        <script type="text/javascript">
        	function submit6(){
        		 var form1 = document.getElementById("form1");
        		form1.submit();
        	}
        </script>
      
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
