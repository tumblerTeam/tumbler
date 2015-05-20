<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div  style="top:0; right:0;position:fixed; width:75px; height:100%;">
  <div class="mui-mbar-tabs">
    <div class="button_gnj" id="button_gnj"> <!--功能键按钮-->
      <li><img src="content/static/images/gnj.png" /></li>
    </div>
    <div class="quick_link_mian">
      <div class="quick_links_panel" >
        <div id="quick_links" class="quick_links"><!--所有产品-->
          <li > <img src="content/static/images/sy_arw.jpg" width="110%" style="margin-top:200%;" />
            <div class="ibar_login_box status_login">
              <div class="status_login">
                <ul class="user_info">
                  <li> 
					<c:forEach items="${brands }" var="brand">
					<a href="getXiLie?id=${brand.id }">${brand.departmentname }</a>
					</c:forEach>
				</li>
                </ul>
              </div>
            </div>
          </li>
        </div>
        <div class="quick_weixin_toggle">
        <ul>
          <li id="div2" style="top:75px;"> <!--微信扫码--> 
            <img src="content/static/images/weixin.jpg" />
            <div class="mp_qrcode">
            <img src="content/static/images/weixin_code_145.png"/></div>
          </li>
          
          <li class="language" id="div3" onmouseover="f1()" onmouseout="f2()" style="top:150px;"><!--语言选择id="div3"--> 
          	<img id="yy" src="content/static/images/yy.jpg" onclick="langage();"/>
          	<img id="yy_xz" src="content/static/images/yy_xz.jpg" style="display:none;" onclick="langage();"/>
          </li>
          
          <li id="div4" style="z-index:99999;top:150px;"> <!--联系电话<--> 
            <img src="content/static/images/call.jpg" />
            <div class="mp_tooltip">咨询热线：181609204</div>
          </li>
        </ul> 
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	function langage(){
		location.href = "getLanguage";
	}
	function f1(){
		var d1=document.getElementById("yy");
		var d2=document.getElementById("yy_xz");
		d2.style.display="inline";
		d1.style.display="none";	
	}
	function f2(){
		var d1=document.getElementById("yy");
		var d2=document.getElementById("yy_xz");
		d2.style.display="none";
		d1.style.display="block";
	}
</script>