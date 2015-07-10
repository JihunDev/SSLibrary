<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Insert title here</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<!-- Respomsive slider -->
<link href="bootstrap/css/responsive-calendar.css" rel="stylesheet">


<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/**Global CSS**/
* {
	margin: 0;
	pading: 0;
}

body {
	background-image: url("img/css/librarybackground.jpg");
	background-color: #cccccc;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

table {
	border-collapse: separate;
	border-spacing: 0 5px;
}

th {
	background-color: #337ab7;
	color: white;
	text-align: center;
	vertical-align: middle;
}

td {
	vertical-align: middle;
}

thead th {
	background-color: #337ab7;
	color: white;
	text-align: center;
	vertical-align: middle;
}

tbody td {
	background-color: #EEEEEE;
	text-align: center;
	vertical-align: middle;
}

tr td:first-child, tr th:first-child {
	border-top-left-radius: 6px;
	border-bottom-left-radius: 6px;
}

tr td:last-child, tr th:last-child {
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
}


table.scroll tbody,
table.scroll thead { display: block; }

table.scroll thead tr th { 
    height: 20px;
    width : 700px;
    line-height: 20px;
    /* text-align: left; */
}

table.scroll tbody {
    height: 500px; 
    overflow-y: auto;
    overflow-x: hidden;
}
table.scroll tbody tr td{
	width : 700px;
}



.centered-form {
	margin-top: 40px;
	margin-bottom: 40px;
	margin-left: -550px;
	width: 1800px;
}

.centered-form .panel {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}

.fieldsetform {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	margin-top: 40px;
	padding: 20px;
	border-radius: 10px 10px 10px 10px;
}

.top10bookbackground {
	background-image: url("img/css/woodback.jpg");
}

.board {
	background: rgba(255, 255, 255, 0.8);
	border-radius: 10px 10px 10px 10px;
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}

/* fieldset {
    border: 5px solid #f0c413;
    background: white;
    border-radius: 5px;
    padding: 15px;
    margin : 0 auto;
    width : 160px;
} */

/** Header CSS**/
header {
	height: 200px;
	margin: 0 auto;
	/* background : white; */ /* #f0c413; */ /*  #EB613B; */
	position: relative;
	background-image: url("img/css/Cover copy.jpg");
	/* border-left : solid #f0c413 1px;
	border-right : solid #f0c413 1px; */
}

header>#top {
	position: absolute;
	top: 0;
	right: 50px;
	width: 480px;
	height: 55px;
	line-height: 55px;
	background: #8a4c25;
	background: rgba(137, 73, 35, 0.6);
	border-radius: 0px 0px 10px 10px;
	float: right;
	padding: 0px 10px;
}

header>#afterlogin {
	position: absolute;
	top: 0;
	right: 50px;
	width: 400px;
	height: 55px;
	line-height: 55px;
	background: #8a4c25;
	background: rgba(137, 73, 35, 0.6);
	border-radius: 0px 0px 10px 10px;
	float: right;
}

header>#afterlogin {
	padding: 0px 10px;
}

header>#afterlogin>fieldset>div>a>b {
	color: white;
}

header>#afterlogin>fieldset>div {
	padding: 0px 9px;
	float: left;
}

heaer>#top>fieldset>form>.form-group {
	align: center;
}

header>#logo>#mainname {
	position: absolute;
	top: 25px;
	left: 43%;
}

/** Nav CSS**/
nav {
	height: 45px;
	margin: 0 auto;
	background: rgb(255, 255, 255); /* Old browsers */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255,
		255, 255, 1)), color-stop(3%, rgba(225, 225, 225, 1)),
		color-stop(47%, rgba(241, 241, 241, 1)),
		color-stop(100%, rgba(246, 246, 246, 1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, rgba(255, 255, 255, 1) 0%,
		rgba(225, 225, 225, 1) 3%, rgba(241, 241, 241, 1) 47%,
		rgba(246, 246, 246, 1) 100%); /* Chrome10+,Safari5.1+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
		endColorstr='#f6f6f6', GradientType=0); /* IE6-9 */
	border-top: solid white 2px opacity.5;
	border-bottom: solid #dcdbdb 1px;
	line-height: 45px;
	color: black;
}

nav>#bottom {
	width: 900px;
	margin: 0 100px;
}

nav>#bottom>ul>li {
	float: left;
}

nav>#bottom>ul>li>a {
	width: 150px;
	margin: 20px 20px;
	font-size: 1.0em;
	color: black;
}

nav>#bottom>ul>li>a:hover {
	color: red;
}

/** Section CSS**/
section {
	width: 100%;
	/* 	height : 600px; */
	margin: 0 auto;
}

#left {
	width: 25%;
	/* 	height : 600px; */
	padding-top: 9px;
	float: left;
	background: rgba(250, 230, 195, 0.4);
}

#left>div {
	margin: 10px 10px;
}

#center {
	width: 60%;
	/* 	height : 600px; */
	float: left;
	margin: 0px 0px 0px 100px;
	background: rgba(255, 255, 255, 0.4);
}

#notice {
	width: 325px;
	height: 180px;
	padding: 10px;
	margin: 0px 30px 0px 0px;
}

#free {
	width: 325px;
	height: 180px;
	padding: 10px;
}

#top10book {
	padding: 10px 20px 10px 10px;
	margin: 10px 50px 10px 50px;
}

#top10book>fieldset>#top10bookimg>img {
	margin: 0px 10px 0px 10px;
	align: center;
	right: 20px;
}

#top10bookimg {
	margin: 0 10px;
}

.bookimg {
	margin: 0px 10px;
}

/** Footer CSS**/
footer {
	width: 100%;
	height: 121px;
	margin: 0 auto;
	background: #8a4c25;
	background: rgba(137, 73, 35, 0.6);
	border-top: solid #8a4c25 2px;
	color: white;
	line-height: 121px;
}

footer>div {
	width: 600px;
	height: 50px;
	margin: 30px 30px;
}

#myCarousel {
	width: 93%;
	margin: 42px 10px 20px 32px;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	height: 300px;
	margin: auto;
}

.calendar {
	background: rgba(255, 255, 255, 0.8);
	border-radius: 10px 10px 10px 10px;
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
<script>
	function makeHeight() {
		var section = document.querySelector("#section");
		var left = document.querySelector("#left");
		var center = document.querySelector("#center");

		var mHeight = center.clientHeight + 30;
		/* ClientHeight를 써서 표 높이만큼 늘리게 함. */
		if (mHeight < 850) {
			mHeight = 850;
		}
		center.style.height = mHeight + 'px';
		section.style.height = mHeight + 'px';
		left.style.height = mHeight + 'px';
	}
	window.onload = function() {
		makeHeight();
		/* setInterval(function(){
			$.ajax({
				async : 'false',
				url : 'stopborrowbook.do',
				success : function(data) {
					//alert(data);
				},
				error : function() {
				//	alert("으앙 에러 ㅠㅠ")
				}
			});
		}, 5000);	
		  //유저 초기화
		   setInterval(function(){
		      $.ajax({
		         async : 'false',
		         url : 'resetuser.do',
		         success : function(data) {
		         },
		         error : function() {
		         }
		      });
		   }, 5000); */

		<%-- setInterval(function() {
			$.ajax({
				async : 'false',
				url : 'msgchecked.do',
				data : {
					'id' : "${user.id}"
				},
				success : function(data) {
					display(data);
				},
				error : function(data) {

				}
			});
		}, 5000);
		function display(data) {
			document.getElementById("msgnumber").innerHTML = data;
			if ("${msgcheck}" != null) {
				<%session.removeAttribute("msgcheck");%>
			}
		}
		;
 --%>
	};
</script>
</head>
<body>
	<header>
		<jsp:include page="${top}" />
	</header>
	<nav><jsp:include page="${nav}" /></nav>
	<section id="section">
		<aside id="center">
			<jsp:include page="${center}" />
		</aside>
		<aside id="left">
			<jsp:include page="${left}" />
		</aside>
	</section>
	<footer>
		<div>
			<h5>SDS Campus Secure Code Team 5 : YouSangYi | LeeDongWoo |
				KimJiHun</h5>
			<h6>@2015 sangyi design inc. All rights Reserved. Privacy policy
				| Terms of Use</h6>
		</div>
	</footer>
</body>
</html>