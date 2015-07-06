<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table width="100%">
	<tbody>
		<c:forEach items="${booklist}" var='b'>
			<tr>
				<td>대여자 :</td>
				<td>${b.u_id}</td>
			</tr>
			<tr>
				<td>책번호 :</td>
				<td><a href="m_bookdetail.do?id=${b.b_id}">${b.b_id}</a></td>
			</tr>
			<tr>
				<td>예약시작시간 :</td>
				<td>${b.start_date}</td>
			</tr>
			<tr>
				<td>실반납시간 :</td>
				<td>${b.real_date}</td>
			</tr>
			<tr>
				<td>연장 :</td>
				<td>${b.renew_qt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
