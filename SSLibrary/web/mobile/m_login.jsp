<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
<div data-role="page" id="login">
  <div data-role="header">
  	 <h1>SS Library</h1> 
  </div>
  <div data-role="main" class="ui-content">
  <form action="register.do" method="POST">
	<input type="text" name="textinput-s" id="id" placeholder="ID" data-clear-btn="true">
	<input type="text" name="textinput-s" id="pwd" placeholder="PASSWORD" data-clear-btn="true">    
  </form>
  	<fieldset class="ui-grid-a">
		<div class="ui-block-a">
			<a href="register.jsp" data-inline="true" data-role="button">회원가입</a>
		</div>
	  	<div class="ui-block-b">
	  		<input type="submit" data-inline="true" value="로그인">
	 	 </div>
	</fieldset>
  </div>
</div> 
</body>
</html>