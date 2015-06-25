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
function register(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	$.ajax({
		type : 'POST',
		anync : 'false',
		url : 'loginimpl.do',/* 추후 수정 */
		data : {
			'id' : id,
			'pwd' : pwd			
		},
		success : function(data) {
			display(data);
		}
	});
}

function display(data) {
	if(data==null||data==''){
		
	}else{
		alert("아이디와 비밀번호가 맞지 않습니다. 다시 입력해주세요");
	}
}
</script>
<style></style>
</head>
<body>
<h1>Left</h1>
<fieldset>
	<legend>Login</legend>
		<form action="loginimpl.do" method="POST">
			<input type="text" name="id" id="id" placeholder="ID"><br>
			<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
			<input type="submit" value="login">
			<a href="register.do">등록</a><!-- 추후수정 -->
		</form>
</fieldset>
</body>
</html>