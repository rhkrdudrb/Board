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
  <form  method ="post" class="loginForm1" enctype="multipart/form-data" name="frm" id="frm">
      <h2>회원정보</h2>
      <div class="idForm">직급 :
       <select id="rank" name="rank" size="1">
		<option value="1" <c:if test="${joinInfo.getRank()==1}"> selected</c:if>>대표</option>
		<option value="2" <c:if test="${joinInfo.getRank()==2}"> selected</c:if>>이사</option>
		<option value="3" <c:if test="${joinInfo.getRank()==3}"> selected</c:if>>팀장</option>
		<option value="4" <c:if test="${joinInfo.getRank()==4}"> selected</c:if>>차장</option>  
		<option value="5" <c:if test="${joinInfo.getRank()==5}"> selected</c:if>>대리</option>
		<option value="6" <c:if test="${joinInfo.getRank()==6}"> selected</c:if>>주임</option>
      	<option value="7" <c:if test="${joinInfo.getRank()==7}"> selected</c:if>>사원</option>
      	</select>
      	</div>
      	<div class="idForm">부서 :
       <select id="Department" name="Department" size="1">
		<option value="1" <c:if test="${joinInfo.getDepartment()==1}"> selected</c:if>>대표실</option>
		<option value="2" <c:if test="${joinInfo.getDepartment()==2}"> selected</c:if>>경영지원실</option>
		<option value="3" <c:if test="${joinInfo.getDepartment()==3}"> selected</c:if>>AI빅데이터</option>
		<option value="4" <c:if test="${joinInfo.getDepartment()==4}"> selected</c:if>>세일즈마케팅</option>
		<option value="5" <c:if test="${joinInfo.getDepartment()==5}"> selected</c:if>>영업</option>
      	</select>
      	</div>
      <div class="idForm">
        <div >이름</div><input type="text" name="name" class="id" placeholder="이름" value="${joinInfo.getName()}">
      </div>
      <div class="idForm">
        <div >id</div><input type="text" name="id" class="id" placeholder="ID"  value="${joinInfo.getId()}" >
      </div>
      <div class="idForm">
        <div >전화번호</div><input type="text" class="id" name="call" placeholder="전화번호" value="${joinInfo.getCall()}">
      </div>
      <div class="idForm">
        <div >회사전화번호</div><input type="text" class="id" name="companyCall" placeholder="회사전화번호" value="${joinInfo.getCompanyCall()}">
      </div>
      <div class="idForm">
        <div >이메일</div><input type="text" class="id" name="email" placeholder="이메일" value="${joinInfo.getEmail()}">
      </div>
       <div class="idForm">
       <div >입사일</div><input type="text" id="sdate" name="companyfirstdate" placeholder="입사일" class="id" value="${joinInfo.getCompanyfirstdate()}">
      </div>
      
      <input onclick="joinUpdate()"class="btn2" value="수정" style="text-align: center" >
      <input onclick="goback()" class="btn2" value="전페이지 돌아가기" style="text-align: center"> 
   
     </form>
     
<!-- 제이쿼리 cnd -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
function joinUpdate(){


    /*cfnSendRequest("/mypage/insertQuestion",param,'insertQuestion');*/
	$.ajax({
	    url: "/joinUpdate",
	    type: "POST",
	    data: $("#frm").serialize(),
	    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	alert("수정되었습니다.");
	    },
	    error: function () {
	    	alert("에러..");
		}

	});
	
}
function goback(){
	history.back(-1);
}
$( document ).ready(function() {
     $.datepicker.regional['ko'] = {
		        closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        weekHeader: 'Wk',
		        dateFormat: 'yy-mm-dd',
		        firstDay: 0,
		        isRTL: false,
		        showMonthAfterYear: true,
		        yearSuffix: '',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: 'c-99:c+99',
		    };
		    $.datepicker.setDefaults($.datepicker.regional['ko']);

		    $('#sdate').datepicker();
		    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
		    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#edate").datepicker( "option", "minDate", selectedDate );
		    });
});
</script >		    
  </body>
</html>