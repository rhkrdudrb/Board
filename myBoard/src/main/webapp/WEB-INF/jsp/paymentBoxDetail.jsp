
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 헤더시작부분 -->
	<%@include file="../includes/header.jsp" %>
			<form action="paymentBox" method="post">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">정보</h1>
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
										<td>${paymentDetail.getApvform()}
								        </td>
										</tr>
											<tr>
												<th style="text-align:center; vertical-align: middle;"  id="Title" >결제선</th>
												<td>${paymentDetail.getLine()}</td>
											</tr>
											<tr>
												<th style="text-align:center; vertical-align: middle;">제목</th>
												<td>${paymentDetail.getApvnm()}</td>
											</tr>
											<tr>
												<th style="text-align:center; vertical-align: middle;">반려사유</th>
												<td>${paymentDetail.getApvno()}</td>
											</tr>
										</tbody>
									</table>
                                 
							
								</ul>	
								
                               <textarea id="freeContext" name="freeContext" style="height: 1000px">
                               ${paymentDetail.getApvcnt()}
                               </textarea>
                               
                        </div>
                    
                        <input type="hidden" id="form"name="form"/>
                        <div style="position: relative; left: 1650px; top=-20px;">
                        <input type="hidden" id ="line" name="line"></div>
                        <input type="submit" class="page-link" value="목록가기"></input>
                        <input type="button" onClick='approval()'class="page-link"   value="승인"></input>
                        <input type="button" onClick='companion()'class="page-link"   value="반려"></input>
<!--                 		<input onClick='approval()'class="page-link"  value='승인'/> -->
<!--             			<input onClick='companion()'class="page-link" value='반려'/> -->
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
<!-- <script type="text/javascript" src="/js/ck/ckeditor/ckeditorCnt.js"></script> -->
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
		var apvsqVal = ${paymentDetail.getApvsq()};
		var apvodadVal = ${paymentDetail.getApvodad()};
function approval() {
		
		var form = document.createElement("form");
		form.action = '/stateUpdate';
	    form.method = "post";
	    
	    //apvsq값 불러오기
		var apvsq = document.createElement("input");
		apvsq.setAttribute("type", "hidden");
		apvsq.setAttribute("name", "apvsq"); 
		apvsq.setAttribute("value", apvsqVal);
		
		//apvodad값 불러오기
		var apvodad = document.createElement("input");
		apvodad.setAttribute("type", "hidden");
		apvodad.setAttribute("name", "apvodad"); 
		apvodad.setAttribute("value", apvodadVal);
		
		form.appendChild(apvsq);
		form.appendChild(apvodad);
	    document.body.appendChild(form);
	    form.submit();
} 
function companion() {
    var tr = $( "#noticeList > tr" );
    var Companion = prompt("반려 사유를 적어주세요","");
    var yes = confirm("반려하시겠습니까?");
	if(yes == true){
		 	//내가 선택한 영역의 자식
			var td = $( this ).children();
			var form = document.createElement("form");
			form.action = '/companionUpdate';
		    form.method = "post";
		    
		    //반려사유
			var apvno = document.createElement("input");
			apvno.setAttribute("type", "hidden");
			apvno.setAttribute("name", "apvno"); 
			apvno.setAttribute("value", Companion);
		    
		    //apvsq값 불러오기
			var apvsq = document.createElement("input");
			apvsq.setAttribute("type", "hidden");
			apvsq.setAttribute("name", "apvsq"); 
			apvsq.setAttribute("value", apvsqVal);
			
			//apvodad값 불러오기
			var apvodad = document.createElement("input");
			apvodad.setAttribute("type", "hidden");
			apvodad.setAttribute("name", "apvodad"); 
			apvodad.setAttribute("value", apvodadVal);
			
			form.appendChild(apvno);
			form.appendChild(apvsq);
			form.appendChild(apvodad);
		    document.body.appendChild(form);
	 	    form.submit();	
	}
}  
</script>