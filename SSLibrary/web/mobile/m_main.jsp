<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>SSLibrary Mobile</title>
<link rel="stylesheet"
   href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

  <link rel="stylesheet" href="mobile/themes/jquery.mobile.icons.min.css" />
  <link rel="stylesheet" href="mobile/themes/a.css" />
  <script
   src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
   $.mobile.defaultPageTransition = "slide";
   function moveNoHistory(url) {
        $.mobile.changePage(url, {
            changeHash : false
        });
    }
   
   function contentHeight() {
       var screen = $.mobile.getScreenHeight(),
           header = $(".ui-header").hasClass("ui-header-fixed") ? $(".ui-header").outerHeight() - 1 : $(".ui-header").outerHeight(),
           footer = $(".ui-footer").hasClass("ui-footer-fixed") ? $(".ui-footer").outerHeight() - 1 : $(".ui-footer").outerHeight(),
           /* content div has padding of 1em = 16px (32px top+bottom). This step
      can be skipped by subtracting 32px from content var directly. */
           contentCurrent = $(".ui-content").outerHeight() - $(".ui-content").height(),
           content = screen - header - footer - contentCurrent;
       /* apply result */
       $(".ui-content").height(content);
   }

   $(document).on("pagebeforecreate", contentHeight);   
   
</script>
<style>
.ui-header, .ui-footer {
    /*   border-width: 0 0 !important;*/
}
</style>
</head>
<body>
   <div data-role="page" data-add-back-btn="true" data-position="fixed" class="jqm-demos ui-page ui-page-active ui-page-header-fixed ui-page-footer-fixed">
      <div data-role="panel" id="myPanel" data-display="overlay"  style="background-color : #c2d9eb;">
         <h2>${user.name} 님 환영합니다.</h2>
         <img width="150px" height="150px"  style=" border: 5px solid #256799; border-radius: 120px; background-position: center center;" src="img/user/${user.img}">
         <a href="m_modify.do?id=${user.id}" data-role="button">개인정보수정</a>
         <a href="m_logout.do" data-role="button">logout</a>
      </div>
      <div data-role="header" data-position="fixed">
         <c:if test="${user != null}">
             <a href="#myPanel" class="ui-btn ui-shadow ui-corner-all ui-icon-arrow-r ui-btn-icon-notext">Open</a>
            <a href="m_center.do" class="ui-btn ui-shadow ui-corner-all ui-icon-home ui-btn-icon-notext">Home</a>
         </c:if>
         <h1>SSLibrary</h1>
      </div>
      <div data-role="main" class="ui-content ui-content jqm-content jqm-fullwidth jqm-fullheight" style="background-image: url(img/mobile/m_back.jpg); background-size : 100% 100%;">
                   <jsp:include page="${m_center}" />
      </div>
      <div data-role="footer" data-position="fixed">
         <a href="#" data-rel="back" class="ui-btn ui-shadow ui-corner-all ui-icon-arrow-l ui-btn-icon-notext">back</a>
      </div>
   </div>
</body>
</html>