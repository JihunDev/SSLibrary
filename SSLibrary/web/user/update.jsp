<%@page import="com.entity.User"%>
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
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	
	if(pwd == null || pwd == ''){
		alert("PWD를 입력하세요.");
	}else if(pwd != pwdcheck){
		alert("비밀번호가 같지 않습니다.");
	}else if((pwd.length < 8 || pwd.length > 16) || (pwdcheck.length < 8 || pwdcheck.length > 16)){
		alert("비밀번호는 8자리 이상 16자리 이하로 사용하시기 바랍니다.");	
	}else{
		var c = confirm('수정 하시겠습니까?');
		if (c == true) {
			f.action = 'modifyimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}			
}

function del(f) {
	var c = confirm('삭제 하시겠습니까?');
	var id = f.id.value;
	if (c == true) {
		f.action = 'del.do';/* 추후 수정 */
		f.method = 'POST';
		f.submit();
		alert(id+"님이 탈퇴되셨습니다.")
	};		
}
</script>
<style></style>
</head>
<body>
	<h1>회원수정</h1>
	<form enctype="multipart/form-data">
		<input type="hidden" name="oldimg" value="${userupdate.img}"><br><!-- 원래 등록이미지 -->
		<input type="hidden" name="isadmin" value="${userupdate.isadmin}"><br>
		<input type="hidden" name="id" value="${userupdate.id}"><br>
		<input type="text" name="id" id="id" value="${userupdate.id}" disabled="disabled"><br>
		<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
		<input type="text" name="pwdcheck" id="pwdcheck" placeholder="PWD"><br>
		<input type="text" name="name" value="${userupdate.name}"><br>
		<input type="text" name="phone" value="${userupdate.phone}"><br>
		<input type="text" name="email" value="${userupdate.email}"><br>
		<h5>원래 사진 ${userupdate.img}</h5>
		<input type="file" name="img"><br><!-- 새로운 등록이미지 -->
		<input type="button" value="update" onclick="update(this.form);">
		<input type="button" value="delete" onclick="del(this.form);">
		<!-- delete가 예약어라 del로 줄임 -->
	</form>
</body>
</html>