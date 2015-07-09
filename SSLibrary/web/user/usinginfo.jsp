<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.UserBook"%>
<%@page import="com.entity.UserSeat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	UserSeat userseat = (UserSeat) session.getAttribute("userseat"); 
	ArrayList<UserBook> booklist = (ArrayList<UserBook>) session.getAttribute("booklist"); 
%>
<script>
$(document).ready(function(){
	if("${returnqt}"==1){
		alert("대여반납이 확인되었습니다.");
	}
	var qt = $('#qt').val();
			if(qt==1){
				alert("더 이상 연장할 수 없습니다.(최대 2번 연장 가능)");	
			}else if(qt==2){
				alert("도서 대여 기간 연장이 완료되었습니다.");	
			}

	});

function extendMySeat(){
	if('${userseat.renew_qt}' != 2){
		var c = confirm("${userseat.s_id}번 좌석을 연장하시겠습니까??");
		if(c == true){
			location.href = "userseatmodify.do?id=${userseat.s_id}";
			alert("좌석 등록 기간이 연장되었습니다.");
		}
	}else{
		alert("2회 이후로 연장하실 수 없습니다.");
	}
	
}
function returnMySeat(){
		var c = confirm("${userseat.s_id}번 좌석을 반납하시겠습니까??");
		if(c == true){
			location.href = "userseatremove.do?id=${userseat.s_id}";
			alert("좌석을 반납하셨습니다.");
		}
	
}
</script>
<div class="fieldsetform">
<input type="hidden" id="qt" value="${qt}">
<fieldset>
	<legend>상세페이지</legend>
		<table width="670" class="table table-hover">
			<thead>
				<tr>
					<th colspan="4">현재이용정보</th>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">현재 예약한 열람실정보</td>
				</tr>
				
				<tr>
					<td>열람실 좌석</td>
					<td>${userseat.s_id}번 좌석</td>
					<td>연장회수</td>
					<td><a class="btn btn-primary" href="javascript:;" onClick="extendMySeat();">연장</a></td><!-- 추후수정 -->
				</tr>
				<tr>
					<td>사용시간</td>
					<td>${userseat.start_time}~${userseat.end_time}</td>
					<td>${userseat.renew_qt}</td>
					<td><a class="btn btn-primary" href="javascript:;" onClick="returnMySeat();">반납</a></td><!-- 추후수정 -->
				</tr>
				<tr>
				<tr>
					<td colspan="4"><a class="btn btn-primary btn-block" href="seatloglist.do?id=${user.id}">이력</a></td>
				</tr>
				<tr>
					<td colspan="4">현재대여 도서 정보</td>
				</tr>
				<c:forEach items="${booklist}" var="book" varStatus="status">
					<tr>
						<td>도서번호 : ${book[0]}</td>
						<td colspan="2">대여 기간</td>
						<td><a class="btn btn-primary" href="javascript:;" onClick="if (confirm('연장하시겠습니까?')) location.href='userbookmodifyimpl.do?id=${book[0]}'">연장</a></td><!-- 추후수정 -->
					</tr>
					<tr>
						<td>책이름 : ${book[1]}</td>
						<td colspan="2">${book[2]}~${book[3]}</td>
						<td><a class="btn btn-primary" href="javascript:;"  onClick="if (confirm('반납하시겠습니까?')) location.href='userbookremove.do?id=${book[0]}'">반납</a></td><!-- 추후수정 -->
					</tr>
					<c:if test="${status.last}">
						<tr>
							<td colspan="4"><a class="btn btn-primary btn-block" href="seatloglist.do?id=${user.id}">이력</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
</fieldset>
</div>