<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<div id="top">
<h1 id="mainname"><a href="main.do"><img width="80%"src="img/css/mainname.gif"></a></h1>
</div>
<div id="bottom">
<ul>
<%if(user!=null && user.getIsadmin().equals("y")){ %>
<li><a href="seatmain.do"><b>열람실관리</b></b></a></li>
<li><a href="bookmain.do"><b>자료실관리</b></a></li>
<li><a href="#"><b>회원관리</b></a></li>
<%}else{%>
<li><a href="seatmain.do"><b>열람실</b></b></a></li>
<li><a href="bookmain.do"><b>자료실</b></a></li>	
<%} %>
</ul>
</div>