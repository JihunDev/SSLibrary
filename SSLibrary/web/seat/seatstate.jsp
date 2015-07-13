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
		
		if(s_id == "${myseat.s_id}"){
			alert("회원님의 자리로 메세지를 보낼 수 없습니다.");	
		}else{// 좌석의 id 값 대입
			$(".seatid").val(s_id);	
			
			//메세지 전송 다이얼로그 출력
			$("#sendMsg").modal({
				'width' : 500,
				'height' : 400
			});
					
		}
	}
	
/* 	function confirmmsg(){
		$("#confirmMsg").modal({
			'width' : 500,
			'height' : 400
		});			
	}
	 */
	
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
		if (s_state == 'n') {
			$.ajax({
				type : 'post',
				data : {
					's_id' : s_id
				},
				async : 'false',
				url : 'seatmodify.do',
				dataType : 'JSON',
				success : function(data) {
					displayuserinfo(data);
					showDialog(s_id, s_state);
				},
				error : function() {
					alert("으앙 앙대ㅠㅠ");
				}
			});
		} else {
			showDialog(s_id, s_state);
		}
	};

	
	function resize_seatstate(){
		var windowwidth = $(window).width();
		if (windowwidth < 600) {
			$('footer[class=site-footer]').css('width','600px');
		}else{
			$('footer[class=site-footer]').css('width','100%');				
		}		
	};
	
	$(window).ready(function(){
		
		if('${myseat.s_id}' != ''){
			$('button[value=${myseat.s_id}]').css({backgroundColor:'#fcce18', color:'black'});
		}
		resize_seatstate();
	});
	// 사이즈 조절 
	$(window).resize(function(){
		resize_seatstate();
	});
</script>
<style>
.modal-header{
	background:#e76e6e;
	color:#EAEAEA;
}
#seattable{
	position:relative;
	width:100%;
	min-width:none;
}
#seattable>tbody>tr>td{
	width:9%;
	min-width:none;
}
.seatpath{
	height:50px;
	width:10%;
}

#seattable>tbody>tr>td>form>button {
 	width: 100%;
	height: 50px;
	float: left;
	border-color: white;
	min-width:none;
}

#seattable>tbody>tr>td>form>button[name="s_id"]:hover {
	/* 	background: #FFC19E; */
	opacity: 0.6;
	border-color: white;
}

#seattable>tbody>tr>td>form>button[name="s_id"]:active {
	opacity: 0.3;
	border-color: white;
	color: white;
}

#seattable>tbody>tr>td:nth-child(10n)>form>button {
	float: none;
}

/* #seattable>tbody>tr>td:nth-child(10n-2)>form>button {
	margin: 0 7% 0 0;
}

#seattable>tbody>tr>td:nth-child(20n)>form>button {
	margin: 0 0 30px 0;
}
 */
.y_btn, #seattable>tbody>tr>td>form>.y_btn, #seattable>tbody>tr>td>form>.y_btn:hover, #seattable>tbody>tr>td>form>.y_btn:active,
	#seattable>tbody>tr>td>form>.y_btn:focus {
	background: #A6A6A6;
}

.n_btn, #seattable>tbody>tr>td>form>.n_btn, #seattable>tbody>tr>td>form>.n_btn:hover, #seattable>tbody>tr>td>form>.n_btn:active,
	#seattable>tbody>tr>td>form>.n_btn:focus {
	background: #e76e6e; 
}

.f_btn, #seattable>tbody>tr>td>form>.f_btn, #seattable>tbody>tr>td>form>.f_btn:hover, #seattable>tbody>tr>td>form>.f_btn:active,
	#seattable>tbody>tr>td>form>.f_btn:focus {
	background:#66c1bd;
}

.modify {
/* 	display: none; */
}

.example_btn {
	width: auto;
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
	background: rgba(255, 255, 194, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	margin-top: 40px;
	padding: 20px;
	border-radius: 10px 10px 10px 10px;
	
}

#seat_article {
	border: 5px double Gray;
}

#doorImg {
	
}

.door {
	background: #D4F4FA;
	width:40px;
	height: 40px;
	border:0
}
</style>
<div style="min-width:600px;">
<div class="fieldsetform">
<%-- 		<c:if test="${user != null}">
			<c:choose>
				<c:when test="${user.isadmin == 'y'}"> 
					</c:when>
				<c:otherwise> 
				</c:otherwise>	
			</c:choose>			
		</c:if> --%>

	<div style="height:250px">	
<!-- 		<div style="float:left;width:55%;"><br><br><br><br>
			
		</div>	 -->
		<table class="table" style="width:100%;min-width:300px;">
			<tr>
				<th rowspan="5"><h1>Reading Room State</h1></th>
				<th colspan = "2" style="width:140px;">좌석 수</th>
				<td style="width:20px;">${seatqt}</td>
			</tr>
			<tr>
				<th style="width:110px;">예약 가능</th>
				<td style="width:30px;">
					<input type="button" class="y_btn example_btn" value="   " disabled>
				</td>
				<td>${y_count}</td>
			</tr>
			<tr>
				<th>사용 중</th>
				<td>
					<input type="button" class="n_btn example_btn" value="   " disabled>
				</td>
				<td>${n_count}</td>
			</tr>
			<tr>
				<th>수리 중</th>
				<td>
					<input type="button" class="f_btn example_btn" value="   " disabled>
				</td>
				<td> ${f_count}</td>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${user != null && user.isadmin=='n'}">
				<th>내 자리</th>
				<td>
					<input type="button" class="example_btn" style="background-color:#fcce18;width:auto;" value="   " disabled>
				</td>
				<td></td>
				</c:when>
				
				<c:when test="${user != null && user.isadmin=='y'}">
				<th>좌석 대여 내역</th>
				<td colspan="2">
					<input type="button" class="example_btn" style="color:gray;width:100%;" onclick='location.href="adminseatloglist.do"' value="Click">
				</td>
				</c:when>
				</c:choose>
			</tr>
			</table>	
		</div>
	


	<div id="seat_article">
		<div id=doorImg><br>
			<input type="button" class="door" style="border-radius:0 0 40px 0; border-top: 3px solid black;" disabled><br>
			<input type="button"  class="door" style="border-radius:0 40px  0 0; border-bottom: 3px solid black;" disabled></div><br><br>
		<div>
		
		<table id="seattable"><tbody><tr>	
			<c:forEach items="${seatlist}" var="s" varStatus="i">
			<td>		
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
			<c:if test="${i.count % 10 == 0}" var="index">
				</tr><tr>
			</c:if>
			<c:if test="${i.count % 10 == 7}" var="index">
				<td class="seatpath"></td>
			</c:if>
			<c:if test="${i.count % 20 == 0}" var="index">
				<td class="seatpath"></td></tr><tr>
			</c:if>
			</td>
			</c:forEach>
			</tr></tbody></table>
		</div>
	</div>
</div>
</div>
<jsp:include page="${dialogpage}" />
