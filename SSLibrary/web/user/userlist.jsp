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
/* 관리자 화면 */
function u_list(){
	$.ajax({
		type : 'POST',
		anync : 'false',
		url : 'send.do',/* 추후 수정 */
		success : function(data) {
			display(data);
		}
	});
};

function display(data) {
	var output = '';
	output += "<table>";
	output += "<thead>";
	output += "<tr><th>ID</th><th>PWD</th><th>NAME</th><th>TEL</th><th>E-MAIL</th></tr>";
	output += "</thead>";
	output += "<tbody>";
	$(data).each(function(index, item) {
						with (item) {
							output += '<tr>';
							output += '<td><a href="userdetail.do?id='+id+'">'+id+'</a></td>';
							output += '<td>'+pwd+'</td>';
							output += '<td>'+name+'</td>';
							output += '<td>'+phone+'</td>';
							output += '<td>'+email+'</td>';
							output += '</tr>';
						}
					});
	output += "</tbody>";
	output += "</table>";
	$('#userlist').html(output);
};

$(document).ready(function() {
	u_list();		
});
</script>
<style></style>
</head>
<body>
<h1>User list</h1>
<div id="userlist">
	
</div>
</body>
</html>