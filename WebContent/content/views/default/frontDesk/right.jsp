<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "侧端展示"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
//         				   alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='侧端推荐店铺A1'){
        					   $("#Adv_R1").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐店铺A2'){
        					    $("#Adv_R2").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐店铺A3'){
        					    $("#Adv_R3").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐店铺A4'){
        					    $("#Adv_R4").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐单品A1'){
                          	    $("#Adv_R5").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐单品A2'){
        					    $("#Adv_R6").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐单品A3'){
        					    $("#Adv_R7").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }else if(item.adverDistribution.position=='侧端推荐单品A4'){
        					    $("#Adv_R8").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" /></a>");
        				   }
 
           			   });
           		   });
            });
 </script>
<div class="personal_right">
	<div class="shop">
        	<div class="tuijian">推荐店铺</div>
                <div class="shop_class" id="Adv_R1">
                 </div>
            <hr />
               <div class="shop_class" id="Adv_R2">
                </div>
            <hr />
           <div class="shop_class" id="Adv_R3">
                </div>
            <hr />
            <div class="shop_class" id="Adv_R4">
             </div>
            
   </div>
   <div class="product">
        	<div class="tuijian" style=" margin-bottom:20px;">为你推荐</div>
                 <div class="shop_class" id="Adv_R5">
                </div>
            <hr />
                 <div class="shop_class" id="Adv_R6">
                </div>
            <hr />
                <div class="shop_class" id="Adv_R7">
                </div>
            <hr />
                 <div class="shop_class" id="Adv_R8">
                </div>
     </div>
 </div>
