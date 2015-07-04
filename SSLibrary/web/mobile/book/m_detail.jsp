<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<tbody>
		<tr>
			<th>ID</th>
			<td>${bookdetail.id}</td>
		</tr>
		<tr>
			<th>책제목</th>
			<td>${bookdetail.name}</td>
		</tr>
		<tr>
			<th>저자</th>
			<td>${bookdetail.writer}</td>
		</tr>
		<tr>
			<th>자료실</th>
			<td>${bookdetail.floor}</td>
		</tr>
		<tr>
			<th>보유갯수</th>
			<td>${bookdetail.total_qt}</td>
		</tr>
		<tr>
			<th>대여가능갯수</th>
			<td>${bookdetail.current_qt}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${bookdetail.reg_date}</td>
		</tr>
	</tbody>
</table>

