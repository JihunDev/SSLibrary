<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f) {
	if (f.sort.value == null || f.sort.value == "") {
		alert("카테고리를 선택하세요");
		f.sort.focus();
	}
	else if (f.reg_number==0 && f.title.value == null || f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();

	}else{
		
		var c = confirm('수정하시겠습니까?');
	     if (c == true) {
	        f.action = 'boardmodifyimpl.do';
	        f.method = 'POST';
	        f.submit();
	     };
	}
   }
window.onload = function(){
  	var backgroundColor_ = "#fcce18";
  	var color_ = "black";
  	
	
   var sort = "${boardupdate.sort}";
   $("select[name='sort']").val(sort).attr("selected", "selected");
   //게시판에 종류에 따른 SelectBox 옵션 선택      
 	if(sort=="notice"){
		backgroundColor_ = "#acc4cd";
		color_ = "black";
  	}else if(sort=="free"){
		backgroundColor_ = "#b48ec3";
		color_ = "white";
	}
  	
  	$('.theadcolor>thead>tr>th').css({backgroundColor:backgroundColor_, color:color_});
	$('.btncolor').css({backgroundColor:backgroundColor_, color:color_});
	$('.logtabletitle>table>tbody>tr>th').css({backgroundColor:backgroundColor_, color:color_});
}
</script>
<div class="fieldsetform">
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1> Board Update</h1></th>
		</tr>
	</table>	
</div>
<form class="form-inline" enctype="multipart/form-data" >
<input type="hidden" name="id" value="${boardupdate.id}">
<input type="hidden" class="form-control" name="u_id" value="${id}">
<table style="width:100%;">
	<tbody style="vertical-align: middle;">
		<tr>
			<th width="130px"><h4>Category</h4></th>
			<td>
			<select class="form-control input-sm" name="sort" style="width:150px;">
  			    <option value="">선택</option>
			      <option value="notice">공지사항</option>
			      <option value="free">자유게시판</option>
			   </select>
			</td>
		</tr>
		<tr>
			<th><h4>Title</h4></th>
			<td>
			 	<input type="text" class="form-control input-sm" style="width:92%;"  name="title" placeholder="제목을 입력하세요." value="${boardupdate.title}">
			 </td>
		</tr>
		<tr>
			<th><h4>Existing File</h4></th>
			<th style="vertical-align: middle;">
  				 <h5><input type="text" style="border:none;" name="old_file_name" value="${boardupdate.file_name}" disabled></h5>
	  		</th>
		</tr>
		<tr>
			<th><h4>New File</h4></th>
			<td>
  				 <input type="file" class="btn btn-default" style="margin:0;width:250px;" name="file_name">
	  		</td>
		</tr>
	</tbody>
</table>
	<h4>Content</h4>
	<textarea class="form-control" rows="10" cols="120" name="content" style="resize:none">${boardupdate.content}</textarea><br><br>
      <div style="text-align: center;">
  				 <input type="button" class="btn btn-default btncolor" value="수정" onclick="update(this.form)"></span>
   </div>
</form>   
</div>