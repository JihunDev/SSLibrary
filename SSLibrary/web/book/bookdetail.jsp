<%@page import="com.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%String id = request.getParameter("id");  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style></style>
</head>
<body>
<h1 align="center">Book Detail Page</h1>
<fieldset>
<legend>Book Detail</legend>
<table width="700"> <!-- 추후수정 -->
<tr><td rowspan="6"><img width="200px" src="img/book/${bookdetail.img}"></td><th>ID</th><td>${bookdetail.id}</td></tr>
<tr><th>책제목</th><td>${bookdetail.name}</td></tr>
<tr><th>저자</th><td>${bookdetail.writer}</td></tr>
<tr><th>자료실</th><td>${bookdetail.floor}</td></tr>
<tr><th>보유갯수</th><td>${bookdetail.total_qt}</td></tr>
<tr><th>등록일</th><td>${bookdetail.reg_date}</td></tr>
</tbody>
</table>
<div>
<div><a href="bookremoveimpl.do?id=${bookdetail.id}">삭제</a></div> <!-- 추후수정 -->
<div><a href="bookmodify.do?id=${bookdetail.id}">수정</a></div> <!-- 추후수정 -->
</div>
</fieldset>
</body>
</html>