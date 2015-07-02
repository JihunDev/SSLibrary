<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<body>
<h1 align="center">내가 대여한 도서들</h1>
<fieldset>
<legend>현재 대여 도서</legend>
<table width="700">
<thead>
<tr><th>책이름</th><th>대여기간</th><th></th><th></th></tr>
</thead>
<tbody>
<c:forEach items="${mylist}" var="m">    <!-- 추후 수정 -->
<tr><td>${m.name}</td><td>${m.period}</td><td><a href="bookreturn.do?id=${mypage.id}">반납</a></td><td><a href="bookdelay.do?id=${mypage.id}">연장</a></td></tr>
</c:forEach>
</tbody>
</table>
<div>
</div>
</fieldset>