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
			f.action = 'registerimpl.do';
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
<style></style>
</head>
<body>
<div class="row centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title text-center">회원가입</h3>
        </div>
            <div class="panel-body">
         <form class="form-horiziontal" role="form" enctype="multipart/form-data">
        <div class="col-md-12">
                <div class="form-group">
                <input type="hidden" name="isadmin" value="n"><br> 
                  <div class="input-group">
                  <input type="text" name="id" id="id" class="form-control" placeholder="ID"><span class="input-group-btn"><input type="button" class="btn btn-primary" value="중복체크" onclick="idcheck(this.form);"></span>
                  </div>
                </div>
                <div class="form-group">
                <input type="text" name="pwd" id="pwd" class="form-control" placeholder="PWD">
                </div>
                <div class="form-group">
                <input type="text" name="pwdcheck" id="pwdcheck" class="form-control" placeholder="PWD CHECK">
                </div> 
                <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="NAME">
                </div>
                <div class="form-group">
                <input type="text" name="phone" class="form-control" placeholder="PHONE">
                </div>
                 <div class="form-group">
                 <input type="text" name="email" class="form-control" placeholder="EMAIL">           
                </div>
                <div class="form-group">
                 <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                </div>
               	<input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form);">
            	</div>
            	</form>
        		</div>
   		  </div>
    </div>
</div>                

</body>
</html>