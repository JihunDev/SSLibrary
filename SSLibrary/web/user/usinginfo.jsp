<%@page import="com.entity.UserBook"%>
<%@page import="com.entity.UserSeat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% UserSeat userseat = (UserSeat) session.getAttribute("userseat"); %>
<% UserBook userbook = (UserBook) session.getAttribute("userbooklist"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fieldset>
	<legend>상세페이지</legend>
		<table border="3" width="400">
			<thead>
				<tr>
					<th colspan="5">현재이용정보</th>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">현재 예약한 열람실정보</td>
				</tr>
				<tr>
					<td>열람실</td>
					<td>좌석</td>
					<td>연장회수</td>
					<td><a href="#">연장</a></td>
					<td rowspan="2"><a href="#">이력</a></td>
				</tr>
				<tr>
					<td colspan="2">사용시간</td>
					<td>1</td>
					<td><a href="#">반납</a></td>
				</tr>
					<tr>
					<td colspan="5">현재대여 도서 정보</td>
				</tr>
				<tr>
					<td>도서번호</td>
					<td colspan="2">대여기간</td>
					
					<td><a href="#">연장</a></td>
					<td rowspan="2"><a href="#">이력</a></td>
				</tr>
				<tr>
					<td>책이름</td>
					<td colspan="2">사용시간</td>
					<td><a href="#">반납</a></td>
				</tr>
			</tbody>
		</table>
</fieldset>
</body>
</html>