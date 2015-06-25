<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% User user = (User) session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fieldset>
	<legend>mainpage</legend>
			<table>
			<tbody>
			<tr>
				<td rowspan="3"><img src="${user.img}"></td>
				<td>${user.id}님</td>
			</tr>
			<tr>
				<td>환영합니다.</td>
			</tr>
			<tr>
				<td><a href="detail.do?id='${user.id}'">마이페이지</a></td>
			</tr>
			</tbody>
			
			</table>
						
</fieldset>
</body>
</html>