<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			f.action = 'usermodifyimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}			
}
</script>
<h1>회원수정</h1>
<form enctype="multipart/form-data">
	<c:choose>
		<c:when test="${userupdate.isadmin=='y'}"> 
			<select name="isadmin">
				<option value="y" selected>관리자</option>
				<option value="n">회원</option>
				<option value="s">정지 회원</option>
			</select>
		</c:when>
		<c:when test="${userupdate.isadmin=='n'}"> 
			<select name="isadmin">
				<option value="y">관리자</option>
				<option value="n" selected>회원</option>
				<option value="s">정지 회원</option>
			</select>
		</c:when>
		<c:when test="${userupdate.isadmin=='s'}"> 
			<select name="isadmin">
				<option value="y">관리자</option>
				<option value="n">회원</option>
				<option value="s" selected>정지 회원</option>
			</select>
		</c:when>
	</c:choose>
	<input type="hidden" name="oldimg" value="${userupdate.img}"><br><!-- 원래 등록이미지 -->
	<input type="hidden" name="id" value="${userupdate.id}"><br>
	<input type="text" name="id" id="id" value="${userupdate.id}" disabled="disabled"><br>
	<input type="text" name="pwd" id="pwd" value="${userupdate.pwd}"><br>
	<input type="text" name="pwdcheck" id="pwdcheck" value="${userupdate.pwd}"><br>
	<input type="text" name="name" value="${userupdate.name}"><br>
	<input type="text" name="phone" value="${userupdate.phone}"><br>
	<input type="text" name="email" value="${userupdate.email}"><br>
	<h5>원래 사진 ${userupdate.img}</h5>
	<input type="file" name="img"><br><!-- 새로운 등록이미지 -->
	<input type="button" value="update" onclick="update(this.form);">
</form>