<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<div id="top">
<h1 id="mainname"><a href="main.do"><img width="80%"src="img/css/mainname.gif"></a></h1>
</div>
<div id="sub">
<font id="text">도서 검색 :</font>
<select id="issearch">
<option value="">선택</option>
<option value="name">책이름</option>
<option value="writer">저자</option>
</select>
	<select id="category">
	<option value="">선택</option>
	<option value="i">IT</option>
	<option value="n">소설</option>
	<option value="m">만화책</option></select>
	<input type="text" id="search">
	<input type="button" value="검색" onclick="getBook();">
</div>
<div id="bottom">
<ul>
<li><a href="seatmain.do"><b>열람실</b></b></a></li>
<li><a href="bookmain.do"><b>자료실</b></a></li>
</ul>
</div>