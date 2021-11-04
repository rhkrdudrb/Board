<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 헤더시작부분 -->
	<%@include file="../includes/header.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">기안서작성</h1>
<!--                     <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
<!--                         For more information about DataTables, please visit the <a target="_blank" -->
<!--                             href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" >
                        <div class="card-header py-3">양식분류 
                        <select id="select" name="select" size="1" onchange="selectbox()">
				            <option value="">선택하세요</option>
				            <option value="1">법인카드사용승인서</option>
				            <option value="2">휴가신청서</option>
				            <option value="3">사직서</option>
				        </select>
				        
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr >
                                          <td style="text-align:center;" id="Title" name="Title">선택하세요.</td>
                                        </tr>
<!--                                         <tr > -->
<!--                                           <td style="text-align:center;" >제목</td> -->
<!--                                           <td ><input>dsjds</input></td> -->
<!--                                         </tr> -->
                                    </thead>
                                    <tbody>
                                     
						                  

                                    </tbody>
                                </table>
                               <textarea id="freeContext" name="freeContext" style="height: 1000px"></textarea>
                               
								 <ul class="pagination">
								   <li class="paginate_button page-item previous" onclick="pop()"><a class="page-link"> 결제선 선택 </a></li>
							</ul>	
                        </div>
                    </div>
                </div>
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
		var _width = '1200';
		var _height = '750';
		var _left = Math.ceil(( window.screen.width - _width )/2);
		var _top = Math.ceil(( window.screen.height - _height )/2); 
 		window.open('approvalline','popupView',"width=800,height=650,left="+_left+",top="+_top);
	}
 </script>