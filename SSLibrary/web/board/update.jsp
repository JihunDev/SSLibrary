<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f) {
	var c = confirm('수정하시겠습니까?');
		if (c == true) {
			f.action = 'boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
		};
	}
</script>

<h1>board update</h1>
<form enctype="multipart/form-data" >

	<select name="sort">
		<option value="">선택</option>
		<option value="notice">공지사항</option>
		<option value="free">자유게시판</option>
	</select>
	
	<input type="text" name="title" value="${boardupdate.title}"><br>
	<textarea rows="20" cols="40" name="content">${boardupdate.content}</textarea><br>
	<input type="file" name="file_name"><br> 
	<input type="text" name="u_id" value="${id}">
	<input type="hidden" name="id" value="${boardupdate.id}">
	
	<input type="button" value="수정" onclick="update(this.form)"><!-- 추후 수정 -->
</form>	
