<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>

<script>
	// 좌석 등록 함수	
	function register(f) {
		var s_id = f.s_id.value;
		var c = confirm(s_id + "번 자리를 등록하시겠습니까?");

		if (c == true) {
			f.action = "m_userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}

	//회원의 메세지 전송 함수
	function sendMsg(f) {
		var s_id = f.s_id.value;
		// 좌석의 id 값 대입
		$(".seatid").val(s_id);
		//메세지 전송 다이얼로그 출력
		$("#sendMsg").dialog({
			'width' : 500,
			'height' : 400
		});
	}

	// 예약 못 한 회원이 예약된 좌석을 클릭한 경우
	function registeredSeat() {
		alert("이미 예약된 좌석입니다. ");
	}

	// 사용자가 수리 중인 좌석을 클릭한 경우
	function repairState() {
		alert("수리 중입니다");
	}

	// 예약한 사람이 다른 빈 좌석을 클릭한 경우
	function registeredUser() {
		alert("이미 좌석을 예약하셨습니다.");
	}
</script>

<div class="seattableform">
	<div id="seattable">
		<c:forEach items="${seatlist}" var="s" varStatus="i">
			<c:choose>

				<c:when test="${user.isadmin == 'n' }">
					<c:choose>
						<c:when test="${myseat == null}">
							<c:choose>
								<c:when test="${s.state == 'y'}">
									<form>
										<input type="hidden" name="s_state" value="${s.state}">
										<button type="button" class="btn btn-primary ${s.state}_btn"
											name="s_id" onclick="register(this.form);" value="${s.id}"
											data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
									</form>
								</c:when>
								<c:when test="${s.state == 'n'}">
									<form>
										<input type="hidden" name="s_state" value="${s.state}">
										<button type="button" class="btn btn-primary ${s.state}_btn"
											name="s_id" onclick="registeredSeat();" value="${s.id}"
											data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
									</form>
								</c:when>
								<c:when test="${s.state == 'f'}">
									<form>
										<input type="hidden" name="s_state" value="${s.state}">
										<button type="button" class="btn btn-primary ${s.state}_btn"
											name="s_id" onclick="repairState();" value="${s.id}"
											data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
									</form>
								</c:when>
							</c:choose>
						</c:when>

						<c:otherwise>
							<c:choose>
								<c:when test="${s.state == 'y'}">
									<form>
										<input type="hidden" name="s_state" value="${s.state}">
										<button type="button" class="btn btn-primary ${s.state}_btn"
											value="${s.id}" data-toggle="button" aria-pressed="false"
											autocomplete="off">${s.id}</button>
									</form>
								</c:when>
								<c:when test="${s.state == 'n'}">
									<form>
										<input type="hidden" name="s_state" value="${s.state}">
										<button type="button" class="btn btn-primary ${s.state}_btn"
											value="${s.id}" name="s_id" onclick="sendMsg(this.form);"
											value="${s.id}" data-toggle="button" aria-pressed="false"
											autocomplete="off">${s.id}</button>
									</form>
								</c:when>
								<c:when test="${s.state == 'f'}">
									<form>
										<input type="hidden" name="s_state" value="${s.state}">
										<button type="button" class="btn btn-primary ${s.state}_btn"
											value="${s.id}" onclick="repairState();" value="${s.id}"
											data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
									</form>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${user == null || user.isadmin == 's'}">
					<form>
						<input type="hidden" name="s_state" value="${s.state}">
						<button type="button" class="btn btn-primary ${s.state}_btn">${s.id}</button>
					</form>
				</c:when>

			</c:choose>
		</c:forEach>
	</div>
	<div id=managerSeat></div>
</div>
<div>
	<jsp:include page="${dialogpage}" />
</div>
