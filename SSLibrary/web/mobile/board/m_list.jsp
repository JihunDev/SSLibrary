<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="m_boardwrite.do" class="ui-btn">등록</a>
<table>
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${boardlist}" var="b">
			<tr>
				<td>${b.id}</td>
				<td><a href="m_boarddetail.do?id=${b.id}">${b.title}(${b.reply_num})</a></td>
				<td>${b.u_id}</td>
				<td>${b.reg_date}</td>
				<td>${b.counter}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>