<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
		if (c == true) {http://localhost/SSLibrary/m_register.do
			f.action = 'm_registerimpl.do';
			f.method = 'POST';
			f.submit();
		};
	}			
}

function display(data) {
	if(data=="1"){
		alert("사용가능");
	}else{
		alert("사용불가능");
	}
}

function idcheck(g) {
	var id = g.id.value;
	$.ajax({
		type : 'POST',
		async : 'false',
		url : 'idcheck.do',
		data : {'id' : id},
		success : function(data){
			display(data);
		},
		error : function(data) {
	        alert("에러발생"+data);
      }
	});
}
</script>
<div data-role="content">
	<form enctype="multipart/form-data">
		<input type="hidden" name="isadmin" value="n"><br> 
		<input type="text" name="id" placeholder="ID">
		<input type="button" class="ui-btn ui-mini" value="중복확인" onclick="idcheck(this.form)"><br>
		<input type="text" name="pwd" placeholder="PWD">
		<input type="text" name="pwdcheck" placeholder="PWD CHECK">
		<input type="text" name="name" placeholder="NAME">
		<input type="text" name="phone" placeholder="PHONE">
		<input type="text" name="email" placeholder="EMAIL">
		<input type="file" name="img" >           
		<input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form)">
	</form>
</div>
