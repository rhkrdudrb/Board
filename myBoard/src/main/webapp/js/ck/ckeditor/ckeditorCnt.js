function StringBuffer() { this.buffer = []; }
StringBuffer.prototype.append = function (string) {
	this.buffer.push(string);
	return this;
}

StringBuffer.prototype.toString = function () {
	return this.buffer.join("");
}
function selectbox() {
	var ckHtml = new StringBuffer();

	if ($('#select').val() == 1) {
		const element = document.getElementById('Title');
		element.innerHTML = '법인카드사용승인서';
		$('#form').val($('#Title').text());
		ckHtml.append("<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:1000px'>");
		ckHtml.append("<tbody>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; text-align:center; width:200px'>기안부서</td>");
		ckHtml.append("<td style='width:300px'>&nbsp;</td>");
		ckHtml.append("<td rowspan='3'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; text-align:center; width:200px'>기안일</td>");
		ckHtml.append("<td style='width:300px'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='text-align:center; width:200px'>");
		ckHtml.append("<p> 기안자</p>");
		ckHtml.append("</td>");
		ckHtml.append("<td style='width:300px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='text-align:center; width:200px'>");
		ckHtml.append("<p>제목</p>");
		ckHtml.append("</td>");
		ckHtml.append("<td colspan='2' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='3' style='height:1000px; text-align:center; width:200px'>");
		ckHtml.append("<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:950px'>");
		ckHtml.append("<tbody>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' rowspan='2' style='height:50px; width:200px'>승인 신청자</td>");
		ckHtml.append("<td style='height:50px; width:150px'>성명</td>");
		ckHtml.append("<td style='height:50px'>&nbsp;</td>");
		ckHtml.append("<td style='height:50px; width:150px'>직위</td>");
		ckHtml.append("<td style='height:50px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:150px'>부서</td>");
		ckHtml.append("<td colspan='3' rowspan='1' style='height:20px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='5' style='height:150px; width:200px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>법인카드번호</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>사용기간</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>년 월 일</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>반난예정일</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>지출예상금액</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='width:200px'>지출내역</td>");
		ckHtml.append("<td colspan='4' rowspan='1' style='height:150px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='5' style='height:200px); width:200px'>");
		ckHtml.append("<p>위 카드를 수령합니다</p>");
		ckHtml.append("<p>&nbsp;</p>");
		ckHtml.append("<p>년 월 일</p>");
		ckHtml.append("<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;수령자 :</p>");
		ckHtml.append("</td>");
		ckHtml.append("</tr>");
		ckHtml.append("</tbody>");
		ckHtml.append("</table>");
		ckHtml.append("<p>&nbsp;</p>");
		ckHtml.append("</td>");
		ckHtml.append("</tr>");
		ckHtml.append("</tbody>");
		ckHtml.append("</table>");

		var ckHtmlInfo = ckHtml.toString();
		CKEDITOR.instances.freeContext.setData(ckHtmlInfo);

	} else if ($('#select').val() == 2) {
		const element = document.getElementById('Title');
		element.innerHTML = '휴가신청서';
		$('#form').val($('#Title').text());
		ckHtml.append("<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:1000px'>");
		ckHtml.append("<tbody>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; text-align:center; width:200px'>기안부서</td>");
		ckHtml.append("<td style='width:300px'>&nbsp;</td>");
		ckHtml.append("<td rowspan='3'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; text-align:center; width:200px'>기안일</td>");
		ckHtml.append("<td style='width:300px'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='text-align:center; width:200px'>");
		ckHtml.append("<p> 기안자</p>");
		ckHtml.append("</td>");
		ckHtml.append("<td style='width:300px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='text-align:center; width:200px'>");
		ckHtml.append("<p>제목</p>");
		ckHtml.append("</td>");
		ckHtml.append("<td colspan='2' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='3' style='height:1000px; text-align:center; width:200px'>");
		ckHtml.append("<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:950px'>");
		ckHtml.append("<tbody>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:50px; width:200px'>부서</td>");
		ckHtml.append("<td colspan='4' rowspan='1' style='height:50px; width:150px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:50px; width:200px'>직위</td>");
		ckHtml.append("<td style='height:20px; width:150px'>&nbsp;</td>");
		ckHtml.append("<td colspan='2' rowspan='1' style='height:50px; width:100px'>성명</td>");
		ckHtml.append("<td rowspan='1' style='height:50px; width:450px'>&nbsp;&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='5' style='height:150px; width:200px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='5' style='height:30px; width:200px'>아래</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>기간</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>년 월 일</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>사유</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; width:200px'>행선지</td>");
		ckHtml.append("<td colspan='4' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='width:200px'>비상연락처</td>");
		ckHtml.append("<td colspan='4' rowspan='1' style='height:150px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='5' style='height:200px; width:200px'>");
		ckHtml.append("<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;신청일 :</p>");
		ckHtml.append("<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;신청자 :</p>");
		ckHtml.append("</td>");
		ckHtml.append("</tr>");
		ckHtml.append("</tbody>");
		ckHtml.append("</table>");
		ckHtml.append("<p>&nbsp;</p>");
		ckHtml.append("</td>");
		ckHtml.append("</tr>");
		ckHtml.append("</tbody>");
		ckHtml.append("</table>");

		var ckHtmlInfo = ckHtml.toString();
		CKEDITOR.instances.freeContext.setData(ckHtmlInfo);

	}else if($('#select').val() == 3){
		const element = document.getElementById('Title');
		element.innerHTML = '사직서';
		$('#form').val($('#Title').text());
		ckHtml.append("<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:1000px'>");
		ckHtml.append("<tbody>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='height:50px; text-align:center; width:200px'>기안부서</td>");
		ckHtml.append("<td style='width:300px'>&nbsp;</td>");
		ckHtml.append("<td rowspan='3'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td id ='test' style='height:50px; text-align:center; width:200px'>기안일</td>");
		ckHtml.append("<td style='width:300px'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='text-align:center; width:200px'>");
		ckHtml.append("<p>기안자</p>");
		ckHtml.append("</td>");
		ckHtml.append("<td style='width:300px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td style='text-align:center; width:200px'>");
		ckHtml.append("<p>제목</p>");
		ckHtml.append("</td>");
		ckHtml.append("<td colspan='2' rowspan='1'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("");
		ckHtml.append("");
		ckHtml.append("");
		ckHtml.append("");
		ckHtml.append("");
		ckHtml.append("<td colspan='3' style='height:800px; text-align:center; width:200px'>");
		ckHtml.append("<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:950px'>");
		ckHtml.append("<tbody>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:50px; width:250px'>부서</td>");
		ckHtml.append("<td colspan='2' rowspan='1' style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>직위</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>성명</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:50px; width:250px'>주민등록번호</td>");
		ckHtml.append("<td style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("<td colspan='2' rowspan='1' style='height:20px; width:250px'>입사일자</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>&nbsp;&nbsp;</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>퇴사예정일자</td>");
		ckHtml.append("<td rowspan='1' style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:50px; width:250px'>퇴사후 연락처 주소</td>");
		ckHtml.append("<td colspan='6' rowspan='1' style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='7' style='height:250px; width:250px'>");
		ckHtml.append("<p>- 내용 -&nbsp;</p>");
		ckHtml.append("</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:50px; width:250px'>업무인수자</td>");
		ckHtml.append("<td colspan='3' rowspan='1' style='height:50px; width:250px'>&nbsp;</td>");
		ckHtml.append("<td style='height:50px; width:250px'>면담자</td>");
		ckHtml.append("<td colspan='2' rowspan='1' style='height:20px; width:250px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='1' style='height:30px; width:250px'>면담내용</td>");
		ckHtml.append("<td colspan='6' rowspan='1' style='height:100px; width:250px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("<tr>");
		ckHtml.append("<td colspan='4' style='height:50px; width:250px'>퇴직명령 일자</td>");
		ckHtml.append("<td colspan='3' style='height:30px; width:250px'>&nbsp;</td>");
		ckHtml.append("</tr>");
		ckHtml.append("</tbody>");
		ckHtml.append("</table>");

		ckHtml.append("<p>&nbsp;</p>");
		ckHtml.append("</td>");
		ckHtml.append("</tr>");
		ckHtml.append("</tbody>");
		ckHtml.append("</table>");
		
		var ckHtmlInfo = ckHtml.toString();
		CKEDITOR.instances.freeContext.setData(ckHtmlInfo);
	}else {
		const element = document.getElementById('Title');
		element.innerHTML = '선택하세요.';
		CKEDITOR.instances.freeContext.setData("");
	}
	
	

}