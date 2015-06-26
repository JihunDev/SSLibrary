<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
<script>
	function sendMsg(f) {
		var text = prompt("메세지 내용을 입력하세요.");
		/* if(name_value == true) else false */
		if (text) {
			var c = confirm("메세지를 보내시겠습니까?");
			if (c == true) {

			}
		} else
			alert("질문창 취소버튼 클릭 했습니다.");
	}

	function registeredSeat() {
		alert("이미 예약된 좌석입니다. ");
	}
	function repairState() {
		alert("수리 중입니다");
	}

	function registeredUser() {
		alert("이미 좌석을 예약하셨습니다.");
		
		
	}

	function changeState(f) {
		var s_id = f.s_id.value;
		  $( "#dialog" ).dialog();
		
	}

	function register(f) {
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
	width: 100px;
	height: 100px;
}

.n_btn {
	background: red;
	width: 100px;
	height: 100px;
}

.f_btn {
	background: green;
	width: 100px;
	height: 100px;
}
</style>

<h1>Seat State(현재 좌석 정보)

 (login: ${user.id}, Admin:
	${user.isadmin})</h1>
<table>
	<tr>
		<c:forEach items="${seatlist}" var="s" varStatus="i">
		<c:if test="${i.index %10 == 0}">
			</tr><tr>
		</c:if>

			<c:choose>
				<c:when test="${user.isadmin == 'n' }">
					<c:choose>
						<c:when test="${myseat == null}">
							<c:choose>
								<c:when test="${s.state == 'y'}">
									<form>
										<td><input type="button" class="${s.state}_btn"
											name="s_id" onclick="register(this.form);" value="${s.id}"></td>
									</form>
								</c:when>
								<c:when test="${s.state == 'n'}">
									<form>
										<td><input type="button" class="${s.state}_btn"
											name="s_id" onclick="registeredSeat();" value="${s.id}"></td>
									</form>
								</c:when>
								<c:when test="${s.state == 'f'}">
									<form>
										<td><input type="button" class="${s.state}_btn"
											name="s_id" onclick="repairState();" value="${s.id}"></td>
									</form>
								</c:when>
							</c:choose>
						</c:when>

						<c:otherwise>
							<c:choose>
								<c:when test="${s.state == 'y'}">
									<form>
										<td><input type="button" class="${s.state}_btn"
											name="s_id" onclick="registeredUser();" value="${s.id}"></td>
									</form>
								</c:when>
								<c:when test="${s.state == 'n'}">
									<form>
										<td><input type="button" class="${s.state}_btn"
											name="s_id" onclick="sendMsg();" value="${s.id}"></td>
									</form>
								</c:when>
								<c:when test="${s.state == 'f'}">
									<form>
										<td><input type="button" class="${s.state}_btn"
											name="s_id" onclick="repairState();" value="${s.id}"></td>
									</form>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${user.isadmin == 'y'}">
					<c:choose>
						<c:when test="${s.state == 'y'}">
							<form>
								<td><input type="button" class="${s.state}_btn" name="s_id"
									onclick="changeState(this.form);" value="${s.id}"></td>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<td><input type="button" class="${s.state}_btn" name="s_id"
									onclick="sendMsg();" value="${s.id}"></td>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<td><input type="button" class="${s.state}_btn" name="s_id"
									onclick="changeState(this.form);" value="${s.id}"></td>
							</form>
						</c:when>
					</c:choose>
				</c:when>

				<c:when test="${user == null}">
					<c:choose>
						<c:when test="${s.state == 'y'}">
							<form>
								<td><input type="button" class="${s.state}_btn" name="s_id"
									disabled value="${s.id}"></td>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<td><input type="button" class="${s.state}_btn" name="s_id"
									disabled value="${s.id}"></td>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<td><input type="button" class="${s.state}_btn" name="s_id"
									disabled value="${s.id}"></td>
							</form>
						</c:when>
					</c:choose>
				</c:when>
			</c:choose>
		</c:forEach>
	</tr>
</table>

<div id="dialog"> aa</div>