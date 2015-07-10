<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul id="list" data-role="listview" data-filter="true"
	data-filter-placeholder="Search..." data-inset="true">
	<c:forEach items="${seatloglist}" var="sl" varStatus="board_status">
		<li>
			<h3>좌석 : ${sl.s_id}</h3>
			<p>예약자 : ${sl.u_id}</p>
			<p>시간 : ${sl.start_date} ~ ${sl.real_date}</p> <span
			class="ui-li-count">연장 : ${sl.renew_qt}</span>
		</li>
	</c:forEach>
</ul>