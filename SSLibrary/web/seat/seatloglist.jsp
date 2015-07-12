<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
window.onload = function(){
  	var backgroundColor_ = "#fcce18";
  	var color_ = "black";
  	
  	$('.theadcolor>thead>tr>th').css({backgroundColor:backgroundColor_, color:color_});
	$('.btncolor').css({backgroundColor:backgroundColor_, color:color_});
	
}
</script>

<div class="fieldsetform">
<div class="listtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>My Rental History (Seat)</h1></th>
		</tr>
	</table>	
</div>
<fieldset>
	<table width="700" class="table scroll table-striped theadcolor">		
		<thead>
			<tr>
				<th>이용자 ID</th>
				<th>좌석 ID</th>
				<th>예약 시작 시간</th>
				<th class="hidden-xs">반납 예정 시간</th>
				<th>실 반납 시간</th>
				<th class="hidden-xs">연장</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${seatloglist}" var='sl'>
				<tr>
					<td>${sl.u_id}</td>
					<td>${sl.s_id}</td>
					<td>${sl.start_date}</td>
					<td class="hidden-xs">${sl.end_date}</td>
					<td>${sl.real_date}</td>
					<td class="hidden-xs">${sl.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</fieldset>
	
</div>