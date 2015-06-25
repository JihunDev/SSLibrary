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
function update(f) {
	var c = confirm('수정되었습니다.');
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
<h1>board update</h1>
<form>

	<select id="boradsort">
		<option value="">선택</option>
		<option value="n">공지사항</option>
		<option value="f">자유게시판</option>
	</select>

	<input type="text" id="title" value="${boardupdate.title}"><br>
	<textarea rows="40" cols="40" id="text">${boarddetail.content}</textarea><br>
	
	<input type="button" value="수정" onclick="update(this.form)"><!-- 추후 수정 -->
</form>	
</body>
</html>