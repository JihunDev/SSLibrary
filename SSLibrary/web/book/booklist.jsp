<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
	<h1 align="center">과거 대여 정보</h1>

	<table width="700" class="table table-hover">
		<thead>
			<tr>
				<th>책 등록번호</th>
				<th>사용자</th>
				<th>대여일</th>
				<th class="hidden-xs hidden-sm">반납일</th>
				<th>실 반납일</th>
				<th class="hidden-xs hidden-sm">연장 횟수</th>
		</thead>
		<tbody>
			<c:forEach items="${booklist}" var="b">
				<!-- 추후수정 -->
				<tr>
					<td><a href="bookdetail.do?id=${b.b_id}">${b.b_id}</a></td>
					<td>${b.u_id}</td>
					<td>${b.start_date}</td>
					<td class="hidden-xs hidden-sm">${b.end_date}</td>
					<td>${b.real_date}</td>
					<td class="hidden-xs hidden-sm">${b.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>