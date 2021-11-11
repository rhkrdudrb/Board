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
    </style>
  </head>
  <body>
  <div id="app">
  <div
  		style="left: 40; position: relative;"
        class="droptarget"
        v-on:drop="drop"
        v-on:dragover="allowDrop"
      >
  <ul class="tree">
  <li>
    <input type="checkbox" id="root">
    <label for="root">세연아이넷(주)</label>
    <ul>
      <li>
        <input type="checkbox" id="node2">
        <label for="node2">세일즈마케팅</label>
        <ul>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget">
            <input type="checkbox" id="node21">
            <label for="node21" class="lastTree">심** 전무</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget1">
            <input type="checkbox" id="node22">
            <label for="node22" class="lastTree">손** 이사</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget2">
            <input type="checkbox" id="node23">
            <label for="node23" class="lastTree">윤** 이사</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget3">
            <input type="checkbox" id="node23">
            <label for="node24" class="lastTree">전** 차장</label>
          </li>
        </ul>
      
      <li>
        <input type="checkbox" id="node2">
        <label for="node2">인프라사업본부</label>
        <ul>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget4">
            <input type="checkbox" id="node21">
            <label for="node21" class="lastTree">한** 이사</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget5">
            <input type="checkbox" id="node22">
            <label for="node22" class="lastTree">홍** 이사</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget6">
            <input type="checkbox" id="node23">
            <label for="node23" class="lastTree">선** 차장</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget7">
            <input type="checkbox" id="node23">
            <label for="node24" class="lastTree">천** 차장</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget8">
            <input type="checkbox" id="node23">
            <label for="node24" class="lastTree">송** 대리</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget9">
            <input type="checkbox" id="node23">
            <label for="node24" class="lastTree">강** 주임</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget10">
            <input type="checkbox" id="node23">
            <label for="node24" class="lastTree">이** 주임</label>
          </li>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget11">
            <input type="checkbox" id="node23">
            <label for="node24" class="lastTree">정** 주임</label>
          </li>
        </ul>
      
      <li>
        <input type="checkbox" id="node2">
        <label for="node2">AI빅데이터사업본부</label>
        <ul>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget12">
            <input type="checkbox" id="node21">
            <label for="node21" class="lastTree">백** 차장</label>
          </li>
         
         <li>
        <input type="checkbox" id="node2">
        <label for="node2">대표실</label>
        <ul>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget13">
            <input type="checkbox" id="node21">
            <label for="node21" class="lastTree">정은호 대표이사</label>
          </li>
        </ul>
      <li>
        <input type="checkbox" id="node2">
        <label for="node2">경영지원실</label>
        <ul>
          <li class ="drag-elements"
      	  v-on:dragstart="dragStart"
          v-on:drag="dragging"
          draggable="true"
          id="dragtarget14">
            <input type="checkbox" id="node21">
            <label for="node21" class="lastTree">전** 실장</label>
          </li>
    </ul>
  </li>
</ul>
</div>

      <ul class="tree">
      <div>
      </div>
      <div
      	style="left: 100; position: relative;"
        class="droptarget"
        v-on:drop="drop"
        v-on:dragover="allowDrop"
        id="treeCnt"
      >
      	결재순서▼
       </div>
      </ul>
   <button onclick="popclose()"style="position: relative; left: 320px;" class="snip1535">확인</button>

    </div>
    <script>
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
    function popclose(){
    	var treeText = $('#treeCnt').children('li').children('input').children('label').text();
    	var treeCnt = $('#treeCnt').children('li').val(treeText);
    	if(treeCnt.length > 4){
    		alert("결재선 5명 미만으로");
    	}else{
          window.opener.setData(treeCnt);
          window.close();
    	}
	}
    </script>
  </body>
</html>