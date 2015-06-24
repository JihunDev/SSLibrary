<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style></style>
</head>
<body>
<fieldset>
	<legend>회원정보</legend>
	<h4>$(userdtail.id) 정보</h4>
	<table width="700"> <!-- 추후수정 -->
		<tr><td rowspan="6"><img width="200px" src="img/${b.img}"></td><th>ID</th><td>${b.id}</td></tr>
		<tr><th>ID</th><td>${userdtail.id}</td></tr>
		<tr><th>PWD</th><td>${userdtail.pwd}</td></tr>
		<tr><th>NAME</th><td>${userdtail.name}</td></tr>
		<tr><th>TEL</th><td>${userdtail.phone}</td></tr>
		<tr><th>e-Mail</th><td>${userdtail.email}</td></tr>
	</table>
	<div>
	<div><a href="bookremoveimpl.do?id=${bookdetail.id}">삭제</a></div> <!-- 추후수정 -->
	<div><a href="bookmodify.do?id=${bookdetail.id}">수정</a></div> <!-- 추후수정 -->
	</div>
</fieldset>
</body>
</html>