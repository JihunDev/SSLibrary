<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function removeUserbook() {
		if ("${userbooklist}" == "[]") {
			alert('반납된 책이 없습니다.');
			return;
		}
		var c = confirm('반납 확인하시겠습니까?');
		if (c == true) {
			location.href = "userbookremoveimpl.do";
			alert("반납 확인이 완료되었습니다.");
		}
		;

	}
	$(document).ready(
			function() {
				var element = document.getElementById("listtable");
				var element2 = $("#returnbooklist");
				if ("${userbooklist}" == "[]") {
					$('#returnbooklist').html(
							"<tr><td colspan=6>반납된 책이 없습니다.</td><tr>");
				} else if ("${userbooklist}" != "[]"
						&& element2.height() >= 500) {
					$('#listtable').addClass("scroll");
				}
			});
</script>
<div class="fieldsetform">
	<fieldset>
		<legend align="center">실시간 반납 도서 정보</legend>
		<form>
			<div>
				<table width="700" id="listtable" class="table table-hover">
					<thead>
						<tr>
							<th>U_ID</th>
							<th>B_ID</th>
							<th class="hidden-xs">START_DATE</th>
							<th>END_DATE</th>
							<th class="hidden-xs">RENEW_QT</th>
							<th width="100px">ISRETURN</th>
						</tr>
					</thead>
					<tbody id="returnbooklist">
						<c:forEach items="${userbooklist}" var="b">
							<!-- 추후수정 -->
							<tr>
								<td>${b.u_id}</td>
								<td>${b.b_id}</td>
								<td class="hidden-xs">${b.start_date}</td>
								<td>${b.end_date}</td>
								<td class="hidden-xs">${b.renew_qt}</td>
								<td>${b.isreturn}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input type="button" class="btn btn-default" value="반납확인"
					onclick="removeUserbook();">
			</div>
		</form>
	</fieldset>
</div>