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
<h1 align="center">Book List Page</h1>
<table width="700">
<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th>
<th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr>
<tbody>
<c:forEach items="${booklist}" var="b">
<tr>
<td><a href="bookdetail.do?id=${b.id}">${b.id}</a></td>
<td>${b.name}</td>
<td>${b.writer}</td>
<td><img width="50px" src="img/${b.img}"></td>
<td>${b.floor}</td>
<td>${b.current_qt}</td>
<td>${b.reg_date}</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>