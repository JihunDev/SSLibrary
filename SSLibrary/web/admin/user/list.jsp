<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script></script>
<style></style>
</head>
<form action="usersearchname.do" method="POST">
	<select name="isadmin">
		<option value="">전체</option>
		<option value="n">회원</option>
		<option value="s">정지</option>
	</select>
	<input type="text" name="name" >
	<input type="submit" value="검색">
</form>
<body>
	<h1>User list</h1>
	<div>
	
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>PWD</th>
					<th>NAME</th>
					<th>TEL</th>
					<th>E-MAIL</th>
					<th>회원상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist}" var="u">
					<tr>
						<td><a href="userdetail.do?id=${u.id}">${u.id}</a></td>
						<td>${u.pwd}</td>
						<td>${u.name}</td>
						<td>${u.phone}</td>
						<td>${u.email}</td>
						<td>${u.isadmin}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>