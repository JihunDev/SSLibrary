<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	function register(f) {
		if (f.sort.value == null || f.sort.value == "") {
			alert("카테고리를 선택하세요");
			f.sort.focus();
		}
		else if (f.reg_number==0 && f.title.value == null || f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();

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
		//게시판에 종류에 따른 SelectBox 옵션 선택		
}
</script>
<div class="fieldsetform">
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1> Board Register</h1></th>
		</tr>
	</table>	
</div>
<form class="form-inline" enctype="multipart/form-data" >

<input type="hidden" name="u_id" value="${id}">
<input type="hidden" name="reg_number" value="0">
<table style="width:100%;">
	<tbody style="vertical-align: middle;">
		<tr>
			<th width="100px"><h4>Category</h4></th>
			<td>
			<select class="form-control input-sm" id="sort" name="sort" style="width:150px;">
				<option value="">선택</option>
				<option value="notice">공지사항</option>
				<option value="free">자유게시판</option>
			</select>
			</td>
		</tr>
		<tr>
			<th><h4>Title</h4></th>
			<td>
				<input type="text" class="form-control" name="title" style="width:98%;" placeholder="제목을 입력하세요."><br>
			 </td>
		</tr>
		<tr>
			<th><h4>File</h4></th>
			<td>
				<input type="file" class="btn btn-default" style="margin:0;" name="file_name">
	  		</td>
		</tr>
	</tbody>
</table>
	
	
	
	<br>
	<h4>Content</h4>
	
	<textarea id="textarea_" class="form-control" rows="10" cols="126" name="content" style="resize:none"></textarea><br><br>
	<div style="text-align: center;" >
		<input type="button" class="btn btn-default btncolor" value="등록" onclick="register(this.form)">
	</div>
</form>
</div>