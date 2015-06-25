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
			f.action = 'a.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
function del(f) {/* delete가 예약어라 del씀 */
	var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'a.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var c = confirm('수정 하시겠습니까?');
		if (c == true) {
			f.action = 'a.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
</script>
<style></style>
</head>
<body>
<h1>board register</h1>
<form>
	<select id="category">
		<option value="">선택</option>
		<option value="n">공지사항</option>
		<option value="f">자유게시판</option>
	</select>
	<input type="text" placeholder="제목을 입력하세요."><br>
	<textarea rows="40" cols="40"></textarea><br>
	<input type="button" value="삭제" onclick="del(this.form)"><!-- 추후 수정 -->
	<input type="submit" value="수정" onclick="update(this.form)"><!-- 추후 수정 -->
	<input type="submit" value="등록" onclick="register(this.form)"><!-- 추후 수정 -->
</form>
</body>
</html>