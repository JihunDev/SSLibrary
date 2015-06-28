<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(document).ready(function(){
var borrowbook = $('#borrowbook').val();
		if(borrowbook==1){
			alert("이미 빌린 책입니다.")	
		}else if(borrowbook==2){
			alert("현재 도서가 0개입니다. 대여가 불가능 합니다.")	
		}else if(borrowbook==3){
			alert("대여가 완료되었습니다.");
		}

});
</script>
<style></style>
</head>
<body>
<h1 align="center">Book Detail Page</h1>
<fieldset>
<legend>Book Detail</legend>
<table width="700"> <!-- 추후수정 -->
<tr><td rowspan="7"><img width="200px" src="img/book/${bookdetail.img}"></td><th>ID</th><td>${bookdetail.id}</td></tr>
<tr><th>책제목</th><td>${bookdetail.name}</td></tr>
<tr><th>저자</th><td>${bookdetail.writer}</td></tr>
<tr><th>자료실</th><td>${bookdetail.floor}</td></tr>
<tr><th>보유갯수</th><td>${bookdetail.total_qt}</td></tr>
<tr><th>대여가능갯수</th><td>${bookdetail.current_qt}</td></tr>
<tr><th>등록일</th><td>${bookdetail.reg_date}</td></tr>
</tbody>
</table>
<input type="hidden" id="borrowbook" value="${borrowbook}">
<%if(user!=null && user.getIsadmin().equals("y")){ %>
<div><a href="bookmodify.do?id=${bookdetail.id}">수정</a></div>
<div><a href="javascript:;" onClick="if (confirm('정말 삭제하시겠습니까?')) location.href='bookremoveimpl.do?id=${bookdetail.id}'">삭제</a></div>
<div><a href="javascript:;" onClick="if (confirm('대여하시겠습니까?')) location.href='userbookregister.do?id=${bookdetail.id}'">대여</a></div>
<%}else if(user!=null && user.getIsadmin().equals("n")){ %>
<div><a href="userbookregister.do?id=${bookdetail.id}">대여</a></div>
<%}else{ %>
<%} %>
</fieldset>
</body>
</html>