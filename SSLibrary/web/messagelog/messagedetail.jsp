<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="700"> <!-- 추후수정 -->
		<tr><th>보낸 사람</th><td>${messagelogdetail.u_id}</td></tr>
		<tr><th>내용</th><td>${messagelogdetail.text}</td></tr>
		<tr><th>보낸 시간</th><td>${messagelogdetail.send_date}</td></tr>
</table>
</body>
</html>