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
<style>
.seat-dialog{
	height:200px;
	width:300px;	
}
</style>


<!--Useable Seat Click Dialog -->
<div class="modal fade bs-example-modal-sm"  id="modifyY" >
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">좌석 상태</h4>
      </div>
      <!-- body -->
      <form>
      <div class="modal-body">
			<form>
				<br>							
					<input type="hidden" class="seatstate" name="seatstate">
					 <input type="hidden" class="seatid" name="seatid">
					 <input type="radio" class="stateclass" name="seatY" id="ableseatY" value="y" checked>예약 가능<br>
					 <input type="radio" class="stateclass" name="seatY" id="fixseatY" value="f">수리 중<br>
				<br>							 
			</div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" name="Ybtn" id="Ybtn" value="확인"	onclick="modifystate(this.form, 'seatY');">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
    		</form>
		
    </div>
  </div>
</div>


<!--Broken Seat Click Dialog -->
<div class="modal fade bs-example-modal-sm"  id="modifyF" >
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">좌석 상태</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
			<form>
			<br>							
				<input type="hidden" class="seatstate" name="seatstate">
				<input type="hidden" class="seatid" name="seatid">
				<input type="radio" class="stateclass" name="seatF" id="ableseatF" value="y">예약 가능<br>
				<input type="radio" class="stateclass" name="seatF" id="fixseatF" value="f" checked>수리 중<br>
			<br>							
			</div>
      <!-- Footer -->
      <div class="modal-footer">
   		<button type="button" class="btn btn-default" data-dismiss="modal" name="Fbtn" id="Fbtn" value="확인" onclick="modifystate(this.form, 'seatF');">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!--Registered Seat Click Dialog -->
<div class="modal fade " id="modifyN">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">좌석 관리</h4>
			</div>
			<!-- body -->
			<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist" id="adminTab">
					<li role="presentation">
						<a href="#seateduser"	aria-controls="seateduser" role="tab" data-toggle="tab">좌석 이용자 정보</a></li>
					<li role="presentation">
						<a href="#modifyradio"	aria-controls="modifyradio" role="tab" data-toggle="tab">좌석 상태</a></li>
					<li role="presentation">
						<a href="#sendMsgByAdmin"	aria-controls="sendMsgByAdmin" role="tab" data-toggle="tab">메세지 전송</a></li>
				</ul>
					
				<div class="tab-content">
				
					<!-- User Information Print Part -->
					<div role="tabpanel" class="tab-pane fade in active" id="seateduser">
						<jsp:include page="${seateduserpage}" />
					</div>
					
					<!-- Change Seat State Part -->
					<div role="tabpanel" class="tab-pane fade in active" id="modifyradio">
						<form>
							<input type="hidden" class="seatstate" name="seatstate">
							<input type="hidden" class="seatid" name="seatid">
							<br>
							<input type="radio" class="stateclass" name="seatN" id="ableseatN" value="y">예약 가능<br>
							<input type="radio" class="stateclass" name="seatN" id="unableseatN" value="n" checked>예약 불가<br>
							<input type="radio" class="stateclass" name="seatN" id="fixseatN" value="f">수리 중<br>
							<br>
							
							<div class="modal-footer">		
								<button type="button" class="btn btn-default" data-dismiss="modal" name="Nbtn" id="Nbtn" value="확인" onclick="modifystate(this.form, 'seatN');">확인</button>
							    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
					
					<!--Sending Message Part (Administrator) -->
					<div role="tabpanel" class="tab-pane fade  in active" id="sendMsgByAdmin">
						<jsp:include page="${registermsg}" />
					</div>				

				</div>
			</div>
		</div>
	</div>
</div>

<!--   Sending Message Part (User) -->
<div class="modal fade"  id="sendMsg" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">좌석 상태</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
			<jsp:include page="${registermsg}" />
	  </div>
    </div>
  </div>
</div>




