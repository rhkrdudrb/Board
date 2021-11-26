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
	<div id="demo"></div>
<!--    <button onclick="popclose()"style="position: relative; left: 320px;" class="snip1535">확인</button> -->
  </div>
    <script>
    $(document).ready(function() { 
    	$.ajax({
    	    url: "/vuedpt",
    	    type: "POST",
    	     contentType : "application/json; charset:UTF-8",
    	     async : false,
    	    success: function(data) {
    	    	callback(data);
    	    },error: function () {
    	      alert("에러..");
    		}
    	});
    });

    function callback(data){
    	$.ajax({
    	    url: "/vue",
    	    type: "POST",
    	     contentType : "application/json; charset:UTF-8",
    	     async : false,
    	    	success: function(res) {
    	    	var Listdata = JSON.parse(data); 
     	    	var List = JSON.parse(res); 
    	    	if(List != null && List.length > 0 ) {
    				//화면 생성
    			 var listHtml = "";
					 listHtml +="<div style='left: 40; position: relative;' class='droptarget' v-on:drop='drop' v-on:dragover='allowDrop'>";
    				 listHtml +="<ul class='tree'>";
    	             listHtml += "<li>";
    	             listHtml += "<input type='checkbox' id='root'>";
    	             listHtml += "<label for='root'>세연아이넷(주)</label>";
    				for(var i=0; i<Listdata.length; i++){
    					 listHtml += "<ul>";
    		             listHtml += "<li>";
    		             listHtml += "<input type='checkbox'  id='node"+ i+1 +"'>";
    		             listHtml += "<label for='node"+ i +"'>"+Listdata[i].dptnm +"</label>";
    		             listHtml += "</li>";
    		             listHtml += "</ul>";
    		             listHtml += "<ul id='my"+i+"'>";
    		             listHtml += "</ul>";
					     for(var j=0; j<List.length; j++){
					    	 if(Listdata[i].dptsq == List[j].dptsq && Listdata[i].dptnm == List[j].dptnm){
					    		 listHtml += "<ul>";
			      			     listHtml += "<li class ='drag-elements' v-on:dragstart='dragStart' v-on:drag='dragging' draggable='true' id='dragtarget"+ j +"'>";
					    		 listHtml += "<input type='hidden' name='nodeid' value='"+ List[j].stfid+"'>";
		      			         listHtml += "<input type='checkbox' id='node"+ j +"'>";
		      			         listHtml += "<label for='node"+ j +"' class='lastTree'>"+List[j].stfnm+" "+"</label>";
		      			      	 listHtml += "</li>";
		      			         listHtml += "</ul>";
		      			       $("#my"+ i).html(listHtml);    			     
					    	 }
					     } 
    				}	
    				listHtml += "</div>";
    				listHtml += "<ul class='tree'>";
    				listHtml += "<form id='frm'>";
    				listHtml += "<div style='left: 100; position: relative;' class='droptarget' v-on:drop='drop' v-on:dragover='allowDrop' id='treeCnt'>";
    				listHtml +="결재순서▼";
    				listHtml +="</div>";
    				listHtml += "</ul>";
    				listHtml += "</from>";
    				listHtml +="<button onclick='popclose()'style='position: relative; left: 320px;' class='snip1535'>확인</button>";
    			} 
    	    	$("#app").html(listHtml);
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
    	
    }
    function popclose(){
     	//id값 가져오기
        var Value="";
        var frm = document.getElementById("frm");
        var frmvalue = frm.getElementsByTagName("input");
        for(i=0;i<frm.length;i++){
        	Value += frmvalue[i].value;
       }
    	var ValueArry = Value.split("on");
    	//text 가져오기
    	var treeText = $('#treeCnt').children('li').children('input').children('label').text();
    	var treeCnt = $('#treeCnt').children('li').val(treeText);
          window.opener.setData(treeCnt,ValueArry);
          window.close();
    	
	}
    </script>
  </body>
</html>