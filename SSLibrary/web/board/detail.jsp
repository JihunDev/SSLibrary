<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function del(f) {/* delete가 예약어라 del씀 */
	var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'boardremoveimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var reg_number = f.reg_number.value;
	var id = f.id.value;
	//alert(reg_number);
	if(reg_number != 0 && $('#btn_'+id+'').val() == "수정"){// 댓글을 수정하려할때
		var content = f.old_content.value;
		$('#content_'+id+'').html("<input type='text' id='content_id' value='"+content+"'>");
		$('#btn_'+id+'').val("완료");	
		
	}else if(reg_number != 0 && $('#btn_'+id+'').val() == "완료"){// 댓글수정을 완료할때

		var c = confirm('댓글을 수정 하시겠습니까?');
		if (c == true) {
			var content = $('#content_id').val();
			$('input[name="content"]').val(content);
			
			f.action = 'boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
//			$('#content_'+id+'').html(content);
//			$('#btn_'+id+'').val("수정");	

			
		};
	

	} else {
			var c = confirm('수정 하시겠습니까?');
			if (c == true) {
				f.action = 'boardmodify.do';/* 추후 수정 */
				f.method = 'POST';
				f.submit();
			};
	}
}

	function register(f) {
		var c = confirm('댓글을 등록 하시겠습니까?');
		if (c == true) {
			f.action = 'boardwriteimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		}
		;
	}
	
	window.onload = function(){
		var sort = "${boarddetail.sort}";
		if(sort=="notice"){
			$("#thtitle").append("<h1>Notice Board</h1>");
		}else{
			$("#thtitle").html("<h1>Free Board</h1>");			
		}
		
		}
</script>
<style>
.boarddetailtable>thead>tr>th{
	vertical-align: middle;
}
</style>
<div class="fieldsetform">
<c:set var="content_Ent" value="${boarddetail.content}" />
		<%
	   String content = (String) pageContext.getAttribute("content_Ent");
	 %>
<div class="listtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th id="thtitle"></th>
		</tr>
	</table>	
</div>

<fieldset>

<table class="table boarddetailtable" style="width:100%;vertical-align:middle;">
	<thead>
		<tr>
			<th><h4>Title</h4></th>
			<th colspan="3">${boarddetail.title}</th>
		</tr>
		<tr>
			<th><h4>Writer</h4></th>
			<th>${boarddetail.u_id}</th>
			<th><h4>Written Date</h4></th>
			<th>${boarddetail.reg_date}</th>
		</tr>
		<tr>
			<th><h4>Read</h4></th>
			<th>${boarddetail.counter}</th>
			<th><h4>File</h4></th>
			<th><a href="img/board/${boarddetail.file_name}" download>${boarddetail.file_name}</a></th>
		</tr>
		<tr>
			<th><h4>Content</h4></th>
			<th colspan="3"><pre style="text-align:left;border:none;background: none;">${boarddetail.content}</pre></th>
		</tr>
	</thead>
	
	</table>
<form>
	<input type="hidden" name="sort" value="${boarddetail.sort}">
	<input type="hidden" name="id" value="${boarddetail.id}">
	<input type="hidden" name="reg_number" value="${boarddetail.reg_number}">	
	<input type="button" class="btn btn-default" value="목록" onclick="location.href='boardmain.do?search=false&sort=${boarddetail.sort}'">
	<c:if test="${id == boarddetail.u_id || user.isadmin == 'y'}">
		<input type="button" class="btn btn-default" value="삭제" onclick="del(this.form)">
		<input type="button" class="btn btn-default" value="수정" onclick="update(this.form)">
	</c:if>
</form>
	<table  class="table table-condensed boarddetailtable">
		<br><br><br>
		<h5>Reply:</h5>
		<c:forEach items="${boardreply}" var="reply">
		<form>
			<input type="hidden" name="sort" value="${reply.sort}">
			<input type="hidden" name="id" value="${reply.id}">	
			<input type="hidden" name="reg_number" value="${reply.reg_number}">	
			<input type="hidden" name="old_content" value="${reply.content}">	
			<input type="hidden" name="u_id" value="${id}">
			<input type="hidden" name="content" >
			<thead>
			<tr>			
				<th>Writer</th><th>${reply.u_id}</th>
				<th style="text-align:center;">${reply.reg_date}</th>
				<th><c:if test="${id == reply.u_id || user.isadmin == 'y'}">	
				<input type="button" class="btn btn-default btn-xs " value="삭제" onclick="del(this.form)">
				</c:if></th>
			</tr>
			<tr>
				<th>Comment</th>
				<th colspan="2" id = "content_${reply.id}" width="100%"><pre style="text-align:left;border:none;background: none;">${reply.content}</pre></th>
				<td><c:if test="${id == reply.u_id || user.isadmin  == 'y'}"><input type="button" class="btn btn-default btn-xs" id="btn_${reply.id}" value="수정" onclick="update(this.form)"></c:if></td>
			</tr>
			</thead>
		</form>
		</c:forEach>
	</table>
	<form >
	<c:if test="${user.isadmin != 's'}">
	<div style="text-align:left;">
		<input type="hidden" name="reg_number" id="reg_number" value="${boarddetail.id}"><br>
		<input type="hidden" name="sort" value="${boarddetail.sort}"><br>
		<input type="hidden" name="u_id" value="${id}"><br>
		<div class="col-xs-10">
		<div class="form-group">
 		<label for="content">Comment:</label>
 		<textarea class="form-control" rows="5" cols="40" name="content" style="resize:none;width:100%" ></textarea>
		<input type="button" class="btn btn-default" value="등록" onclick="register(this.form)">
		</div>
		</div>
	</div>
	</c:if>
	</form>	
	</fieldset>
</div>
