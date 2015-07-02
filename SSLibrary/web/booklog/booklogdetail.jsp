<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script>
function makeHeight() {
	var section = document.querySelector("#section");
	var left = document.querySelector("#left");
	var center = document.querySelector("#center");
	var center_area = document.querySelector('#home_center');
	 
	var mHeight = center_area.clientHeight+50;
	/* ClientHeight를 써서 표 높이만큼 늘리게 함. */
	if (mHeight < 400) {
		mHeight = 400;
	}
	center.style.height = mHeight + 'px';
	section.style.height = mHeight + 'px';
	left.style.height = mHeight + 'px';
};

function displaybook(data) {
	$('#book_result').empty();
	var output = '';
	output+='<table  class="table table-hover">'
	output+='<thead><tr><th >ID</th><th >B_ID</th><th>U_ID</th><th>START_DATE</th><th>END_DATE</th><th>REAL_DATE</th><th>RENEW_QT</th></thead>';
	$(data).each(function(index, item) {
		with (item) {
			output += '<tr><td>'+id+'</td>';
			output += '<td>'+b_id+'</td>';
			output += '<td>'+u_id+'</td>';
			output += '<td>'+start_date+'"></td>';
			output += '<td>'+end_date+'</td>';
			output += '<td>'+real_date+'</td>';
			output += '<td>'+renew_qt+'</td></tr>';
		}
	});
	output+="</table>"
	$('#book_result').html(output);
	makeHeight();

}


function getBook() {
	var imgsearch = $('#search').val();  /* 추후수정 */
	$.ajax({
		type : 'post',
		async:'false', /* 화면에 전송한다음에 내려오기 전에 뿌릴 것이면 false  */
		data:{'id': search},				/* 전송하기 전에 뿌릴 것이면 true*/
		url : 'search.do',
		success:function(data){
			displaybook(data);
			makeHeight();
		}
	});
};
</script>
<div id="home_center">
<input type="text" id="search"><input type="button" value="검색" onclick="getBook();">
<h1 align="center">도서 과거 대여 내역</h1>
<table width="700" class="table table-hover">
<thead><tr><th >ID</th><th >B_ID</th><th>U_ID</th><th>START_DATE</th><th>END_DATE</th><th>REAL_DATE</th><th>RENEW_QT</th></thead>
<tbody>
<c:forEach items="${pastbooklist}" var="b"> <!-- 추후수정 -->
<tr>
<td>${b.id}</td>
<td>${b.b_id}</td>
<td>${b.u_id}</td>
<td>${b.start_date}</td>
<td>${b.end_date}</td>
<td>${b.real_date}</td>
<td>${b.renew_qt}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
