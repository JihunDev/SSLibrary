<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(function() {
		if ("${returnqt}" == 1) {
			alert("대여반납이 확인되었습니다.");
		}
		var qt = $('#qt').val();
		if (qt == 1) {
			alert("더 이상 연장할 수 없습니다.(최대 2번 연장 가능)");
		} else if (qt == 2) {
			alert("도서 대여 기간 연장이 완료되었습니다.");
		}

	});

	function extendMySeat() {
		if ('${userseat.renew_qt}' != 2) {
			var c = confirm("${userseat.s_id}번 좌석을 연장하시겠습니까??");
			if (c == true) {
				location.href = "m_userseatmodify.do?id=${userseat.s_id}";
				alert("좌석 등록 기간이 연장되었습니다.");
			}
		} else {
			alert("2회 이후로 연장하실 수 없습니다.");
		}

	}
	function returnMySeat() {
		var c = confirm("${userseat.s_id}번 좌석을 반납하시겠습니까??");
		if (c == true) {
			location.href = "m_userseatremove.do?id=${userseat.s_id}";
			alert("좌석을 반납하셨습니다.");
		}

	}
</script>
<!-- 좌석 내역 -->
<table>
	<tr>
		<td>사용좌석 :</td>
		<td colspan="2">${userseat.s_id}번좌석</td>
	</tr>
	<tr>
		<td>사용시간 :</td>
		<td>${userseat.start_time}~${userseat.end_time}</td>
		<td><a href="javascript:;" onClick="extendMySeat();"
			data-role="button">연장</a></td>
	</tr>
	<tr>
		<td>연장횟수 :</td>
		<td>${userseat.renew_qt}</td>
		<td><a href="javascript:;" onClick="returnMySeat();"
			data-role="button">반납</a></td>
	</tr>
	<tr>
		<td colspan="3"><a href="m_seatloglist.do?id=${user.id}"
			data-role="button">내역</a></td>
	</tr>
</table>

<!-- 책 내역 -->
<table>
	<tbody>
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<tr>
				<td>도서번호 :</td>
				<td colspan="2">${book[0]}</td>
			</tr>
			<tr>
				<td>책이름 :</td>
				<td>${book[1]}</td>
				<td><a href="javascript:;"
					onClick="if (confirm('연장하시겠습니까?')) location.href='m_userbookmodifyimpl.do?id=${book[0]}'"
					data-role="button">연장</a></td>
			</tr>
			<tr>
				<td>대여기간 :</td>
				<td>${book[2]}~${book[3]}</td>
				<td><a href="javascript:;"
					onClick="if (confirm('반납하시겠습니까?')) location.href='m_userbookremove.do?id=${book[0]}'"
					data-role="button">반납</a></td>
			</tr>
			<c:if test="${status.last}">
				<tr>
					<td colspan="3"><a href="m_bookloglist.do" data-role="button">내역</a></td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>