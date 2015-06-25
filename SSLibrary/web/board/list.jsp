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
<style></style>
</head>
<body>
<h1>board list</h1>
	<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardlist}" var="b">
					<tr>
						<td>${b.id}</td>
						<td><a href="a.do?id='${b.title}'">${b.title}</a></td><!-- 추후 수정 -->
						<td>${b.u_id}</td>
						<td>${b.reg_date}</td>
						<td>${b.counter}</td>
					</tr>
				</c:forEach>
			</tbody><!-- test후 페이지 넘어가는 거 만듬 -->
		</table>
<div>
<input type="button" value="등록" onclick="a.do?id='${b.id}'"><!-- 추후수정 -->
</div>
</body>
</html>