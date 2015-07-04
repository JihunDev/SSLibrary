<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>		
	<thead>
		<tr>
			<th>예약자 ID</th>
			<th>좌석 ID</th>
			<th>예약 시작 시간</th>
			<th>반납 예정 시간</th>
			<th>실 반납 시간</th>
			<th>연장</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${seatloglist}" var='sl'>
			<tr>
				<td>${sl.u_id}</td>
				<td>${sl.s_id}</td>
				<td>${sl.start_date}</td>
				<td>${sl.end_date}</td>
				<td>${sl.real_date}</td>
				<td>${sl.renew_qt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>    