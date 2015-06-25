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
<h1 align="center">내 발권 정보</h1>
<fieldset>
<legend>내 발권 좌석</legend>
<table width="700">
<thead>
<tr><th>발권 좌석</th><th>사용 시간</th><th></th><th></th></tr>
</thead>
<tbody>
<c:forEach items="${myseatlist}" var="m">    <!-- 추후 수정 -->
<tr><td>${m.id}</td><td>${m.period}</td><td><a href="userseatremove.do?id=${mypage.id}">반납</a></td><td><a href="userseatmodify.do?id=${mypage.id}">연장</a></td></tr>
</c:forEach>
</tbody>
</table>
<div>
</div>
</fieldset>
</body>
</html>