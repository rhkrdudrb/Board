<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@include file="../includes/header.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">List</h1>
<!--                     <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
<!--                         For more information about DataTables, please visit the <a target="_blank" -->
<!--                             href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
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
                                            <th style="width: 60px; text-align:center;">번호</th>
                                            <th style="width: 120px; text-align:center;">양식</th>
                                            <th style="width: 600px; text-align:center;">제목</th>
                                            <th style="width: 80px; text-align:center;">기안자</th>
                                           <th style="width: 120px; text-align:center;">부서</th>
                                           <th style="width: 80px; text-align:center;">시행일</th>
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
                                    <tbody>
                                        <tr>
                                            <td style="text-align:center;">1</td>
                                            <td style="text-align:center;">ㅇㅁㄴㅇㄴㅁ</td>
                                            <td style="text-align:center;">2021-09-09</td>
                                            <td style="text-align:center;">61</td>
                                          <td style="text-align:center;">61</td>
                                          <td style="text-align:center;">61</td>
                                      
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
           
            <%@include file="../includes/footer.jsp" %>