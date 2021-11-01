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
                        <select id="job" name="job" size="1">
				            <option value="">선택하세요</option>
				            <option value="">법인카드사용승인서</option>
				            <option value="">휴가신청서</option>
				            <option value="">출장신청서</option>
				            <option value="">지출결의서</option>
				            <option value="">조퇴계</option>
				        </select>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr >
                                          <td style="text-align:center;">법인카드사용승인서</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     
						                  

                                    </tbody>
                                </table>
                                <textarea class="form-control" id="p_content"></textarea>
								 <ul class="pagination">
								  
								   <li class="paginate_button page-item previous"><a class="page-link" href="test${pageMaker.makeQuery(pageMaker.startPage - 1)}"> < </a></li>
								  
								  <c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" >
								   <li class="paginate_button page-item"><a class="page-link" href="test${pageMaker.makeQuery(idx)}">${idx}</a></li>
								  </c:forEach>
								    
								
								   <li class="paginate_button page-item next"><a class="page-link" href="test${pageMaker.makeQuery(pageMaker.endPage)}"> > </a></li>
							</ul>	
                        </div>
                    </div>
                </div>
                <!-- 풋터시작 -->
            <%@include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('p_content'
                                 , {height: 500                                                  
                                 });

 $(document).ready(function() { 
	 

 });
 
 
 </script>