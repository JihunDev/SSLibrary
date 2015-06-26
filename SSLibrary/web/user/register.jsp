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
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	if(id == null || id == ''){
		alert("ID를 입력하세요.");
	}else if(pwd == null || pwd == ''){
		alert("PWD를 입력하세요.");
	}else if(pwdcheck == null || pwdcheck ==''){
		alert("비밀번호 확인을 입력바랍니다");
	}else if(pwd != pwdcheck){
		alert("비밀번호가 같지 않습니다.");
	}else if((pwd.length < 8) || (pwd.length > 16) || 
			(pwdcheck.length < 8) || (pwdcheck.length > 16)){
		alert("비밀번호는 8자리 이상 16자리 이하로 사용하시기 바랍니다.");	
	}else if(name == null || name == ''){
		alert("NAME을 입력하세요.");
	}else{
		var c = confirm('등록 하시겠습니까?');
		if (c == true) {
			f.action = 'registerimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}			
}

function display(data) {
	var output = '';
	if(data=="1"){
		output ="사용가능";
	}else{
		output ="사용불가능";
	}
	$('#idcheck').html(output);
}

function idcheck(g) {
	var id = g.id.value;
	$.ajax({
		type : 'POST',
		async : 'false',
		url : 'idcheck.do',
		data : {'id' : id},
		success : function(data){
			alert(data);
			display(data);
		}
	});
}
</script>
<style></style>
</head>
<body>
	<div>
		<h1>회원가입</h1>
		<form enctype="multipart/form-data" >
			<input type="hidden" name="isadmin" value="n"><br> 
			<input type="text" name="id" id="id" placeholder="ID">
			<input type="button" value="중복체크" onclick="idcheck(this.form);"><br>
			<div id="idcheck"></div>
			<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
			<input type="text" name="pwdcheck" id="pwdcheck" placeholder="PWD"><br>
			<input type="text" name="name" placeholder="NAME"><br> 
			<input type="text" name="phone" placeholder="PHONE"><br> 
			<input type="text" name="email" placeholder="EMail"><br> 
			<input type="file" name="img"><br> 
			<input type="button" value="register" onclick="register(this.form);">
		</form>
	</div>
</body>
</html>