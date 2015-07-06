<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
tbody td{
    border-bottom: 1px solid #d6d6d6;
}

tbody th{
    border-bottom: 1px solid #d6d6d6;
}

tr:nth-child(even) {
    background: #e9e9e9;
}
</style>
<table width="100%">
<tbody>
		<tr>
			<th>보낸사람</th>
			<td>${messagelogdetail.u_id}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${messagelogdetail.text}</td>
		</tr>
		<tr>
			<th>보낸시간</th>
			<td>${messagelogdetail.send_date}</td>
		</tr>
	</tbody>
</table>
