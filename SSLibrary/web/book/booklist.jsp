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
<h1 align="center">과거 대여 정보</h1>
<table width="700">
<thead><tr><th >BOOK_ID</th><th>USER_ID</th><th>START_DATE</th>
<th>END_DATE</th><th>REAL_DATE</th><th>RENEW_QT</th></thead>
<tbody>
<c:forEach items="${booklist}" var="b"> <!-- 추후수정 -->
<tr>
<td><a href="bookdetail.do?id=${b.b_id}">${b.b_id}</a></td>
<td>${b.u_id}</td>
<td>${b.start_date}</td>
<td>${b.end_date}</td>
<td>${b.real_date}</td>
<td>${b.renew_qt}</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>