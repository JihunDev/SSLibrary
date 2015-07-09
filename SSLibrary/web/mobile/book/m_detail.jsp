<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	var borrowbook = "${borrowbook}";
	alert(borrowbook);
	if(borrowbook==1){
		$('#borrowbook1').popup('open');
	}else if(borrowbook==2){
		$('#borrowbook2').popup('open');	
	}else if(borrowbook==3){
		$('#borrowbook3').popup('open');
	}		
});

function rentbook(){
	var  bookid = "${bookdetail.id}";
	$('#rentbook').popup('open');
	$("#rentbookbutton").click(function() {
		location.href ='m_userbookregister.do?id='+bookid;
	});			
}
</script>
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


<!-- popup -->
<div data-role="popup" id="borrowbook1">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>이미 빌린 책입니다.</h2>
	</div>
</div>

<div data-role="popup" id="borrowbook2">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>현재 도서가 0개입니다. 대여가 불가능 합니다.</h2>
	</div>
</div>

<div data-role="popup" id="borrowbook3">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>대여가 완료되었습니다.</h2>
	</div>
</div>

<div data-role="popup" id="rentbook">
	<div data-role="header">
		<h1>대여 확인</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>대여 하시겠습니까?</h2>
		<button type="button" id="rentbookbutton">확인</button>
	</div>
</div>