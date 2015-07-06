<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
	
	var borrowbook = $('#borrowbook').val();
	if(borrowbook==1){
		alert("이미 빌린 책입니다.")	
	}else if(borrowbook==2){
		alert("현재 도서가 0개입니다. 대여가 불가능 합니다.")	
	}else if(borrowbook==3){
		alert("대여가 완료되었습니다.");
	}		
});

function rentbook(){
	var  bookid = $('#bookid').val();
	var c = confirm('대여하시겠습니까?');
	if (c == true) {
		location.href ='m_userbookregister.do?id='+bookid;
	};			
}
</script>
<input type="text" id="bookid" value="${bookdetail.id}">
<input type="text" id="borrowbook" value="${borrowbook}">
<button type="button" class="btn btn-default" onclick="rentbook();">대여</button>
<!-- 디테일 페이지 -->
<table width="100%">
	<tbody>
		<tr>
			<th>ID</th>
			<td>${bookdetail.id}</td>
		</tr>
		<tr>
			<th>책제목</th>
			<td>${bookdetail.name}</td>
		</tr>
		<tr>
			<th>저자</th>
			<td>${bookdetail.writer}</td>
		</tr>
		<tr>
			<th>자료실</th>
			<td>${bookdetail.floor}</td>
		</tr>
		<tr>
			<th>보유갯수</th>
			<td>${bookdetail.total_qt}</td>
		</tr>
		<tr>
			<th>대여가능갯수</th>
			<td>${bookdetail.current_qt}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${bookdetail.reg_date}</td>
		</tr>
	</tbody>
</table>




