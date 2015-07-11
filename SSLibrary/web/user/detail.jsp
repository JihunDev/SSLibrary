<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User) session.getAttribute("user"); %>
<div class="fieldsetform">
<fieldset>
	<legend>회원정보</legend>
	<h4>${user.id} 정보</h4>
	<table class="table table-hover" width="700"> <!-- 추후수정 -->
		<tr><td rowspan="6"><img width="300px" src="img/user/${user.img}"></td>
		<tr><th>ID</th><td>${user.id}</td></tr>
		<tr><th>PWD</th><td>${user.pwd}</td></tr>
		<tr><th>NAME</th><td>${user.name}</td></tr>
		<tr><th>TEL</th><td>${user.phone}</td></tr>
		<tr><th>e-Mail</th><td>${user.email}</td></tr>
	</table>
	<div class="btn-group">
		<a class="btn btn-default" href="modify.do?id=${user.id}">개인정보수정</a>
	</div>
</fieldset>
</div>