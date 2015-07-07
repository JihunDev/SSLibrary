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
<style>
#seattable>form>button {
	width: 9%;
	height: 50px;
	float: left;
	border-color: white;
}

#seattable>form>button[name="s_id"]:hover {
	/* 	background: #FFC19E; */
	opacity: 0.6;
	border-color: white;
}

#seattable>form>button[name="s_id"]:active {
	opacity: 0.3;
	border-color: white;
	color: white;
}

#seattable>form:nth-child(10n)>button {
	float: none;
}

#seattable>form:nth-child(10n-2)>button {
	margin: 0 7% 0 0;
}

#seattable>form:nth-child(20n)>button {
	margin: 0 0 30px 0;
}

.y_btn, #seattable>form>.y_btn, #seattable>form>.y_btn:hover, #seattable>form>.y_btn:active,
	#seattable>form>.y_btn:focus {
	background: #CC723D;
}

.n_btn, #seattable>form>.n_btn, #seattable>form>.n_btn:hover, #seattable>form>.n_btn:active,
	#seattable>form>.n_btn:focus {
	background: #300000;
}

.f_btn, #seattable>form>.f_btn, #seattable>form>.f_btn:hover, #seattable>form>.f_btn:active,
	#seattable>form>.f_btn:focus {
	background: #337AB7;
}

.modify {
	display: none;
}

.example_btn {
	width: 120px;
	height: 30px;
	float: right;
	color: white;
	font-size: 15px;
	border-radius: 5px 5px 5px 5px;
}

.text_center {
	text-align: center;
}

.seattableform {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	margin-top: 40px;
	padding: 20px;
	border-radius: 10px 10px 10px 10px;
}

#seat_article {
	border: 5px double Gray;
}

#managerSeat {
	
}

.door {
	background: #D4F4FA;
	width:40px;
	height: 40px;
	border:0
}
</style>
<div class="seattableform">
	<div class="text_center">
		<h3>열람실 좌석 현황</h3>
	</div>
	<br>
	<div>
		<input type="button" class="f_btn example_btn" value="수리 중: ${f_count}" disabled>
		<input type="button" class="n_btn example_btn" value="사용 중: ${n_count}" disabled>
		<input type="button" class="y_btn example_btn" value="예약 가능: ${y_count}" disabled>
		<input type="button" class="example_btn"
		style="background: gray; width: 200px; float: left ;" value="총  좌석 수 : ${seatqt}" disabled> 
	</div>
	<br>
	<br>
<div id="seat_article">
	<div id=managerSeat><br>
	<input type="button" class="door" style="border-radius:0 0 40px 0; border-top: 3px solid black;" disabled><br>
	<input type="button"  class="door" style="border-radius:0 40px  0 0; border-bottom: 3px solid black;" disabled></div><br><br>
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

				<c:when test="${user.isadmin == 'y'}">
					<form>
						<input type="hidden" name="s_state" value="${s.state}">
						<button type="button" class="btn btn-primary ${s.state}_btn"
							name="s_id" onclick="changeState(this.form);" value="${s.id}"
							data-toggle="button" aria-pressed="false" autocomplete="off"
							data-target=".bs-example-modal-sm">${s.id}</button>
					</form>
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
	</div>
</div>
<jsp:include page="${dialogpage}" />
