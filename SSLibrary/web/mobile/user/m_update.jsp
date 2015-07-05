<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div data-role="content">
	<form enctype="multipart/form-data">
		<input type="hidden" name="isadmin" value="n"><br> 
		<input type="text" name="id" placeholder="ID">
		<input type="text" name="pwd" placeholder="PWD">
		<input type="text" name="pwdcheck" placeholder="PWD CHECK">
		<input type="text" name="name" placeholder="NAME">
		<input type="text" name="phone" placeholder="PHONE">
		<input type="text" name="email" placeholder="EMAIL">
		<input type="file" name="img" >           
		<input type="button" class="btn btn-primary btn-block" value="update" onclick="register(this.form);">
		<input type="button" class="btn btn-primary btn-block" value="delete" onclick="register(this.form);">
	</form>
</div>
