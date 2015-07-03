<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!-- 좌석 내역 -->
<table>
	<tr>
		<td>사용좌석 : </td>
		<td>${userseat.s_id}번좌석</td>
	</tr>
	<tr>
		<td>사용시간 : </td>
		<td>${userseat.start_time}~${userseat.end_time}</td>
	</tr>
	<tr>
		<td>연장횟수 : </td>
		<td>${userseat.renew_qt}</td>
	</tr>
</table>
<div data-role="controlgroup" data-type="horizontal">
	<a href="#" data-role="button">연장</a> 
	<a href="#"	data-role="button">반납</a> 
	<a href="#" data-role="button">내역</a>
</div>

<!-- 책 내역 -->
<table>
	<tbody>
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<tr>
				<td>도서번호 : </td>
				<td>${book[0]}</td>
			</tr>
			<tr>
				<td>책이름 : </td>
				<td>${book[1]}</td>
			</tr>
			<tr>
				<td>대여기간 : </td>	
				<td>${book[2]}~${book[3]}</td>
			</tr>
			<div data-role="controlgroup" data-type="horizontal">
				<a href="#" data-role="button">연장</a> 
				<a href="#"	data-role="button">반납</a> 
				
			</div>
			<c:if test="${status.last}">
				<a href="#" data-role="button">내역</a>		
			</c:if>
		</c:forEach>
	</tbody>
</table>