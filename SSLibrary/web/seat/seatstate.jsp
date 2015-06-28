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

	function showDialog(s_id, data) {
		var state = data;
		$(".seatstate").val(data);	
		$(".seatid").val(s_id);	
		alert("상태 : " + data);

		if (state == 'y') {
			$('input[id=ableseatY]').attr('checked');
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
			$('input[id=fixseatG]').attr('checked');
			$("#modifyG").dialog({
				'modal' : true,
				'width' : 300,
				'height' : 200
			});
		}
	}
	function changeState(f) {
		var s_id = f.s_id.value;
		$.ajax({
			type : 'post',
			data : {
				's_id' : s_id
			},
			async : 'false',
			url : 'seatmodify.do',
			success : function(data) {
				showDialog(s_id, data);
			},
			error : function() {
				alert("으앙 앙대ㅠㅠ");
			}

		});
	};

	function register(f) {
		var s_id = f.s_id.value;
		var c = confirm(s_id + "번 자리를 등록하시겠습니까?");

		if (c == true) {
			f.action = "userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}

	function modifystate(f,i){
		var s_id = f.seatid.value;
		var state = $('input[name='+ i +']:radio:checked').val();
	//	alert("State: "+ state + "s_id" + s_id);
		var c = confirm(s_id + "번 자리의 상태를 변경하시겠습니까?");
		if(c==true){
			f.action = "seatmodifyimpl.do?s_id=" + s_id+"&state="+state;
			f.method = "POST";
			f.submit();

			
			/* $.ajax({
				type : 'post',
				data : {
					's_id' : s_id,
					'state' : state
				},
				async : 'false',
				url : 'seatmodifyimpl.do',
				success : function(data) {
					alert(s_id+"번 좌석의 상태가 변경되었습니다.");
				},
				error : function() {
					alert("오류로 인해 좌석의 상태가 변경되지 않았습니다.");
				}

			}); */
			
			
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

<h1>Seat State(현재 좌석 정보) (login: ${user.id}, Admin:
	${user.isadmin}</h1>
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
<div class="modify" id="modifyR" title="관리자 페이지">
	<div id="modifytabs">
		<ul id="tabs">
			<li><a href="#modifyradio">좌석 상태</a></li>
			<li><a href="#sendMsg">메세지 전송</a></li>
		</ul>
		<div id="modifycontent">
			<div class="modify" id="modifyradio" title="좌석 상태">
			<form>
				<input type="hidden" class="seatstate">	<br>
				<input type="hidden" class="seatid" name="seatid">	<br>
				<input type="radio" class="stateclass" name="seat1" id="ableseatR" value="y" >예약 가능<br>
				<input type="radio" class="stateclass" name="seat1" id="unableseatR" value="n"checked>예약 불가<br>
				<input type="radio" class="stateclass" name="seat1" id="fixseatR" value="f">수리 중<br>
				<input type="button" name="Rbtn" id="Rbtn" value="확인" onclick="modifystate(this.form, 'seat1');">
			</form>
			</div>
			<div id="sendMsg">
				<jsp:include page="${registermsg}" />
			</div>
		</div>
	</div>
</div>

<div class="modify" id="modifyY" title="좌석 상태">
<form>
<input type="hidden" class="seatstate">	<br>
	<input type="hidden" class="seatid" name="seatid"><br>
	<input type="radio" class="stateclass" name="seat2" id="ableseatY" value="y" checked>예약 가능<br>
	<input type="radio" class="stateclass" name="seat2" id="fixseatY" value="f">수리 중<br>
	<input type="button" name="Ybtn" id="Ybtn" value="확인" onclick="modifystate(this.form, 'seat2');">
	</form>
</div>

<div class="modify" id="modifyG" title="좌석 상태">

	<form>
	<input type="hidden" class="seatstate">	<br>
	<input type="hidden" class="seatid" name="seatid">	<br>
	<input type="radio" class="stateclass" name="seat3" id="ableseatG" value="y">예약 가능<br>
	<input type="radio" class="stateclass" name="seat3" id="fixseatG" value="f" checked>수리 중<br>
	<input type="button" name="Gbtn" id="Gbtn" value="확인" onclick="modifystate(this.form, 'seat3');">
</form>
</div>
	
