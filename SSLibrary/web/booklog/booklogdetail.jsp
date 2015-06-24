<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
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
	output+='<table>'
	output+='<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th><th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>';
	$(data).each(function(index, item) {
		with (item) {
			output += '<tr><td>'+id+'</td>';
			output += '<td>'+name+'</td>';
			output += '<td>'+writer+'</td>';
			output += '<td><img width="50px" src="img/'+img+'"></td>';
			output += '<td>'+floor+'</td>';
			output += '<td>'+ total_qt+'</td>';
			output += '<td>'+current_qt+'</td>';
			output += '<td>'+reg_date+'</td></tr>';
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
<style></style>
</head>
<body>
<div id="home_center">
<input type="text" id="search"><input type="button" value="검색" onclick="getBook();">
<div  id="book_result">
<table width="700">
<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th>
<th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>
<tbody>
<c:forEach items="${booklist}" var="b"> <!-- 추후수정 -->
<tr>
<td><a href="bookdetail.do?id=${b.id}">${b.id}</a></td>
<td>${b.name}</td>
<td>${b.writer}</td>
<td><img width="50px" src="img/${b.img}"></td>
<td>${b.floor}</td>
<td>${b.current_qt}</td>
<td>${b.reg_date}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</body>
</html>