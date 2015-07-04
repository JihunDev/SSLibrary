<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <table>
		<thead>
			<tr>
				<th>번호</th>
				<th>보낸사람 ID</th>
				<th>text</th>
				<th>보낸시간</th>
				<th>읽었나 확인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messagelog}" var="m">
				<tr>
					<td>${m.id}</td>
					<td>${m.sender_id}</td>
					<td><a href="m_msgdetail.do?id=${m.id}">${m.text}</a></td>
					<td>${m.send_date}</td>
					<td>${m.read}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>