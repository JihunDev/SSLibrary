<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
	
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>My Rental History (Book)</h1></th>
		</tr>
	</table>	
</div>
	<table width="700" class="table table-hover theadcolor">
		<thead>
			<tr>
				<th>책 등록번호</th>
				<th>사용자</th>
				<th>대여 시간</th>
				<th class="hidden-xs">반납 예정 시간</th>
				<th>반납 완료 시간</th>
				<th class="hidden-xs">연장</th>
		</thead>
		<tbody>
			<c:forEach items="${booklist}" var="b">
				<!-- 추후수정 -->
				<tr>
					<td><a href="bookdetail.do?id=${b.b_id}">${b.b_id}</a></td>
					<td>${b.u_id}</td>
					<td>${b.start_date}</td>
					<td class="hidden-xs">${b.end_date}</td>
					<td>${b.real_date}</td>
					<td class="hidden-xs">${b.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>