<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
	<fieldset>
		<legend>${userlist.id}의 회원정보</legend>
		<table width="700" class="table table-hover">
			<tr>
				<td rowspan="6"><img width="300px" src="img/user/${userlist.img}"></td>
			<tr>
				<th>ID</th>
				<td>${userlist.id}</td>
			</tr>
			<tr>
				<th>PWD</th>
				<td>${userlist.pwd}</td>
			</tr>
			<tr>
				<th>NAME</th>
				<td>${userlist.name}</td>
			</tr>
			<tr>
				<th>TEL</th>
				<td>${userlist.phone}</td>
			</tr>
			<tr>
				<th>e-Mail</th>
				<td>${userlist.email}</td>
			</tr>
		</table>
	<div class="btn-group">
   <a class="btn btn-default" href="usermodify.do?id=${userlist.id}" role="button">회원정보수정</a>
   <a class="btn btn-default" href="userremoveimpl.do?id=${userlist.id}" role="button">회원삭제</a>
   </div>
	</fieldset>
</div>