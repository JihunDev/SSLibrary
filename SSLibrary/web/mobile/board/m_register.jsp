<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function register(f) {
		if (f.sort.value == null || f.sort.value == "") {
			alert("카테고리를 선택하세요");
			f.sort.focus();

		} else {
			var c = confirm('등록 하시겠습니까?');
			if (c == true) {
				f.action = 'm_boardwriteimpl.do';
				f.method = 'POST';
				f.submit();
			};
		}
	}
</script>

<form class="form-inline" enctype="multipart/form-data" >
	<input type="hidden" name="u_id" value="${user.id}">
	<input type="hidden" name="reg_number" value="0">
	<select class="form-control input-sm" id="sort" name="sort">
		<option value="">선택</option>
		<c:if test="${user.isadmin == 'y'}">	
			<option value="notice" >공지사항</option>
		</c:if>
		<option value="free" selected="selected">자유게시판</option>
	</select>
	<input type="text" class="form-control input-sm" name="title" placeholder="제목을 입력하세요.">
	<textarea class="form-control" rows="50" cols="90" name="content"></textarea>
	<input type="file" name="file_name">
	<br>
	<input type="button" class="btn btn-default" value="등록" onclick="register(this.form)">
</form>
    