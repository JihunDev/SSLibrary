<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes, width=device-width">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>SSLibrary Mobile</title>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="mobile/themes/jquery.mobile.icons.min.css" />
<link rel="stylesheet" href="mobile/themes/a.css" />
<script>
	$(document).bind('mobileinit', function() {
		$.mobile.ajaxEnabled = 'false';
	});
</script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script>
	$.mobile.defaultPageTransition = "slide";

	//화면 높이
	function contentHeight() {
		var screen = $.mobile.getScreenHeight(), header = $(".ui-header")
				.hasClass("ui-header-fixed") ? $(".ui-header").outerHeight() - 1
				: $(".ui-header").outerHeight(), footer = $(".ui-footer")
				.hasClass("ui-footer-fixed") ? $(".ui-footer").outerHeight() - 1
				: $(".ui-footer").outerHeight(), contentCurrent = $(
				".ui-content").outerHeight()
				- $(".ui-content").height(), content = screen - header - footer
				- contentCurrent;
		$(".ui-content").height(content);
	}
	$(document).on("pagecontainerbeforeshow", contentHeight);
</script>
<style>
</style>
</head>
<body>
	<div data-role="page" id="listpage" data-add-back-btn="true"
		data-position="fixed"
		class="jqm-demos ui-page ui-page-active ui-page-header-fixed ui-page-footer-fixed">
		<div data-role="panel" id="myPanel" data-display="overlay"
			style="background-color: #c2d9eb; width: 200px;">
			<h2>${user.name}님<br>환영합니다.
			</h2>
			<img width="150px" height="150px"
				style="border: 5px solid #256799; border-radius: 120px; background-position: center center;"
				src="img/user/${user.img}"> <a
				href="m_modify.do?id=${user.id}" data-role="button">개인정보수정</a> <a
				href="m_logout.do" data-role="button">logout</a>
		</div>
		<div data-role="header" data-position="fixed">
			<c:if test="${user != null}">
				<a href="#myPanel"
					class="ui-btn ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext">Open</a>
			</c:if>
			<h1>SangSang Library</h1>
		</div>
		<div data-role="main"
			class="ui-content ui-content jqm-content jqm-fullwidth jqm-fullheight"
			style="background-image: url(img/mobile/m_back.jpg); background-size: 100% 100%;">
			<jsp:include page="${m_center}" />
		</div>
		<div data-role="footer" data-position="fixed">
			<c:if test="${user == null}">
				<h3>Secure Code Team 5</h3>
			</c:if>
			<c:if test="${user != null}">
				<div data-role="navbar" style="background-color: #266999">
					<ul>
						<li><a href="#" data-rel="back"
							style="background-color: #266999"
							class="ui-btn ui-shadow ui-corner-all ui-icon-arrow-l ui-btn-icon-top">back</a></li>
						<li><a href="m_center.do" style="background-color: #266999"
							class="ui-btn ui-shadow ui-corner-all ui-icon-home ui-btn-icon-top">Home</a></li>
						<li><a href="m_usinginfo.do?id=${user.id}"
							style="background-color: #266999"
							class="ui-btn ui-shadow ui-corner-all ui-icon-star ui-btn-icon-top">이용정보</a></li>
						<li><a href="#" style="background-color: #266999"
							class="ui-btn ui-shadow ui-corner-all ui-icon-arrow-l ui-btn-icon-top"><span
								id="msgnumber">${msgcheck}</span><br> <span id="msgnumber">${msgcheck}</span>
						</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>