<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 헤더시작부분 -->
	<%@include file="../includes/header.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">결재함</h1>
<!--                     <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
<!--                         For more information about DataTables, please visit the <a target="_blank" -->
<!--                             href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" >
                        <div class="card-header py-3">
                        <input type="text" id="searchKeyword" name="searchKeyword" value="" style="width:300px; height:40px;" placeholder="검색어를 입력하세요." />
						<a href="#" onclick="" class="btn btn-primary">검색</a>
<!--                             <h6 class="m-0 font-weight-bold text-primary">결재리스트</h6> -->
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 100px; text-align:center;">결재코드번호</th>
                                            <th style="width: 120px; text-align:center;">양식</th>
                                            <th style="width: 500px; text-align:center;">제목</th>
                                            <th style="width: 80px; text-align:center;">기안자</th>
                                           <th style="width: 120px; text-align:center;">부서</th>
                                           <th style="width: 80px; text-align:center;">등록일</th>
                                           <th style="width: 80px; text-align:center;">승인상태</th>
                                           
                                        </tr>
                                    </thead>
<!--                                     <tfoot> -->
<!--                                         <tr> -->
<!--                                             <th>Name</th> -->
<!--                                             <th>Position</th> -->
<!--                                             <th>Office</th> -->
<!--                                             <th>Age</th> -->
<!--                                             <th>Start date</th> -->
<!--                                             <th>Salary</th> -->
<!--                                         </tr> -->
<!--                                     </tfoot> -->
                                    <tbody id="noticeList">
                                      
                                    </tbody>
                                </table>
								 <ul class="pagination">
								  
								   <li class="paginate_button page-item previous"><a class="page-link" href="paymentBox${pageMaker.makeQuery(pageMaker.startPage - 1)}"> < </a></li>
								  
								  <c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" >
								   <li class="paginate_button page-item"><a class="page-link" href="paymentBox${pageMaker.makeQuery(idx)}">${idx}</a></li>
								  </c:forEach>
								    
								
								   <li class="paginate_button page-item next"><a class="page-link" href="paymentBox${pageMaker.makeQuery(pageMaker.endPage)}"> > </a></li>
							</ul>	
                        </div>
                    </div>
                </div>
              
                <!-- 풋터시작 -->
            <%@include file="../includes/footer.jsp" %>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 <script>
 var Info = JSON.parse('${payInfo}');
 $(document).ready(function() { 

	 
	 if(Info != null && Info.length > 0 ) {
			//화면 생성
			var listHtml = "";
			for(var i=0; i<Info.length; i++){
             listHtml += "<tr>";
             listHtml += "	<td name='"+Info[i].apvodad +"'style='cursor:hand; text-align: center;' onClick='detail()'>"+Info[i].apvsq+"</td>";
             listHtml += "	<td style='cursor:hand; text-align: center;'>"+Info[i].apvform+"</td>";
             listHtml += "	<td style='cursor:hand; text-align: center;'>"+Info[i].apvnm+"</td>";
             listHtml += "	<td style='cursor:hand; text-align: center;'>"+Info[i].stfnm+"</td>";
             listHtml += "	<td style='cursor:hand; text-align: center;'>"+Info[i].dptnm+"</td>";
             listHtml += "	<td style='cursor:hand; text-align: center;'>"+Info[i].apvdate+"</td>";
             if(Info[i].state == "A"){
                 listHtml += "<td>결재중..</td>";
                 }else if(Info[i].state == "B"){
                 listHtml += "<td>결재반려</td>";	 
                 }else {
                 listHtml += "<td>결재완료</td>"; 
                 }
             
             
             listHtml += "</tr>";
			}
			$("#noticeList").html(listHtml);
	 }
 });


	 		$("#dataTable").on("click", "#noticeList > tr", function() {
	 		//내가 선택한 영역의 자식
			var td = $( this ).children();
			var form = document.createElement("form");
			form.action = '/paymentBoxDetail?apvsq='+td.eq(0).text();//내가 선택한 영역의 자식 0번째 인덱스 요소 텍스트 값 찾기
		    form.method = "post";
			
		    var apvodad = document.createElement("input");
		    apvodad.setAttribute("value", td.eq(0).attr('name'));

		    form.appendChild(apvodad);
		    document.body.appendChild(form);
		    form.submit();
	 	}); 
</script>
