<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 헤더시작부분 -->
	<%@include file="../includes/header.jsp" %>
			<form action="insert" method="post">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">기안서작성</h1>
<!--                     <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
<!--                         For more information about DataTables, please visit the <a target="_blank" -->
<!--                             href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" >
                        <div class="card-header py-3"> 
                        
				        
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
	                                  <table class="table table-bordered" border="1" cellpadding="1" cellspacing="1" style="width:100%">
	                                  <colgroup>
	                                  <col width="25%">
	                                  <col width="75%">
	                                  </colgroup>
										<tbody>
										<tr>
										<th style="text-align:center; vertical-align: middle;">양식분류</th>
										<td><select id="select" name="select" size="1" onchange="selectbox()">
								            <option value="">선택하세요</option>
								            <option value="1">법인카드사용승인서</option>
								            <option value="2">휴가신청서</option>
								            <option value="3">사직서</option>
								        </select>
								        </td>
										</tr>
											<tr>
												<th style="text-align:center; vertical-align: middle;"  id="Title" >결제선</th>
												<ul class="pagination">
								 				<td> <li id="toggle"class="paginate_button page-item previous" onclick="pop()"><a class="page-link"> 결제선 선택 </a></li></td>
											</tr>
											<tr>
												<th style="text-align:center; vertical-align: middle;">제목</th>
												<td><input style="width:600px" type="text" id="Title" name="Title"/></td>
											</tr>
										</tbody>
									</table>
                                 
							
								</ul>	
								
                               <textarea id="freeContext" name="freeContext" style="height: 1000px"></textarea>
                               
                        </div>
                     
                        <input type="hidden" id="id" name="id" value="<%= session.getAttribute("id") %>"/>
                        <input type="hidden" id="pw" name="pw" value="<%= session.getAttribute("pw") %>"/>
                        <input type="hidden" id="sq" name="sq" value="<%= session.getAttribute("sq") %>"/>
                        <input type="hidden" id="form"name="form"/>
                        <div style="position: relative; left: 1650px; top=-20px;">
                        <input type="hidden" id ="line" name="line"></div>
                        <input type="submit" class="page-link" id="test"value="결재상신"></input>
                        </div>
                    </div>
                </div>
                </form>
                <!-- 풋터시작 -->
            <%@include file="../includes/footer.jsp" %>
<!-- 제이쿼리 cnd -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- js 파일  -->
<script type="text/javascript" src="/js/ck/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/ck/ckeditor/ckeditorCnt.js"></script>
<script type="text/javascript">

$(function() {
	CKEDITOR.replace('freeContext',
					{//해당 이름으로 된 textarea에 에디터를 적용
					height: 1000,
				   filebrowserImageUploadUrl : '/imageUpload/' //여기 경로로 파일을 전달하여 업로드 시킨다.
				});
				CKEDITOR.on('dialogDefinition', function(ev) {
					var dialogName = ev.data.name;
					var dialogDefinition = ev.data.definition;

					switch (dialogName) {
					case 'image': //Image Properties dialog
						//dialogDefinition.removeContents('info');
						dialogDefinition.removeContents('Link');
						dialogDefinition.removeContents('advanced');
						break;
					}
				});

			});
	function pop() {
		var _width = '1500';
		var _height = '1000';
		var _left = Math.ceil(( window.screen.width - _width )/2);
		var _top = Math.ceil(( window.screen.height - _height )/2); 
 		window.open('approvalline','popupView',"width=800,height=650,left="+_left+",top="+_top);
	}
	//자식창에서 받아온 데이터적용
	function setData(treeCnt){
		
		var now = new Date();
		var date = now.getMonth()+1 +"/" + now.getDate();
		var SetTreeCnt = treeCnt.text();
		$('#line').val(SetTreeCnt);
		ckHtml = "";
		var ckHtml = new StringBuffer();
		if($('#select').val() == 1){
			ckHtml +="<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:1000px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; text-align:center; width:200px'>기안부서</td>";
			ckHtml +="<td style='width:300px'>&nbsp;</td>";
			ckHtml +="<td rowspan='3'>";
			ckHtml +="<table border='1' cellpadding='1' cellspacing='1' style='width:500px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			if(SetTreeCnt.substring(1,7)){
				ckHtml +="<td style=text-align:center;'width:120px'>"+ SetTreeCnt.substring(1,7) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(8,14)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(8,14) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(15,21)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(15,21) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(22,28)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(22,28) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			if(SetTreeCnt.substring(1,7)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(8,14)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(15,21)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(22,28)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; text-align:center; width:200px'>기안일</td>";
			ckHtml +="<td style='width:300px'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='text-align:center; width:200px'>";
			ckHtml +="<p>기안자</p>";
			ckHtml +="</td>";
			ckHtml +="<td style='width:300px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='text-align:center; width:200px'>";
			ckHtml +="<p>제목</p>";
			ckHtml +="</td>";
			ckHtml +="<td colspan='2' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='3' style='height:1000px; text-align:center; width:200px'>";
			ckHtml +="<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:950px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' rowspan='2' style='height:50px; width:200px'>승인 신청자</td>";
			ckHtml +="<td style='height:50px; width:150px'>성명</td>";
			ckHtml +="<td style='height:50px'>&nbsp;</td>";
			ckHtml +="<td style='height:50px; width:150px'>직위</td>";
			ckHtml +="<td style='height:50px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:150px'>부서</td>";
			ckHtml +="<td colspan='3' rowspan='1' style='height:20px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='5' style='height:150px; width:200px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>법인카드번호</td>";
			ckHtml +="<td colspan='4' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>사용기간</td>";
			ckHtml +="<td colspan='4' rowspan='1'>년 월 일</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>반난예정일</td>";
			ckHtml +="<td colspan='4' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>지출예상금액</td>";
			ckHtml +="<td colspan='4' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='width:200px'>지출내역</td>";
			ckHtml +="<td colspan='4' rowspan='1' style='height:150px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='5' style='height:200px); width:200px'>";
			ckHtml +="<p>위 카드를 수령합니다</p>";
			ckHtml +="<p>&nbsp;</p>";
			ckHtml +="<p>년 월 일</p>";
			ckHtml +="<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;수령자 :</p>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			ckHtml +="<p>&nbsp;</p>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			CKEDITOR.instances.freeContext.setData(ckHtml);
		}else if($('#select').val() == 2){
			ckHtml +="<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:1000px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; text-align:center; width:200px'>기안부서</td>";
			ckHtml +="<td style='width:300px'>&nbsp;</td>";
			ckHtml +="<td rowspan='3'>";
			ckHtml +="<table border='1' cellpadding='1' cellspacing='1' style='width:500px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			if(SetTreeCnt.substring(1,7)){
				ckHtml +="<td style=text-align:center;'width:120px'>"+ SetTreeCnt.substring(1,7) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(8,14)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(8,14) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(15,21)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(15,21) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(22,28)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(22,28) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			if(SetTreeCnt.substring(1,7)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(8,14)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(15,21)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(22,28)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; text-align:center; width:200px'>기안일</td>";
			ckHtml +="<td style='width:300px'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='text-align:center; width:200px'>";
			ckHtml +="<p>기안자</p>";
			ckHtml +="</td>";
			ckHtml +="<td style='width:300px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='text-align:center; width:200px'>";
			ckHtml +="<p>제목</p>";
			ckHtml +="</td>";
			ckHtml +="<td colspan='2' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='3' style='height:1000px; text-align:center; width:200px'>";
			ckHtml +="<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:950px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:50px; width:200px'>부서</td>";
			ckHtml +="<td colspan='4' rowspan='1' style='height:50px; width:150px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:50px; width:200px'>직위</td>";
			ckHtml +="<td style='height:20px; width:150px'>&nbsp;</td>";
			ckHtml +="<td colspan='2' rowspan='1' style='height:50px; width:100px'>성명</td>";
			ckHtml +="<td rowspan='1' style='height:50px; width:450px'>&nbsp;&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='5' style='height:150px; width:200px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='5' style='height:30px; width:200px'>아래</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>기간</td>";
			ckHtml +="<td colspan='4' rowspan='1'>년 월 일</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>사유</td>";
			ckHtml +="<td colspan='4' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; width:200px'>행선지</td>";
			ckHtml +="<td colspan='4' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='width:200px'>비상연락처</td>";
			ckHtml +="<td colspan='4' rowspan='1' style='height:150px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='5' style='height:200px; width:200px'>";
			ckHtml +="<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;신청일 :</p>";
			ckHtml +="<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;신청자 :</p>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			ckHtml +="<p>&nbsp;</p>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			CKEDITOR.instances.freeContext.setData(ckHtml);
		}else if($('#select').val() == 3){
			ckHtml +="<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:1000px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; text-align:center; width:200px'>기안부서</td>";
			ckHtml +="<td style='width:300px'>&nbsp;</td>";
			ckHtml +="<td rowspan='3'>";
			ckHtml +="<table border='1' cellpadding='1' cellspacing='1' style='width:500px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			if(SetTreeCnt.substring(1,7)){
				ckHtml +="<td style=text-align:center;'width:120px'>"+ SetTreeCnt.substring(1,7) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(8,14)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(8,14) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(15,21)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(15,21) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(22,28)){
				ckHtml +="<td style='text-align:center; width:120px'>"+ SetTreeCnt.substring(22,28) +"</td>";
			}else {ckHtml +="<td style='width:120px'></td>";}
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="<td style='height:80px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			if(SetTreeCnt.substring(1,7)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(8,14)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(15,21)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			if(SetTreeCnt.substring(22,28)){
				ckHtml +="<td style='text-align:center; width:120px'>" +date +"</td>";
			}else{ckHtml +="<td style='width:120px'></td>";}
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='height:50px; text-align:center; width:200px'>기안일</td>";
			ckHtml +="<td style='width:300px'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='text-align:center; width:200px'>";
			ckHtml +="<p>기안자</p>";
			ckHtml +="</td>";
			ckHtml +="<td style='width:300px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td style='text-align:center; width:200px'>";
			ckHtml +="<p>제목</p>";
			ckHtml +="</td>";
			ckHtml +="<td colspan='2' rowspan='1'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='3' style='height:800px; text-align:center; width:200px'>";
			ckHtml +="<table align='center' border='1' cellpadding='1' cellspacing='1' style='width:950px'>";
			ckHtml +="<tbody>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:50px; width:250px'>부서</td>";
			ckHtml +="<td colspan='2' rowspan='1' style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>직위</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>성명</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:50px; width:250px'>주민등록번호</td>";
			ckHtml +="<td style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="<td colspan='2' rowspan='1' style='height:20px; width:250px'>입사일자</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>&nbsp;&nbsp;</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>퇴사예정일자</td>";
			ckHtml +="<td rowspan='1' style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:50px; width:250px'>퇴사후 연락처 주소</td>";
			ckHtml +="<td colspan='6' rowspan='1' style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='7' style='height:250px; width:250px'>";
			ckHtml +="<p>- 내용 -&nbsp;</p>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:50px; width:250px'>업무인수자</td>";
			ckHtml +="<td colspan='3' rowspan='1' style='height:50px; width:250px'>&nbsp;</td>";
			ckHtml +="<td style='height:50px; width:250px'>면담자</td>";
			ckHtml +="<td colspan='2' rowspan='1' style='height:20px; width:250px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='1' style='height:30px; width:250px'>면담내용</td>";
			ckHtml +="<td colspan='6' rowspan='1' style='height:100px; width:250px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="<tr>";
			ckHtml +="<td colspan='4' style='height:50px; width:250px'>퇴직명령 일자</td>";
			ckHtml +="<td colspan='3' style='height:30px; width:250px'>&nbsp;</td>";
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			ckHtml +="<p>&nbsp;</p>";
			ckHtml +="</td>";
			ckHtml +="</tr>";
			ckHtml +="</tbody>";
			ckHtml +="</table>";
			CKEDITOR.instances.freeContext.setData(ckHtml);
		}
	}
</script>