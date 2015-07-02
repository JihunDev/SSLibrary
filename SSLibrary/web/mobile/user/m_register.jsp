<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <a href="login.jsp" class="ui-btn ui-icon-arrow-l ui-btn-icon-left">Back</a><h1>회원 가입</h1>
<form enctype="multipart/form-data">
	<input type="hidden" name="isadmin" value="n"><br> 
	<input type="text" name="id" placeholder="ID">
	<input type="text" name="pwd" placeholder="PWD">
	<input type="text" name="pwdcheck" placeholder="PWD CHECK">
	<input type="text" name="name" placeholder="NAME">
	<input type="text" name="phone" placeholder="PHONE">
	<input type="text" name="email" placeholder="EMAIL">
	<input type="file" name="img" >           
	<input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form);">
</form>
</body>
</html>