<%@page import="com.entity.UserBook"%>
<%@page import="com.entity.UserSeat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% UserSeat userseat = (UserSeat) session.getAttribute("userseat"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
$(document).ready(function(){
	var qt = $('#qt').val();
			if(qt==1){
				alert("2번 연장하셨으므로  더 이상 연장할 수 없습니다.(최대 2번 연장 가능)");	
			}else if(qt==2){
				alert("연장이 완료되었습니다.");	
			}
	});

</script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="qt" value="${qt}">
<fieldset>
	<legend>상세페이지</legend>
		<table border="3" width="700">
			<thead>
				<tr>
					<th colspan="6">현재이용정보</th>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6">현재 예약한 열람실정보</td>
				</tr>
				<tr>
					<td>열람실 좌석</td>
					<td>${userseat.s_id}번 좌석</td>
					<td>연장회수</td>
					<td><a href="#">연장</a></td><!-- 추후수정 -->
					<td rowspan="2"><a href="#">이력</a></td><!-- 추후수정 -->
				</tr>
				<tr>
					<td>사용시간</td>
					<td>${userseat.start_time}~${userseat.end_time}</td>
					<td>${userseat.renew_qt}</td>
					<td><a href="#">반납</a></td><!-- 추후수정 -->
				</tr>
				<tr>
					<td colspan="6">현재대여 도서 정보</td>
				</tr>
				<c:forEach items="${booklist}" var="book" varStatus="status">
				<tr>
					<td>도서번호 : ${book[0]}</td>
					<td colspan="2">대여 기간</td>
					<td><a href="javascript:;" onClick="if (confirm('연장하시겠습니까?')) location.href='userbookmodifyimpl.do?id=${book[0]}'">연장</a></td><!-- 추후수정 -->
					<c:if test="${status.first}">
						<td rowspan="2"><a href="#">이력</a></td><!-- 추후수정 -->
					</c:if>
				</tr>
				<tr>
					<td>책이름 : ${book[1]}</td>
					<td colspan="2">${book[2]}~${book[3]}</td>
					<td><a href="#">반납</a></td><!-- 추후수정 -->
				</tr>
				</c:forEach>
			</tbody>
		</table>
</fieldset>
</body>
</html>