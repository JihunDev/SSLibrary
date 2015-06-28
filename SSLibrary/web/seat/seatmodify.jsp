<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

</script>
 <div class="modify" id="modifyR" title="관리자 페이지">
	<div id="modifytabs">
		<ul id="tabs">
			<li><a href="#modifyradio">좌석 상태</a></li>
			<li><a href="#sendMsg">메세지 전송</a></li>
		</ul>
		<div id="modifycontent">
			<div class="modify" id="modifyradio" title="좌석 상태">
				<input type="text" class="seatstate">	<br>
				<input type="radio" class="stateclass" name="seatRed" id="ableseatR" value="y" >예약 가능<br>
				<input type="radio" class="stateclass" name="seatRed" id="unableseatR" value="n"checked>예약 불가<br>
				<input type="radio" class="stateclass" name="seatRed" id="fixseatR" value="f">수리 중<br>
				<input type="button" name="Rbtn" id="Rbtn" value="확인" onclick="modifystate(this.form);">
			</div>
			<div id="sendMsg">
				<jsp:include page="${registermsg}" />
			</div>
		</div>
	</div>
</div>

<div class="modify" id="modifyY" title="좌석 상태">
<input type="text" class="seatstate">	<br>
	<input type="radio" class="stateclass" name="seatY" id="ableseatY" value="y" checked>예약 가능<br>
	<input type="radio" class="stateclass" name="seatY" id="fixseatY" value="f">수리 중<br>
	<input type="button" name="YGbtn" id="YGbtn" value="확인" onclick="modifystate(this.form);">
</div>

<div class="modify" id="modifyG" title="좌석 상태">
	<input type="text" class="seatstate">	<br>
	<input type="radio" class="stateclass" name="seatG" id="ableseatG" value="y">예약 가능<br>
	<input type="radio" class="stateclass" name="seatG" id="fixseatG" value="f" checked>수리 중<br>
	<input type="button" name="YGbtn" id="YGbtn" value="확인" onclick="modifystate(this.form);">
</div>
	