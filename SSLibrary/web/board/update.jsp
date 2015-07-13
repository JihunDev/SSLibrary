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
window.onload = function(){
	var sort = "${boardupdate.sort}";
	$("select[name='sort']").val(sort).attr("selected", "selected");
	//게시판에 종류에 따른 SelectBox 옵션 선택		
}
</script>
<div class="fieldsetform">
<fieldset>
<legend align="center">board update</legend>
<form class="form-inline" enctype="multipart/form-data" >
	<div class="form-group">    
	<select class="form-control input-sm" name="sort">
		<option value="">선택</option>
		<option value="notice">공지사항</option>
		<option value="free">자유게시판</option>
	</select>
	<input type="text" class="form-control input-sm" name="title" value="${boardupdate.title}"><br><br>
	</div>
	<br>
	<div class="form-group">
	<textarea class="form-control" rows="10" cols="130" name="content" style="resize:none">${boardupdate.content}</textarea><br><br>
	</div>
	<br>
	<div class="form-group">
	<input type="file" class="btn btn-default" style="margin:0;" name="file_name"><br>
	<input type="hidden" name="id" value="${boardupdate.id}">
	</div>
	<div class="form-group">
	<input type="hidden" class="form-control" name="u_id" value="${id}"><span class="input-group-btn">
	<input type="button" class="btn btn-default" value="수정" onclick="update(this.form)"></span>
	</div>
</form>	
</fieldset>
</div>