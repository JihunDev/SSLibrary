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
	
	if(id == null || id == ''){
		alert("ID를 입력하세요.");
	}else if(pwd == null || pwd == ''){
		alert("PWD를 입력하세요.");
	}else if(pwd != pwdcheck){
		alert("비밀번호가 같지 않습니다.");
	}else if(name == null || name == ''){
		alert("NAME을 입력하세요.");
	}else{
		var c = confirm('등록 하시겠습니까?');
		if (c == true) {
			f.action = '.do';
			f.method = 'POST';
			f.submit();
		};
	}			
}

function del(f) {
		var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'del.do';
			f.method = 'POST';
			f.submit();
		};		
}

</script>
<style></style>
</head>
<body>
	<h1>회원수정</h1>
	<form>
		<input type="hidden" name="oldimg" value="#{user.img}"><br><!-- 원래 등록이미지 -->
		<input type="hidden" name="isadmin" value="#{user.isadmin}"><br>
		<input type="text" name="id" id="id" value="#{user.id}" disabled="disabled"><br>
		<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
		<input type="text" name="pwdcheck" id="pwdcheck" placeholder="PWD"><br>
		<input type="text" name="name" value="#{user.name}"><br>
		<input type="text" name="phone" varue><br>
		<input type="text" name="birth" placeholder="BIRTH"><br>
		<input type="file" name="img"><br><!-- 새로운 등록이미지 -->
		<input type="button" value="update" onclick="update(this.form);">
		<input type="button" value="delete" onclick="del(this.form);">
		<!-- delete가 예약어라 del로 줄임 -->
	</form>
</body>
</html>