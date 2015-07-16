<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<title>驳回开店理由</title>
</head>
<body>
         <form id="formReason" action="./management/addRejectReason" method="post">
             <label for="context">驳回理由：</label>
             <br/>
             <input type="hidden"  id="shopId"  value="${shop.id}" name="shopId">
             <textarea rows="30" cols="80"  id="context" name="context">
             </textarea>
<!--               <input type="submit" value="确认"/> -->
         </form>    
   <button onclick="addMaterial()" >确认</button> 
 <script type="text/javascript"> 
        window.onunload = refreshParent; 
      	function refreshParent() { 
       		window.opener.location.reload();
       	}
       	function addMaterial(){ 
			document.getElementById("formReason").submit(); 
     		return closeAndRefresh();
       	} 
     	function closeAndRefresh() { 
//       		window.onunload = refreshParent; 
       		self.close(); 
     		return true; 
   	} 
       </script>    
             
</body>
</html>