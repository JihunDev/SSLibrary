<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User) session.getAttribute("user"); %>
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
	<h4>${user.id} 정보</h4>
	<table width="700"> <!-- 추후수정 -->
		<tr><td rowspan="6"><img width="200px" src="img/${user.img}"></td>
		<tr><th>ID</th><td>${user.id}</td></tr>
		<tr><th>PWD</th><td>${user.pwd}</td></tr>
		<tr><th>NAME</th><td>${user.name}</td></tr>
		<tr><th>TEL</th><td>${user.phone}</td></tr>
		<tr><th>e-Mail</th><td>${user.email}</td></tr>
	</table>
	<div>
	<div><a href="usinginfo.do?id=${user.id}">현재이용정보</a></div> <!-- 추후수정 -->
	<div><a href="modify.do?id=${user.id}">개인정보수정</a></div> <!-- 추후수정 -->
	<div><a href="msgloglist.do?id=${user.id}">메세지 내역</a></div> <!-- 추후수정 -->
	</div>
</fieldset>
</body>
</html>