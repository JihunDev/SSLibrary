<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<table>
	<tr>
		<th>보낸 사람</th>
		<td>${messagelogdetail.u_id}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${messagelogdetail.text}</td>
	</tr>
	<tr>
		<th>보낸 시간</th>
		<td>${messagelogdetail.send_date}</td>
	</tr>
</table>
