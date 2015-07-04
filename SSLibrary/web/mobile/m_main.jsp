<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SSLibrary Mobile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	$(document).bind("mobileinit", function() {
		$.mobile.page.prototype.options.addBackBtn = true;
	});
</script>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
	$.mobile.defaultPageTransition = "fade";
	$.mobile.loadingMessage = "페이지 로딩중...";
	$.mobile.pageLoadErrorMessage = "페이지 로딩실패";
</script>
<style></style>
</head>
<body>
	<div data-role="page" data-add-back-btn="true">
		<div data-role="panel" id="myPanel" data-display="overlay">
			<h2>${user.name} 님 환영합니다.</h2>
			<a href="m_logout.do" data-role="button">logout</a>
		</div>
		<div data-role="header">
			<a href="#myPanel"
				class="ui-btn ui-btn-inline ui-corner-all ui-shadow">Open Panel</a>
			<h1>라이브러리</h1>
		</div>
		<div data-role="main" class="ui-content">
			<jsp:include page="${m_center}" />
		</div>
		<div data-role="footer">
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext">back</a>
		</div>
	</div>
</body>
</html>