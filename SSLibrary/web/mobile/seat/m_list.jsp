<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<tbody>
		<c:forEach items="${seatloglist}" var='sl'>
			<tr>
				<td>예약자 :</td>
				<td>${sl.u_id}</td>
			</tr>
			<tr>
				<td>좌석 :</td>
				<td>${sl.s_id}</td>
			</tr>
			<tr>
				<td>예약시작시간 :</td>
				<td>${sl.start_date}</td>
			</tr>
			<tr>
				<td>실반납시간 :</td>
				<td>${sl.real_date}</td>
			</tr>
			<tr>
				<td>연장 :</td>
				<td>${sl.renew_qt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
