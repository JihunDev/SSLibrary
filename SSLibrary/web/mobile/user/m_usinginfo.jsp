<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!-- 좌석 내역 -->
<table>
	<tr>
		<td>사용좌석 : </td>
		<td colspan="2">${userseat.s_id}번좌석</td>
	</tr>
	<tr>
		<td>사용시간 : </td>
		<td>${userseat.start_time} ~ ${userseat.end_time}</td>
		<td><a href="#" data-role="button">연장</a></td>
	</tr>
	<tr>
		<td>연장횟수 : </td>
		<td>${userseat.renew_qt}</td>
		<td><a href="#"	data-role="button">반납</a></td>
	</tr>
	<tr>
		<td colspan="3"><a href="#" data-role="button">내역</a></td>
	</tr>
</table>

<!-- 책 내역 -->
<table>
	<tbody>
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<tr>
				<td>도서번호 : </td>
				<td colspan="2">${book[0]}</td>
			</tr>
			<tr>
				<td>책이름 : </td>
				<td>${book[1]}</td>
				<td><a href="#" data-role="button">연장</a></td>
			</tr>
			<tr>
				<td>대여기간 : </td>	
				<td>${book[2]}~${book[3]}</td>
				<td><a href="#"	data-role="button">반납</a></td>
			</tr>
			<c:if test="${status.last}">
				<tr>
					<td colspan="3">
						<a href="#" data-role="button">내역</a>
					</td>	
				</tr>	
			</c:if>
		</c:forEach>
	</tbody>
</table>