<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<DOCTYPE HTML5>
<html>
  <head>
  <meta charset="UTF-8">
  <style>
select {
width: 200px;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url('img/selectboxmig.jfif/') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

select::-ms-expand {
    display: none;
}

</style>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
  </head>
	
  <body width="100%" height="100%">
  <form action="join" method ="post" class="loginForm1">
      <h2>회원가입</h2>
      <div class="idForm">직급 :
       <select id="rank" name="rank" size="1">
		<option value="1">대표</option>
		<option value="2">이사</option>
		<option value="3">팀장</option>
		<option value="4">차장</option>
		<option value="5">대리</option>
		<option value="6">주임</option>
      	<option value="7">사원</option>
      	</select>
      	</div>
      	<div class="idForm">부서 :
       <select id="Department" name="Department" size="1">
		<option value="1">대표실</option>
		<option value="2">경영지원실</option>
		<option value="3">AI빅데이터</option>
		<option value="4">세일즈마케팅</option>
		<option value="5">영업</option>
      	</select>
      	</div>
      <div class="idForm">
        <input type="text" name="name" class="id" placeholder="이름">
      </div>
      <div class="idForm">
        <input type="text" name="id" class="id" placeholder="ID">
      </div>
      <div class="idForm">
        <input type="password" class="pw" name="pw" placeholder="PW">
      </div>
      <div class="idForm">
        <input type="text" class="id" name="call" placeholder="전화번호">
      </div>
      <div class="idForm">
        <input type="text" class="id" name="companyCall" placeholder="회사전화번호">
      </div>
      <div class="idForm">
        <input type="text" class="id" name="email" placeholder="이메일">
      </div>
       <div class="idForm">
        <input type="text" class="id" name="companyfirstdate" placeholder="입사일">
      </div>
       <div class="idForm">
        <input type="text" class="id" name="date" placeholder="등록일">
      </div>
      <button type="submit" class="btn" >
        LOG IN
      </button>
      
       <div class="bottomText">
        Don't you have ID? <a href="join">sign up</a>
      </div>
     </form>
      
     
  </body>
</html>