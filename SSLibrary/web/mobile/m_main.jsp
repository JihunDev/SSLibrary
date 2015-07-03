<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
$.mobile.pageLoadErrorMessage = "실패"
</script>
</head>
<body>
<div data-role="page">

  <div data-role="header">
  
    <jsp:include page="${m_top}"/>
  </div>
  <div data-role="main" class="ui-content">
   	<jsp:include page="${m_center}"/>
  </div>
  <div data-role="footer">
    <h1>Footer Text</h1>
  </div>
</div>	
</body>
</html>