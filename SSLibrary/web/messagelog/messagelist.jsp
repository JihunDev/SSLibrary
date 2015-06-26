<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
</script>
<style>
</style>
</head>
<body>
<h1 align="center">Message List Page</h1>
	<table width="700">
		
		<thead>
			<tr>
				<th >번호</th>
				<th>보낸사람 ID</th>
				<th>text</th>
				<th>보낸시간</th>
				<th>읽었나 확인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messagelog}" var="m"> <!-- 추후수정 -->
				<tr>
					<td>${m.id}</td>
					<td>${m.u_id}</td>
					<td><a href="msgdetail.do?id='${m.id}'">${m.text}<a></td>
					<td>${m.send_date}</td>
					<td>${m.read}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>