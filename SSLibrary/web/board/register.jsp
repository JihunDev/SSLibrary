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
function register(f) {
	var c = confirm('등록 하시겠습니까?');
		if (c == true) {
			f.action = 'boardwriteimpl.do';
			f.method = 'POST';
			f.submit();
		};
	}
</script>
<style></style>
</head>
<body>
<h1>board register</h1>
<form enctype="multipart/form-data" >
<input type="hidden" name="u_id" value="${id}">
<input type="hidden" name="reg_number" value="0">
	<select name="sort">
		<option value="">선택</option>
		<option value="notice">공지사항</option>
		<option value="free">자유게시판</option>
	</select>
	<input type="text" name="title" placeholder="제목을 입력하세요."><br>
	<textarea rows="20" cols="40" name="content"></textarea><br>
	<input type="file" name="file_name"><br> 
	<input type="button" value="등록" onclick="register(this.form)">
</form>
</body>
</html>