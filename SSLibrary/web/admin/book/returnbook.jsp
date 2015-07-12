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
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>Returning Books Approval</h1></th>
		</tr>
	</table>	
</div>
				<div style="text-align:right;margin:2px;">
					<input type="button" class="btn btncolor btn-default"  value="반납 승인" onclick="removeUserbook();">
				</div>
	<fieldset>
		<form>
			<div>
				<table width="700" id="listtable" class="table table-striped theadcolor">
					<thead>
						<tr>
							<th>반납자</th>
							<th>도서 등록 번호</th>
							<th class="hidden-xs">대여 시간</th>
							<th>반납 예정시간</th>
							<th class="hidden-xs">연장</th>
<!-- 							<th width="100px">반납 여부</th> -->
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
<%-- 								<td>${b.isreturn}</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</form>
	</fieldset>
</div>