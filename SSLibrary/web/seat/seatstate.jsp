<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>

<script>
	function seatregister(f) {
		//var btn_id= "#s"+s_id;	

		var s_id = f.s_id.value;

		var c = confirm(s_id + "번 자리를 등록하시겠습니까?");

		if (c == true) {
			f.action = "userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}
</script>
<style>
.y_btn {
	background: yellow;
}

.n_btn {
	background: red;
}

.f_btn {
	background: green;
}
</style>

<h1>Seat State(현재 좌석 정보)</h1>

<table border="1">
	<tr>
		<c:forEach items="${seatlist}" var="s">

			<c:choose>
				<c:when test="${s.state == 'n'}">
					<form>
					<td><input type="button" class="${s.state}_btn" name="s_id"
						onclick="seatregister(this.form);" value="${s.id}"></td>
					</form>
				</c:when>
				<c:otherwise>
					<form>
					<td><input type="button" class="${s.state}_btn" name="s_id"
						onclick="seatregister(this.form);" value="${s.id}" disabled></td>
					</form>
				</c:otherwise>

			</c:choose>
		</c:forEach>
	</tr>
</table>