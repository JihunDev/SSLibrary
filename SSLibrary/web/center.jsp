<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script>
</script>
	<!-- 움직이는 광고-->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/css/Library01.jpg">
      </div>
      <div class="item">
        <img src="img/css/Library02.jpg">
      </div>
    
      <div class="item">
        <img src="img/css/Library03.jpg">
      </div>

      <div class="item">
        <img src="img/css/Library04.jpg">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <div id="notice">
<font size="5px">공지사항&nbsp;&nbsp;&nbsp;&nbsp;</font><b><a class="btn btn-default btn-xs" role="button" href="boardmain.do?sort=notice">더보기</a></b>
</div>  
<div id="free">
<font size="5px">자유게시판&nbsp;&nbsp;&nbsp;&nbsp;</font><b><a class="btn btn-default btn-xs" role="button" href="boardmain.do?sort=free">더보기</a></b>
</div>
<div ID="lastbook">
<font size="5px">최신 도서 TOP10</font>

</div>

