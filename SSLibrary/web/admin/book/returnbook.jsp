<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function removeUserbook(){
	var c = confirm('반납 확인하시겠습니까?');
	if (c == true) {
		location.href = "userbookremoveimpl.do";
		alert("반납 확인이 완료되었습니다.");
	};		
	
}
</script>
<div class="fieldsetform">
<fieldset>
<legend align="center">실시간 반납 도서 정보</legend>
<form>
<div>
<table width="700" class="table table-hover">
<thead><tr><th>U_ID</th><th >B_ID</th><th >START_DATE</th><th>END_DATE</th><th>RENEW_QT</th>
<th>ISRETURN</th></tr></thead>
<tbody>
<c:forEach items="${userbooklist}" var="b"> <!-- 추후수정 -->
<tr>
<td>${b.u_id}</td>
<td>${b.b_id}</td>
<td>${b.start_date}</td>
<td>${b.end_date}</td>
<td>${b.renew_qt}</td>
<td>${b.isreturn}</td>
</tr>
</c:forEach>
</tbody>
</table>
<input type="button" class="btn btn-default" value="반납확인" onclick="removeUserbook();">
</div>
</form>
</fieldset>
</div>