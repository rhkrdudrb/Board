<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
	<!-- 제이쿼리 cnd -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  	<link href="/css/New.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <style>
    .droptarget {
  float: left; 
  width: 300px; 
  height: 500px;
  margin: 15px;
  padding: 10px;
  border: 1px solid #aaaaaa;
}
</style>

  </head>
  <body>
  <div id="app">
 
<!--   <div -->
<!--   		style="left: 40; position: relative;" -->
<!--         class="droptarget" -->
<!--         v-on:drop="drop" -->
<!--         v-on:dragover="allowDrop" -->
<!--       > -->
<!--   <ul class="tree"> -->
<!--   <li> -->
<!--     <input type="checkbox" id="root"> -->
<!--     <label for="root">세연아이넷(주)</label> -->


<!--     <ul> -->
<!--       <li> -->
<!--         <input type="checkbox" id="node2"> -->
<!--         <label for="node2">세일즈마케팅</label> -->
<!--         <ul> -->
<!--           <li class ="drag-elements" -->
<!--       	  v-on:dragstart="dragStart" -->
<!--           v-on:drag="dragging" -->
<!--           draggable="true" -->
<!--           id="dragtarget"> -->
<!--             <input type="checkbox" id="node21"> -->
<!--             <label for="node21" class="lastTree">심** 전무</label> -->
<!--           </li> -->
<!-- 	    </ul> -->
<!-- 	  </li> -->
<!-- 	</ul> -->

<!-- </div> -->
<!--       <div -->
<!--       	style="left: 100; position: relative;" -->
<!--         class="droptarget" -->
<!--         v-on:drop="drop" -->
<!--         v-on:dragover="allowDrop" -->
<!--         id="treeCnt" -->
<!--       > -->
<!--       	결재순서▼ -->
<!--        </div> -->
<!-- 	<div id="demo"></div> -->
<!--    <button onclick="popclose()"style="position: relative; left: 320px;" class="snip1535">확인</button> -->
  </div>
    <script>
    
    $.ajax({
	    url: "/vue",
	    type: "POST",
	     contentType : "application/json; charset:UTF-8",
	     async : false,
	    success: function(data) {
 	    	var List = JSON.parse(data); 
 	    	listdpt = "";
 	    	
 	    	for(var i=0; i<List.length; i++){
 	    		listdpt += List[i].dptnm;
 	    		
 	    	}
 	    	
 	    	
 	    		let answer = "";
 	    	    for(let i=0; i<listdpt.length; i++){
 	    	    	if(listdpt.indexOf(listdpt[i]) === 1) answer += listdpt[i];
 	    	    }
 	    	    
 	    	alert(answer);
 	    	
	    	if(List != null && List.length > 0 ) {
	    		
				//화면 생성
				var listHtml = "";
				 listHtml +="<div style='left: 40; position: relative;' class='droptarget' v-on:drop='drop' v-on:dragover='allowDrop'>";
				 listHtml +="<ul class='tree'>";
	             listHtml += "<li>";
	             listHtml += "<input type='checkbox' id='root'>";
	             listHtml += "<label for='root'>세연아이넷(주)</label>";
				for(var i=0; i<List.length; i++){
	            	 listHtml += "<ul>";
		             listHtml += "<li>";
		             //부서 시작
// 		             IF(LIST[I].DPTNM == "AI빅데이터"){
		            	 
		             
		             listHtml += "<input type='checkbox' id='node"+ i +"'>";
		             listHtml += "<label for='node"+ i +"'>"+List[i].dptnm +"</label>";
		             	 
// 		             }
	            	 	
		             
		             //부서 끝
		             listHtml += "</li>";
		             listHtml += "</ul>";
		             
	             
				}
				listHtml += "</div>";
				listHtml += "<div style='left: 100; position: relative;' class='droptarget' v-on:drop='drop' v-on:dragover='allowDrop' id='treeCnt'>";
				listHtml +="결재순서▼"
				listHtml +="</div>"
		      
		       
				$("#app").html(listHtml);
			
		 }
	    	 var app = new Vue({
	    	        el: "#app",

	    	        methods: {
	    	          dragStart:function(event)  {
	    	            event.dataTransfer.setData("Text", event.target.id);
	    	          },
	    	          dragging:function(event) {
	    	            document.getElementById("demo").innerHTML =
	    	              "in";
	    	          },
	    	          allowDrop:function(event) {
	    	            event.preventDefault();
	    	          },
	    	          drop:function(event) {
	    	            event.preventDefault();
	    	            var data = event.dataTransfer.getData("Text");
	    	            event.target.appendChild(document.getElementById(data));
	    	            document.getElementById("demo").innerHTML =
	    	              "out";
	    	          }

	    	        }
	    	      });
	    	      /* Demo purposes only */
	    	      $(".hover").mouseleave(
	    	        function() {
	    	          $(this).removeClass("hover");
	    	        }
	    	      );
	    },
	    error: function () {
	    	alert("에러..");
		}

	});
     
    function popclose(){
    	
    	var treeText = $('#treeCnt').children('li').children('input').children('label').text();
    	var treeCnt = $('#treeCnt').children('li').val(treeText);
    	if(treeCnt.length > 9){
    		alert("결재선 5명 미만으로");
    	}else{
          window.opener.setData(treeCnt);
          window.close();
    	}
	}
    </script>
  </body>
</html>