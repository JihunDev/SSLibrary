<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
// 좌석 상태 변경 함수
	// 좌석 현황 페이지 호출
	function showSeatList(f){
		f.action = "seatmain.do";
		f.method = "POST";
		f.submit();		
	}

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

<div class="modify" id="modifyR" title="관리자 페이지">
	<div id="modifytabs">
		<ul id="tabs">
			<li><a href="#modifyradio">좌석 상태</a></li>
			<li><a href="#sendMsg">메세지 전송</a></li>
		</ul>
		<div id="modifycontent">
			<div class="modify" id="modifyradio" title="좌석 상태">
				<form>
					<input type="hidden" class="seatstate" name="seatstate">
					 <input type="hidden" class="seatid" name="seatid">
					 <input type="radio" class="stateclass" name="seatR" id="ableseatR" value="y">예약 가능<br>
					 <input type="radio" class="stateclass" name="seatR" id="unableseatR" value="n" checked>예약 불가<br>
					 <input type="radio" class="stateclass" name="seatR" id="fixseatR" value="f">수리 중<br>
					 <input type="button" name="Rbtn" id="Rbtn" value="확인" onclick="modifystate(this.form, 'seatR');">
				</form>
			</div>
			<div class="modify" id="sendMsg">
				<jsp:include page="${registermsg}" />
			</div>
		</div>
	</div>
</div>

<div class="modify" id="modifyY" title="좌석 상태">
	<form>
		<input type="hidden" class="seatstate" name="seatstate">
		<input type="hidden" class="seatid" name="seatid">
		<input type="radio" class="stateclass" name="seatY" id="ableseatY" value="y" checked>예약 가능<br>
		<input type="radio" class="stateclass" name="seatY" id="fixseatY" value="f">수리 중<br>
		<input type="button" name="Ybtn" id="Ybtn" value="확인" onclick="modifystate(this.form, 'seatY');">
	</form>
</div>

<div class="modify" id="modifyG" title="좌석 상태">
	<form>
		<input type="hidden" class="seatstate" name="seatstate">
		<input type="hidden" class="seatid" name="seatid">
		<input type="radio" class="stateclass" name="seatG" id="ableseatG" value="y">예약 가능<br>
		<input type="radio" class="stateclass" name="seatG" id="fixseatG" value="f" checked>수리 중<br>
		<input type="button" name="Gbtn" id="Gbtn" value="확인" onclick="modifystate(this.form, 'seatG');">
	</form>
</div>
