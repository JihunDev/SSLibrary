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
			f.action = "userseatregister.do?s_id=" + s_id;
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
		$("#sendMsg").modal({
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
	// 관리자가 클릭했을 때의 Dialog창 호출 내용
	function showDialog(s_id, s_state) {
		var state = s_state;
		$(".seatstate").val(s_state);
		$(".seatid").val(s_id);
		
		if (state == 'y') {
	        $('#modifyY').modal();
		}
		if (state == 'n') {
			$("#adminTab a:first").tab('show');
			$("#modifyN").modal();

		}
		if (state == 'f') {
	        $('#modifyF').modal();
		}
	}

	// 관리자가 좌석을 클릭한 경우
	function changeState(f) {
		var s_id = f.s_id.value;
		var s_state = f.s_state.value;
		$.ajax({
			type : 'post',
			data : {
				's_id' : s_id
			},
			async : 'false',
			url : 'seatmodify.do',
			dataType:'JSON',
			success : function(data) {
				showDialog(s_id, s_state);
				if(s_state == 'n'){
					displayuserinfo(data);	
				}				
			},
			error : function() {
				alert("으앙 앙대ㅠㅠ");
			}
		});
	};

</script>
<style>
#seattable>form>button{
	width: 9%;
	height: 50px;
	float:left;
}
#seattable>form:nth-child(10n)>button{
	float:none;
}

#seattable>form:nth-child(10n-2)>button{
	background:red;
	margin:0 7% 0 0;
}

#seattable>form:nth-child(20n)>button{
	background:blue;
	margin:0 0 30px 0;
}


.y_btn {
	background: #CC723D;
}

.n_btn {
	background: #300000;
}

.f_btn {
	background: #002266;
}

.modify {
	display: none;
}
#seattable{

}
.seattableform{
	background: rgba(255, 255, 255, 0.8);
    box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
    margin-top : 40px;
    padding : 20px;
	border-radius: 10px 10px 10px 10px;
}
</style>
<div class="seattableform">
<div><h3>Seat State(현재 좌석 정보) (Admin: ${user.isadmin})</h3></div>

<div id = "seattable">	
	<c:forEach items="${seatlist}" var="s" varStatus="i">
	<c:if test="${i.index % 11 == 0}">
			
	</c:if>
	<c:choose>
		
		<c:when test="${user.isadmin == 'n' }">
			<c:choose>
				<c:when test="${myseat == null}">
					<c:choose>
						<c:when test="${s.state == 'y'}">									
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="register(this.form);" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">									
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="registeredSeat();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="repairState();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
					</c:choose>
				</c:when>
					<c:otherwise>
					<c:choose>
						<c:when test="${s.state == 'y'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="registeredUser();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="sendMsg(this.form);" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="repairState();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:when>
		
		<c:when test="${user.isadmin == 'y'}">
			<form>
				<input type="hidden" name="s_state" value="${s.state}">
				<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="changeState(this.form);" 
				value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off" data-target=".bs-example-modal-sm">${s.id}</button>
			</form>
		</c:when>
		
		<c:when test="${user == null || user.isadmin == 's'}">
			<form>
				<input type="hidden" name="s_state" value="${s.state}">
				<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id">${s.id}</button>
			</form>
		</c:when>
		
	</c:choose>
	</c:forEach>
</div>
<div id = managerSeat>

</div>
</div>
<jsp:include page="${dialogpage}" />
