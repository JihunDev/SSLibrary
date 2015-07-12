<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>
<script>
function displayuserinfo(data) {	
	if(data != null){
	   var output = '';	  
	   output += '<h4><table class="table table-hover theadcolor" id="seatuserinfo" width="700"><tbody>';
	   output += '<tr><td rowspan="6" colspan="2"><img height="200px" src="img/user/'+ data.img+'"></td>';
	   output += '<tr><th>좌석 ID</th><td>' + data.s_id + '</td></tr>';
	   output += '<tr><th>사용자 ID</th><td>' + data.u_id + '</td></tr>';
	   output += '<tr><th>사용자이름</th><td>' + data.name + '</td></tr>';
	   output += '<tr><th>TEL</th><td>' + data.phone+ '</td></tr>';
	   output += '<tr><th>e-mail</th><td>' + data.email + '</td></tr>';
	   output += '<tr><th style="width:200px;">등록 시간</th><td colspan="3" style="text-align:center;">' + data.start_time + '</td></tr>';
	   output += '<tr><th style="width:200px;">종료 예정 시간</th><td colspan="3" style="text-align:center;">' + data.end_time + '</td></tr>';
	   output += '<tr><th style="width:200px;">연장 횟 수</th><td colspan="3" style="text-align:center;">' + data.renew_qt + '</td></tr>';	   
	   output += '</tbody></table></h4>';	   
	   $('#userinfo').html(output);
	}
}
</script>
<div id="userinfo">
</div>