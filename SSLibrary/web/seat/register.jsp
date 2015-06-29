<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>
<h1>메세지 전송</h1>
<h2>발신자: ${user.id}(${user.name}) </h2>

<script>
function	 sendMsgImpl(f){
	// 수신자 좌석 정보
	var s_id = f.receiver_sid.value;
	// 발신자
	var sender_id = f.sender_uid.value;
	// 내용
	var text = f.textarea.value;
	
	alert("s_id: " +s_id  + ", sender_id: " + sender_id + ", text: "+ text);
	
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
<!-- 추후 변경 -->
<form>
	<input type="hidden" name="sender_uid" value="${user.id}">
	<input type="hidden" name="receiver_sid" class="seatid">
	<textarea rows="10" cols="20" name="textarea"></textarea>
	<br> <input type="button" value="전송" onclick="sendMsgImpl(this.form);">	
</form>