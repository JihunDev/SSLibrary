<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
function register(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	if(id == null || id == ''){
		$('#idpopup').popup('open');
	}else if(pwd == null || pwd == ''){
		$('#pwdpopup').popup('open');
	}else if(pwdcheck == null || pwdcheck ==''){
		$('#pwdcheckpopup').popup('open');
	}else if(pwd != pwdcheck){
		$('#pwdchepopup').popup('open');
	}else if((pwd.length < 8) || (pwd.length > 16) || 
			(pwdcheck.length < 8) || (pwdcheck.length > 16)){
		$('#pwdnumberpopup').popup('open');	
	}else if(name == null || name == ''){
		$('#pwdnamepopup').popup('open');	
	}else{
		$('#registeruser').popup('open');
		$("#regsterbutton").click(function() {
			f.action = 'm_registerimpl.do';
			f.method = 'POST';
			f.submit();
		});
	}			
}

function display(data) {
	if(data=="1"){
		$('#idcheckokpopup').popup('open');	
	}else{
		$('#idcheckfailpopup').popup('open');	
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

<!-- popup -->

<div data-role="popup" id="idpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>ID를 입력하세요.</h2>
	</div>
</div>

<div data-role="popup" id="pwdpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>PWD를 입력하세요.</h2>
	</div>
</div>

<div data-role="popup" id="pwdcheckpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>비밀번호 확인을 입력바랍니다</h2>
	</div>
</div>

<div data-role="popup" id="pwdchepopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>비밀번호가 같지 않습니다.</h2>
	</div>
</div>

<div data-role="popup" id="pwdnumberpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>비밀번호는 8자리 이상 16자리 이하로 사용하시기 바랍니다.</h2>
	</div>
</div>

<div data-role="popup" id="pwdnamepopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>NAME을 입력하세요.</h2>
	</div>
</div>

<div data-role="popup" id="idcheckokpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>사용가능</h2>
	</div>
</div>

<div data-role="popup" id="idcheckfailpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>사용불가능</h2>
	</div>
</div>


<div data-role="popup" id="registeruser">
	<div data-role="header">
		<h1>회원가입</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>등록 하시겠습니까?</h2>
		<button type="button" id="regsterbutton">등록</button>
	</div>
</div>








