<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>
<script>

function	 sendMsgImpl(f){
	// 수신자 좌석 정보
	var s_id = f.receiver_sid.value;
	// 발신자
	var sender_id = f.sender_uid.value;
	// 내용
	var text = f.textarea.value;
	
	//alert("s_id: " +s_id  + ", sender_id: " + sender_id + ", text: "+ text);
	
	var c = confirm(s_id + "번 자리의 사용자에게 메세지를 보내시겠습니까?");
	if (c == true) {
		$.ajax({
			type : 'post',
			data : {
				's_id_str' : s_id,
				'sender_id' : sender_id,
				'text': text
			},
			async : 'false',
			url : 'msgsendimpl.do',
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
<style>
.messagetextarea{
	width:100%;
}
</style>
<form>
	<h4 style="float:left;">Sender ID: ${user.id}(${user.name}) </h4>
	<h4 style='float:right;''>Receiver Seat ID:<input type="number" name="receiver_sid" class="seatid"></h4>
	
	
	<input type="hidden" name="sender_uid" value="${user.id}">
	<input type="hidden" name="receiver_sid" class="seatid">
	<div>
	<textarea rows="2" name="textarea" class="messagetextarea" style="resize: none;"></textarea></div>
	<br>	
	<div class="modal-footer">		
		<button type="button" class="btn btn-default" data-dismiss="modal" name="Nbtn" id="Nbtn" value="보내기" onclick="sendMsgImpl(this.form);">보내기</button>
 		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
</form>