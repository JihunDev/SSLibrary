<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>
<script>
	$(document).ready(function() {
		resize();
		var borrowbook = $('#borrowbook').val();
		if (borrowbook == 1) {
			alert("이미 빌린 책입니다.")
		} else if (borrowbook == 2) {
			alert("현재 도서가 0개입니다. 대여가 불가능합니다.")
		} else if (borrowbook == 3) {
			alert("대여가 완료되었습니다.");
		} else if (borrowbook == 4) {
			alert("관리자가 반납확인 전이어서 대여가 불가능합니다.")
		}
	});

	function rentbook() {
		var bookid = $('#bookid').val();
		var c = confirm('대여하시겠습니까?');
		if (c == true) {
			location.href = 'userbookregister.do?id=' + bookid;
		}
		;
	};

	function deletebook() {
		var current_qt = "${bookdetail.current_qt}";
		var total_qt = "${bookdetail.total_qt}";

		if (total_qt == current_qt) {
			var bookid = $('#bookid').val();
			var c = confirm('정말 삭제하시겠습니까?');
			if (c == true) {
				location.href = "bookremoveimpl.do?id=" + bookid;
			}
			;
		} else {
			alert("대여 중인 책은 삭제할 수 없습니다.");
		}
	};

	$(window).resize(function() {
		resize();
	});

	function resize() {
		var windowwidth = $(window).width();
		if (windowwidth < 500) {
			$("#hi").removeAttr('rowSpan');
			document.getElementById("hi").colSpan = "2";
		} else {
			$("#hi").removeAttr('colSpan');
			document.getElementById("hi").rowSpan = "8";
		}
	}
</script>
<div class="fieldsetform">
	<fieldset>
		<legend>Book Detail</legend>
		<table width="700" class="table">
			<tr>
				<td id="hi"><img width="200px" src="img/book/${bookdetail.img}"></td>
			</tr>
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
		<input type="hidden" id="borrowbook" value="${borrowbook}"> <input
			type="hidden" id="bookid" value="${bookdetail.id}">
		<%
			if (user != null && user.getIsadmin().equals("y")) {
		%>
		<div class="btn-group">
			<a class="btn btn-default" href="bookmain.do?search=false">목록</a>
			<a class="btn btn-default" href="bookmodify.do?id=${bookdetail.id}">수정</a>
			<button type="button" class="btn btn-default" onclick="deletebook();">삭제</button>
			<button type="button" class="btn btn-default" onclick="rentbook();">대여</button>
		</div>
		<%
			} else if (user != null && user.getIsadmin().equals("n")) {
		%>
		<div class="btn-group">
		<a class="btn btn-default" href="bookmain.do?search=false">목록</a>
		<button type="button" class="btn btn-default" onclick="rentbook();">대여</button>
		</div>
		<%
			} else {
		%>
		<%
			}
		%>
	</fieldset>
</div>
