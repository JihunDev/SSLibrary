<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>

/* window.onload = function() {
	alert("ehoa");
};
$(document).ready(function() {
	alert("ehoa");
}); */
//alert이 동작하지 않음 여기서 그만둠

</script>
<style></style>
</head>
<body>
<fieldset>
	<legend>Login</legend>
		<form>
			<input type="text" name="id" id="id" placeholder="ID"><br>
			<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
			<input type="button" value="login" onclick="login(this.form);">
			<a href="register.do">등록</a><!-- 추후수정 -->
		</form>
</fieldset>
</body>
</html>