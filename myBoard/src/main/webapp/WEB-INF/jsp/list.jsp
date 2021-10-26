<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
%>
<title>title</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src=//unpkg.com/vue></script>
<script src=//unpkg.com/vuebars@0.1.6></script>
<body onLoad="init()">
<!-- <body> -->
<%-- ${resultStr} --%>
<table width=50% border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="4">MVC 게시판</td>
		<td align=right>
			<font size=2>로그인 : ${id }님 </font>
		</td>
	</tr>
	  <div class="container">
        <table class="table table-hover table-striped text-center" style="border:1px solid;">
            <colgroup>
                <col width="10%" />
                <col width="50%" />
                <col width="20%" />
                <col width="20%" />
            </colgroup>
            <thead>
                <tr>
                    <th >번호</th>
                    <th >제목</th>
                    <th >작성자</th>
                    <th >등록일자</th>
                </tr>
            </thead>
 
            <tbody>
                <tr>
                    <td id="id1"></td>
                    <td id="id2"></td>
                    <td id="id3"></td>
                    <td id="id4"></td>
                </tr>
            </tbody>
        </table>
        
        <template>
  <div class="base-demo" style="width: 400px">
    <vue-table-dynamic :params="params"></vue-table-dynamic>
  </div>
</template>
        
		<div id="app">
		  <bars
		    :data="[1, 20, -5, 9, 5, 10, 3, 5, 5, 12, 1, 8, 2, 9, 14]"
		    :gradient="['#6fa8dc', '#42b983']"
		    :barWidth="5"
		    :growDuration="4">
		  </bars>
		</div>
        <div id="app">{{message}}</div>
        <hr/>
        <a class="btn btn-outline-info" style="float:right">글쓰기</a>
    </div>
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
var app = new Vue({
	  el: '#app',
	  data: {
	    message: '안녕하세요 Vue!'
	  }
	})
function init() {
	
	let resultStr = JSON.parse('${resultStr}');
	for (i = 0; i < resultStr.length; i++) {
	
	let div1 = document.createElement("div");
	div1.textContent = resultStr[i].a1;
	
	let div2 = document.createElement("div");
	div2.textContent = resultStr[i].a2;
	
	let div3 = document.createElement("div");
	div3.textContent = resultStr[i].a3;
	$("#id1").append(resultStr[i].a3);
	
	document.body.appendChild(div1);
	document.body.appendChild(div2);
	document.body.appendChild(div3);
	}
}
</script>
</html>