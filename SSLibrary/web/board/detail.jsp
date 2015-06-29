<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
function del(f) {/* delete가 예약어라 del씀 */
	var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'a.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var c = confirm('수정 하시겠습니까?');
		if (c == true) {
			f.action = 'a.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
function register(f) {
	var c = confirm('리플을 등록 하시겠습니까?');
		if (c == true) {
			f.action = 'a.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
	
	/* 리플 불러오기 */
function repls() {
	var reg_date = $('#reg_date').val/* 이게 맞나 잘모르겠음 */
	$.ajax({
		type : 'POST',
		anync : 'false',
		url : 'send.do',/* 추후 수정 */
		data : {
			'reg_date' : reg_date
		},
		success : function(data) {
			display(data);
		}
	});
}
function display(data) {
	var output = '';
	output += "<table>";
	output += "<tbody>";
	$(data).each(function(index, item) {
		with (item) {
			output += '</tr>';
			output += '<td>'+content+'</td>';
			output += '<td>'+u_id+'</td>';
			output += '</tr>';
		}
	});
	output += "</tbody>";
	output += "</table>";
	
	$('#repl').html(output);
}
$(document).ready(function() {
		repls();
});
</script>
<style></style>
</head>
<body>
<h1>board detail</h1>
<form>
	<table border="1">
	<tbody>
		<tr>
			<td>제목</td>
			<td colspan="5">${boarddetail.title}</td>
		</tr>
		<tr>
			<td>분류</td>
			<td>${boarddetail.sort}</td>
			<td>글쓴날짜</td>
			<td>${boarddetail.reg_date}</td>
			<td>조회</td>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>
			<td colspan="6">
				${boarddetail.content}
			</td>
		</tr>
	</tbody>
	
	</table>
	<input type="button" value="삭제" onclick="del(this.form)"><!-- 추후 수정 -->
	<input type="button" value="수정" onclick="update(this.form)"><!-- 추후 수정 -->
</form>		
	<div id="repl">	</div>
<form>
	<div>
	<input type="hidden" id="reg_date" value="${boarddetail.id}"><br><!-- 리플때문에 보냄 -->
	<textarea rows="5" cols="40"></textarea>
	<input type="button" value="등록" onclick="register(this.form)"><!-- 추후 수정 -->
	</div>
</form>	
</body>
</html>