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
		$('#sendMsg').dialog({
			modal : true,
			height: 300,  
            width: 250 
		});
		//$('#sendMsg' ).popup('open');

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

<h3>열람실 좌석 현황</h3>
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
									value="${s.id}" name="s_id" onclick="registeredUser();"
									data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
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
									value="${s.id}" name="s_id" onclick="repairState();"
									value="${s.id}" data-toggle="button" aria-pressed="false"
									autocomplete="off">${s.id}</button>
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


<%
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>
<script>
	function sendMsgImpl(f) {
		// 수신자 좌석 정보
		var s_id = f.receiver_sid.value;
		// 발신자
		var sender_id = f.sender_uid.value;
		// 내용
		var text = f.textarea.value;

		alert("s_id: " + s_id + ", sender_id: " + sender_id + ", text: " + text);

		var c = confirm(s_id + "번 자리의 사용자에게 메세지를 보내시겠습니까?");
		if (c == true) {
			$.ajax({
				type : 'post',
				data : {
					's_id_str' : s_id,
					'sender_id' : sender_id,
					'text' : text
				},
				async : 'false',
				url : 'm_msgsendimpl.do',
				success : function(data) {
					alert(s_id + "번 좌석으로 메세지를 전송하였습니다.");
					showSeatList(f);
				},
				error : function() {
					alert("오류로 인해 메세지가 전송되지 않았습니다.");
				}
			});
		}

	}
</script>

<!--   Sending Message Part (User) -->
<div id="sendMsg" title="메세지 전송">
	<h4>발신자: ${user.id}(${user.name})</h4>
	<form>
		<input type="hidden" name="sender_uid" value="${user.id}"> <input
			type="hidden" name="receiver_sid" class="seatid">
		<textarea rows="2" cols="70" name="textarea"></textarea>
		<button type="button" name="Nbtn" id="Nbtn" value="보내기"
			onclick="sendMsgImpl(this.form);">보내기</button>
	</form>
</div>
