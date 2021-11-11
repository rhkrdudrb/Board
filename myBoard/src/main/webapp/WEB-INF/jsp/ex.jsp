<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	
<html>
  <head>
  <!-- 제이쿼리 cnd -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>
    <!-- include Vue 2.x -->
    <script src="https://cdn.jsdelivr.net/npm/vue@^2"></script>
    <!-- include vue-treeselect & its styles. you can change the version tag to better suit your needs. -->
    <script src="https://cdn.jsdelivr.net/npm/@riophae/vue-treeselect@^0.4.0/dist/vue-treeselect.umd.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@riophae/vue-treeselect@^0.4.0/dist/vue-treeselect.min.css">
  </head>
  <body>
  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
     <thead>
	   <tr>
	  <th style="text-align:center;" id="Title" name="Title">결제선 선택.</th>
	 </tr>
       </thead>
</table> 
  <div style="width: 400px; border: 1px solid gold; height: 500px; float: left; width: 300px;  left: 50; position: fixed;" >
    <div id="app" >
      <treeselect v-model="value" :multiple="true" :options="options" />
    </div>
   </div> 
  
   <button  onclick="select()" style=" position: fixed; left: 400; top: 250;">중간결재-></button>
   <button  onclick="select2()" style=" position: fixed; left: 400; top: 300;">최종결재-></button>
   
   <div  style="width: 400px; border: 1px solid gold; height: 250px; float: left; width: 300px; position: fixed; top: 66px; left: 550px;" >
   <div class="hr-sect">중간결재</div>
   <div id="treeCnt"></div>
   </div>
  <div style="width: 400px; border: 1px solid gold; height: 250px; float: left; width: 300px; position: fixed; top: 310px; left: 550px;" >
<div class="hr-sect">최종결재</div>
<div id="treeCnt2"></div>
  </div>
  <div onclick="popclose()">확인</div>
  </body>
  <script>
  function popclose(){
	  var treeCntMid = $("#treeCnt").val();
	  var treeCntEnd = $("#treeCnt2").val();
	  window.opener.setMidData(treeCntMid);
 	  window.opener.setEndData(treeCntEnd);
	  
	window.close();
	}
  function select() {
	  var treeCnt = $("#app").text().split("Select...");
		$("#treeCnt").html(treeCnt);
	}
  function select2() {
	  var treeCnt = $("#app").text().split("Select...");
		$("#treeCnt2").html(treeCnt);
	}
  
    // register the component
    Vue.component('treeselect', VueTreeselect.Treeselect)

    new Vue({
      el: '#app',
      data: {
        // define the default value
        value: null,
        // define options
        options: [ {
          id: '세연아이넷',
          label: '세연아이넷',
          children: [ {
            id: '세일즈마케팅',
            label: '세일즈마케팅',
            //세일즈마케팅시작
            children: [ {
                id: '1',
                label: '1',
              },
            {
                id: '2',
                label: '2',
              },
              {
                  id: '3',
                  label: '3',
                }],
          }, 
          //세일즈마케팅 끝
          //인프라시작
          {
            id: '인프라사업본부',
            label: '인프라사업본부',
            children: [{
                id: '4',
                label: '4',
              },
            {
                id: '5',
                label: '5',
              },
              {
                  id: '6',
                  label: '6',
                }],
          },   
          //인프라사업본부 끝
          //AI빅데이터사업부 시작
          {
            id: 'AI빅데이터사업부',
            label: 'AI빅데이터사업부',
            children: [{
                id: '7',
                label: '7',
              },
            {
                id: '8',
                label: '8',
              },
              {
                  id: '9',
                  label: '9',
          }],
          },   
            //AI빅데이터사업부 끝
           //대표실 시작
           {
              id: '대표실',
              label: '대표실',
              children: [{
                  id: '10',
                  label: '10',
                },
              {
                  id: '11',
                  label: '11',
                },
                {
                    id: '12',
                    label: '12',
            }],
            }, 
            {
                id: '경영지원실',
                label: '경영지원실',
                children: [{
                    id: '13',
                    label: '13',
                  },
                {
                    id: '14',
                    label: '14',
                  },
                  {
                      id: '15',
                      label: '15',
              }],
              }
          ],
        } ],
      },
    })
  </script>
</html>