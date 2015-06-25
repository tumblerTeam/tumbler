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
<!--<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>-->
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
        	<h2>企业免费开店</h2>
            <div class="box">
            	<form action="<%=path%>/proscenium/setupCompanyShop" method="post" enctype="multipart/form-data">
                        *企业名称：<input name="cname" style="width:150px; height:25px; margin-left:65px;"  /> <br />	
                        *所在地：<select name="province" style="margin-left:80px;">
                        		<option>---</option>
                        		<option>四川</option>
                                <option>新疆</option>
                                <option>北京</option>
                             </select>
                             <select name="city">
                             	<option>---</option>
                        		<option>广元</option>
                                <option>成都</option>
                                <option>乌鲁木齐</option>
                             </select>
                             <select name="area">
                             	<option>---</option>
                        		<option>青羊区</option>
                                <option>武侯区</option>
                                <option>新市区</option>
                             </select><br />
                        	  <div class="file-box"> 
                          		   *申请人身份证 ：<input name="idCard" type="text" name="idCard"/>
                          		   <input type="file" name="myfile" id="required" />
                                    <br/>
						      </div>
						      <div class="file-box"> 
                                   *公司营业执照：<input type="file" name="myfile" id="required" /> 
						      </div>
						      <div class="file-box"> 
                                   *授权委托书：<input type="file" name="myfile" id="required" /> 
						      </div>
                              <div class="file-box"> 
                                   *食品流通许可证：<input type="file" name="myfile" id="required" /> 
						      </div>
                              <div class="file-box"> 
                                   *税务登记证：<input type="file" name="myfile" id="required" /> 
						      </div>
                              <div class="file-box"> 
                              	<label>厂商：</label>
                                   *生产经营许可证：<input type="file" name="myfile" id="required" /><br>
                                   *国家 Q S 认证：<input type="file" name="myfile" id="required" />
						      </div>
						      <div class="file-box"> 
                              	<label>批发：</label>
                                   *自治区酒类批发许可证：<input type="file" name="myfile" id="required" /><br>
                                   *酒类经销合同（图片）：<input type="file" name="myfile" id="required" /><br>
                                   *经销授权书（图片）：<input type="file" name="myfile" id="required" />
						      </div>
						      <div class="file-box"> 
                              	<label>零售：</label>
                                   *酒类经营许可证：<input type="file" name="myfile" id="required" /><br>
                                   *零售备案登记证：<input type="file" name="myfile" id="required" />
						      </div>    
                             <button class="sq">申请开店</button>    
                    </form>
                    
            </div>
        </div>
      
      <!--中间结束-->  
    </div>
</div>
<!--脚部-->
<jsp:include page="setupShopCommons/footer.jsp"/>

</body>
</html>
