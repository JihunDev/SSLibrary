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
				f.action = 'boardwriteimpl.do';
				f.method = 'POST';
				f.submit();
			};
		}
	}
	window.onload = function(){
		var sort = "${sort}";
		$("select[name='sort']").val(sort).attr("selected", "selected");
		makeHeight();
		//게시판에 종류에 따른 SelectBox 옵션 선택		
	}
</script>
<div class="fieldsetform">
<fieldset>
<legend align="center">Board Register</legend>
<form class="form-inline" enctype="multipart/form-data" >

<input type="hidden" name="u_id" value="${id}">
<input type="hidden" name="reg_number" value="0">
	<select class="form-control input-sm" id="sort" name="sort">
		<option value="">선택</option>
		<option value="notice">공지사항</option>
		<option value="free">자유게시판</option>
	</select>
	<input type="text" class="form-control input-sm" name="title" placeholder="제목을 입력하세요."><br>
	<br>
	<textarea class="form-control" rows="10" cols="90" name="content" style="resize:none"></textarea><br><br>
	<input type="file" name="file_name"><br>
	<input type="button" class="btn btn-default" value="등록" onclick="register(this.form)">
</form>
</fieldset>
</div>