<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>My Message</h1></th>
		</tr>
	</table>	
</div>
	<table width="700" class="table table-hover theadcolor">
		<thead>
			<tr>
				<th>번호</th>
				<th>발신자</th>
				<th>내용</th>
				<th class="hidden-xs">발송시간</th>
<!-- 				<th>확인</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messagelog}" var="m">
				<!-- 추후수정 -->
				<c:choose>
				<c:when test="${m.read == 'n'}">
					<tr style="background:#FAED7D;">
				</c:when>
				<c:otherwise>
					<tr>
				</c:otherwise>
				</c:choose>
						<td>${m.id}</td>
						<td>${m.sender_id}</td>
						<td><a href="msgdetail.do?id=${m.id}">${m.text}</a></td>
						<td class="hidden-xs">${m.send_date}</td>
				<%-- <td>${m.read}</td> --%>
					</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
