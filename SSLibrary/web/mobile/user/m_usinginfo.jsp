<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		if ("${returnqt}" == 1) {
			$('#bookokpopup').popup('open');
		}
		var qt = $('#qt').val();
		if (qt == 1) {
			$('#bookfailpopup').popup('open');
		} else if (qt == 2) {
			$('#bookokpopup').popup('open');
		}
	});

	function extendMySeat() {
		if ('${userseat.renew_qt}' != 2) {
			$('#extendMySeat').popup('open');
			$("#extendMySeatbutton").click(function() {
				location.href = "m_userseatmodify.do?id=${userseat.s_id}";
				window.setTimeout(function name() {
					$('#seatuppopup').popup('open');
				}, 1000);
				
			});
		} else {
			$('#seatpopup').popup('open');
		}
	}

	function returnMySeat() {
		$('#returnMySeat').popup('open');
		$("#returnMySeatbutton").click(function() {
			location.href = "m_userseatremove.do?id=${userseat.s_id}";
			window.setTimeout(function name() {
				$('#seatrepopup').popup('open');
			}, 1000);
			
		});
	}
</script>
<h2>좌석 이용 내용</h2>
<div>
	<ul data-role="listview" data-inset="true">
		<li>
			<h3>사용좌석 : ${userseat.s_id}번좌석</h3>
			<P>사용시간</P>
			<p>${userseat.start_time}~${userseat.end_time}</p>
			<p class="ui-li-aside">
				<strong>연장횟수 : ${userseat.renew_qt}</strong>
			</p>
		</li>
	</ul>
</div>
<c:if test="${userseat.s_id != null}">
	<div class="ui-grid-b">
		<div class="ui-block-a">
			<a href="javascript:;" onClick="extendMySeat();" data-role="button">연장</a>
		</div>
		<div class="ui-block-b">
			<a href="javascript:;" onClick="returnMySeat();" data-role="button">반납</a>
		</div>
		<div class="ui-block-c">
			<a href="m_seatloglist.do?id=${user.id}" data-role="button">내역</a>
		</div>
	</div>
</c:if>
<input type="hidden" id="qt" value="${qt}">
<br>
<c:if test="${userseat.s_id == null}">
	<a href="m_seatloglist.do?id=${user.id}" data-role="button">내역</a>
</c:if>
<h2>도서 이용 내용</h2>
<div>
	<c:forEach items="${booklist}" var="book" varStatus="status">
		<ul data-role="listview" data-inset="true">
			<li>
				<h3>도서번호 : ${book[0]}</h3>
				<p>책이름 : ${book[1]}</p>
				<P>사용시간</P>
				<p>${book[2]}~${book[3]}</p>
				<p class="ui-li-aside">
					<strong>연장횟수 : ${book[4]}</strong>
				</p>
			</li>
		</ul>
		<div class="ui-grid-a">
			<div class="ui-block-a">
				<a href="javascript:;"
					onClick="if (confirm('연장하시겠습니까?')) location.href='m_userbookmodifyimpl.do?id=${book[0]}'"
					data-role="button">연장</a>
			</div>
			<div class="ui-block-b">
				<a href="javascript:;"
					onClick="if (confirm('반납하시겠습니까?')) location.href='m_userbookremove.do?id=${book[0]}'"
					data-role="button">반납</a>
			</div>
		</div>
	</c:forEach>
</div>
<br>
<a href="m_bookloglist.do" data-role="button">내역</a>


<!-- popup -->

<!-- seat -->
<div data-role="popup" id="seatuppopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>좌석 등록 기간이 연장되었습니다.</h2>
	</div>
</div>

<div data-role="popup" id="seatpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>2회 이후로 연장하실 수 없습니다.</h2>
	</div>
</div>

<div data-role="popup" id="seatrepopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>좌석을 반납하셨습니다.</h2>
	</div>
</div>

<div data-role="popup" id="extendMySeat">
	<div data-role="header">
		<h1>좌석</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>${userseat.s_id}번 좌석을 연장하시겠습니까?</h2>
		<button type="button" id="extendMySeatbutton">연장</button>
	</div>
</div>

<div data-role="popup" id="returnMySeat">
	<div data-role="header">
		<h1>좌석</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>${userseat.s_id}번 좌석을 반납하시겠습니까?</h2>
		<button type="button" id="returnMySeatbutton">반납</button>
	</div>
</div>

<!-- book popup -->

<div data-role="popup" id="bookokpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>대여반납이 확인되었습니다.</h2>
	</div>
</div>

<div data-role="popup" id="bookfailpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>더 이상 연장할 수 없습니다.(최대 2번 연장 가능)</h2>
	</div>
</div>

<div data-role="popup" id="bookokpopup">
	<div data-role="header">
		<h1>알람</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>도서 대여 기간 연장이 완료되었습니다.</h2>
	</div>
</div>


