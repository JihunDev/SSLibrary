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
<h1 align="center">내가 대여한 도서들</h1>
<fieldset>
<legend>현재 대여 도서</legend>
<table width="700">
<thead>
<tr><th>책이름</th><th>대여기간</th></tr>
</thead>
<tbody>
<c:forEach items="${mylist}" var="m">
<tr><td>${m.name}</td><td>${m.period}</td></tr>
</c:forEach>
</tbody>
</table>
<div>
<div><a href="bookreturn.do?id=${mypage.id}">반납</a></div> <!-- 추후수정 -->
<div><a href="bookdelay.do?id=${mupage.id}">연장</a></div><!-- 추후수정 -->
</div>
</fieldset>
</body>
</html>