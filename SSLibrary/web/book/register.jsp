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
function register(f){
	var id = f.id.value;
	var name = f.name.value;
 	var writer = f.writer.value;
 	var img = f.img.value;
 	var total_qt = f.total_qt.value;
 	var floor = f.floor.value;
	
	if(id == null || id == ''){
		alert('ID를 입력하세요');
		f.id.focus();
		return;
	};
	if(name == null || name == ''){
		alert('NAME를 입력하세요');
		f.name.focus();
		return;
	};
	if(writer == null || writer == ''){
		alert('WRITER를 입력하세요');
		f.name.focus();
		return;
	};
	if(img == null || img == ''){
		alert('IMG를 넣어주세요');
		f.name.focus();
		return;
	};
	if(floor == '선택'){
		alert('층수를 선택해주세요');
		f.name.focus();
		return;
	};
 	if(total_qt== null || total_qt == ''){
		alert('수량을 입력하세요');
		return;
	};
	
	var c = confirm('등록하시겠습니까?');
	if(c==true){
		f.action='bookregisterimpl.do';
		f.method = 'POST';
		f.submit();
	} 
};
</script>
<style></style>
</head>
<body>
<h1 align="center">Book Register</h1>
<fieldset>
<legend>책 등록 양식</legend>
<form enctype="multipart/form-data">
<table>
<tr><th>ID</th><td align="right"><input type="text" name="id" placeholder="ID"></td></tr>
<tr><th>NAME</th><td align="right"><input type="text" name="name" placeholder="NAME"></td></tr>
<tr><th>WRITER</th><td align="right"><input type="text" name="writer" placeholder="WRITER"></td></tr>
<tr><th>IMG</th><td align="right"><input type="file" name="img"></td></tr>
<tr><th>FLOOR</th><td align="right"><select name="floor"><option>선택</option><option>1층</option><option>2층</option><option>3층</option><option>4층</option></select></td></tr>
<tr><th>TOTAL_QT</th><td align="right"><input type="text" name="total_qt" placeholder="TOTAL_QT"></td></tr>
<tr><th></th><td align="right"><input type="button" value="register" onclick="register(this.form);"></td></tr>
</table>
</form>
</fieldset>
</body>
</html>