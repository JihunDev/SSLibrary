<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	// 좌석 현황 페이지 호출
	function showSeatList(f){
		f.action = "seatmain.do";
		f.method = "POST";
		f.submit();		
	}
	// 좌석 등록 함수	
	function register(f) {
		var s_id = f.s_id.value;
		var c = confirm(s_id + "번 자리를 등록하시겠습니까?");

		if (c == true) {
			f.action = "userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}
	// 메세지 전송 함수
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
	// 관리자가 클릭했을 때의 Dialog창 호출 내용
	function showDialog(s_id, data) {
		var state = data;
		$(".seatstate").val(data);
		$(".seatid").val(s_id);
		//alert("상태 : " + data);

		if (state == 'y') {
			$("#modifyY").dialog({
				'modal' : true,
				'width' : 300,
				'height' : 200
			});
		}
		if (state == 'n') {
			$("#modifytabs").tabs();
			$("#modifyR").dialog({
				'modal' : true,
				'width' : 500,
				'height' : 400
			});

		}
		if (state == 'f') {
			$("#modifyG").dialog({
				'modal' : true,
				'width' : 300,
				'height' : 200
			});
		}
	}
	
	// 관리자가 좌석을 클릭한 경우
	function changeState(f) {
		var s_id = f.s_id.value;
		$.ajax({
			type : 'post',
			data : {
				's_id' : s_id
			},
			async : 'true',
			url : 'seatmodify.do',
			success : function(data) {
				showDialog(s_id, data);
			},
			error : function() {
				alert("으앙 앙대ㅠㅠ");
			}

		});
	};
	
	// 좌석 상태 변경 함수
	function modifystate(f, i) {
		var s_id = f.seatid.value;
		var old_state = f.seatstate.value;
		var new_state = $('input[name=' + i + ']:radio:checked').val();
		//	alert("New State: "+ new_state + "s_id: " + s_id + "Old State: "+ old_state);
		
		if(old_state != new_state){
			var c = confirm(s_id + "번 자리의 상태를 변경하시겠습니까?");
			if (c == true) {
				$.ajax({
					type : 'post',
					data : {
						's_id' : s_id,
						'state' : new_state
					},
					async : 'false',
					url : 'seatmodifyimpl.do',
					success : function(data) {
						alert(s_id + "번 좌석의 상태가 변경되었습니다.");
						showSeatList(f);
					},
					error : function() {
						alert("오류로 인해 좌석의 상태가 변경되지 않았습니다.");
					}
				});
			}	
		}else{
			var c = confirm(s_id + "번 자리의 상태를 유지하시겠습니까?");
			if(c == true){
				alert(s_id + "번 좌석의 상태를 유지합니다.");
				showSeatList(f);
			}
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

.modify {
	display: none;
}
</style>

<h1>Seat State(현재 좌석 정보) (login: ${user.id}, Admin: ${user.isadmin}</h1>
<table>
	<tr>
		<c:forEach items="${seatlist}" var="s" varStatus="i">
			<c:if test="${i.index %10 == 0}">
	</tr>
	<tr>
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
								onclick="changeState(this.form);" value="${s.id}"></td>
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

<jsp:include page="${modifypage}" />
