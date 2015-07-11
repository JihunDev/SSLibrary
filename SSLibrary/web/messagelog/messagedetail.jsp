<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="fieldsetform">
<legend align="center">Message</legend>
<table width="700" class="table table-hover"> <!-- 추후수정 -->
		<tr><th>발신자</th><td>${messagelogdetail.u_id}</td></tr>
		<tr><th>내용</th><td>${messagelogdetail.text}</td></tr>
		<tr><th>발신시간</th><td>${messagelogdetail.send_date}</td></tr>
</table>
</div>