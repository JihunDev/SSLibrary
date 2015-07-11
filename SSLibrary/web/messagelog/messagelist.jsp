<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
	<legend align="center">Message List Page</legend>
	<table width="700" class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>발신자</th>
				<th>내용</th>
				<th class="hidden-xs">발송시간</th>
				<th>확인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messagelog}" var="m">
				<!-- 추후수정 -->
				<tr>
					<td>${m.id}</td>
					<td>${m.sender_id}</td>
					<td><a href="msgdetail.do?id=${m.id}">${m.text}</a></td>
					<td class="hidden-xs">${m.send_date}</td>
					<td>${m.read}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
