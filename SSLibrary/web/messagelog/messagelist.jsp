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
function m_list(){
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
	output += "<tr><th>ID</th><th>TEXT</th></tr>";
	output += "</thead>";
	output += "<tbody>";
	$(data).each(function(index, item) {
						with (item) {
							output += '<tr>';
							output += '<td>'+send_id+'</td>';
							output += '<td>'+text+'</td>';
							output += '</tr>';
						}
					});
	output += "</tbody>";
	output += "</table>";
	$('#messagelist').html(output);
};

$(document).ready(function() {
	setInterval('m_list()',5000);		
});
</script>
<style></style>
</head>
<body>
<h1>메세지 list</h1>
<div id="messagelist">
	
</div>
</body>
</html>