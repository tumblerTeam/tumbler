// JavaScript Document
function qhdiv(ida,idb){
					document.getElementsByClassName(ida).item(0).style.backgroundColor="#f5f5f5";
					document.getElementsByClassName(ida).item(0).style.borderBottom="1px solid #f5f5f5";
					var div=document.getElementById(ida);
					div.style.display="block";
					document.getElementsByClassName(idb).item(0).style.backgroundColor="#fff";
					document.getElementsByClassName(idb).item(0).style.borderBottom="1px solid #ccc";
					var div=document.getElementById(idb);
					div.style.display="none";
					}
function tiaozhuan(id){
	location.href="login.html#id="+id;
	}