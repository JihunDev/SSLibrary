<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
	if("${adminseatloglist}" == "[]")
		$('#seatloglist_div').html("<tr><td colspan=6>등록된 게시물이 없습니다.</td><tr>");
	
});
function searchseatlog(f){
	var issearch = f.issearch.value;
	var search = f.search.value;
	//alert(typeof(search));
	//alert(Number(search));
	
	if(issearch == "s_id" && isNaN(Number(search))==true){
		// 좌석 검색할때 숫자가 아닌 문자를 입력했다면
		alert("올바른 좌석 ID를 입력하세요.");
	}else{	
		// 올바른 검색값을 입력했다면
		f.action = "adminseatlogsearch.do";
		f.method="POST";
		f.submit();
	}
}

</script>
<style>
#seatlogtable>thead>tr>th{
	background: #35B62C;
}
.seattableform {
	background: rgba(255, 255, 194, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	margin-top: 40px;
	padding: 20px;
	border-radius: 10px 10px 10px 10px;
	
}
</style>

<div class="seattableform"> 

	<div style="float:right;" >
     	<button class="btn btn-default btn-sm" style="float:right;" type="submit" onclick='location.href="seatmain.do"'>좌석 현황</button>
     </div> 
     <form class="form-inline">
      <div class="input-group" style="float:left;" >
     <span class="input-group-btn">
         <select id="issearch" name="issearch" class="form-control input-sm" >
		<option value="s_id">좌석번호</option>
		<option value="u_id">사용자ID</option>
	</select>
      	 <input type="text" id="search" name="search" class="form-control input-sm"placeholder="Search for ID">
         <button class="btn btn-default btn-sm" type="button" onclick="searchseatlog(this.form);">검색</button>
      </span>
     </div>

<br><br>
<fieldset>
	<legend align="center">Seat Log List Page</legend>
	<table width="700" class="table table-hover" id="seatlogtable">
		<thead>
			<tr>
				<th>예약자 ID</th>
				<th>좌석 ID</th>
				<th>예약 시작 시간</th>
				<th>반납 예정 시간</th>
				<th>실 반납 시간</th>
				<th>연장</th>
			</tr>
		</thead>
		<tbody id='seatloglist_div'>
			<c:forEach items="${adminseatloglist}" var='sl'>
					<td>${sl.u_id}</td>
					<td>${sl.s_id}</td>
					<td>${sl.start_date}</td>
					<td>${sl.end_date}</td>
					<td>${sl.real_date}</td>
					<td>${sl.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</fieldset>

     </form>  
    </div><!-- /input-group -->
     