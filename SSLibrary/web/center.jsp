<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
	<!-- 움직이는 광고-->
	<div class="maincenter1">
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
        <div class="carousel-caption">
          <h3>Library</h3>
          <p>넓고 책 읽기 좋은 공간</p>
        </div>
      </div>
      <div class="item">
        <img src="img/css/Library02.jpg">
        <div class="carousel-caption">
          <h3>bookshelves</h3>
          <p>100여권의 책 보유, 빠른 대여 및 정보 파악 가능</p>
        </div>
      </div>
    
      <div class="item">
        <img src="img/css/Library03.jpg">
        <div class="carousel-caption">
          <h3>Reading Room</h3>
          <p>실시간으로 좌석 정보를 확인하고 예약 할 수 있는 곳</p>
        </div>
      </div>

      <div class="item">
        <img src="img/css/Library04.jpg">
        <div class="carousel-caption">
          <h3>SangSang Library</h3>
          <p>당신을 기다리고 있습니다.</p>
        </div>
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
  </div>
  
  
  
  	 <div class="col-lg-12 main-chart">
  
            <div class="row mt">
                      <!-- SERVER STATUS PANELS -->
                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn donut-chart">
                      			<div class="white-header" style="padding : 5px;">
                      				<div class="col-sm-7 col-xs-7 goright">
						  			<h5>공지사항</h5>
						  			</div>
									<a class="btn btn-default btn-sm" role="button" href="boardmain.do?search=false&sort=notice">더보기</a>

                      			</div>
								<div class="centered">
								<div class="col-md-12 col-sm-12 mb">
								<table class="table table-striped">
									<thead>
									<tr>
										<th  style="text-align : center;">번호</th>
										<th  style="text-align : center;">글쓴이</th>
										<th  style="text-align : center;">제목</th>
										<th  style="text-align : center;">조회수</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${notice}" var="n">
										<tr>
											<td>${n.id}</td>
											<td>${n.u_id}</td>
											<td><a href="boarddetail.do?id=${n.id}">${n.title}</a></td>
											<td>${n.counter}</td>
										</tr>
									</c:forEach>
									</tbody>
									</table>
									</div>
									</div>
	                      	</div><! --/grey-panel -->
                      	</div><!-- /col-md-4-->
                      	

                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn">
                      			<div class="white-header" style="padding : 5px;">
                      			<div class="col-sm-7 col-xs-7 goright">
						  			<h5>자유게시판</h5>
						  			</div>
						  			<a class="btn btn-default btn-sm" role="button" href="boardmain.do?search=false&sort=free">더보기</a>
                      			</div>
	                      		<div class="centered">
	                      		<div class="col-md-12 col-sm-12 mb">
									<table class="table table-striped">
									<thead>
									<tr>
										<th  style="text-align : center;">번호</th>
										<th  style="text-align : center;">글쓴이</th>
										<th  style="text-align : center;">제목</th>
										<th  style="text-align : center;">조회수</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${free}" var="f">
										<tr>
											<td>${f.id}</td>
											<td>${f.u_id}</td>
											<td><a href="boarddetail.do?id=${f.id}">${f.title}</a></td>
											<td>${f.counter}</td>
										</tr>
									</c:forEach>
									</tbody>
									</table>
									</div>
	                      		</div>
                      		</div>
                      	</div><!-- /col-md-4 -->
                      	
						<div class="col-md-4 mb">
							<!-- WHITE PANEL - TOP USER -->
							<div class="white-panel pn">
								<div class="white-header">
									<h5>관리자</h5>
								</div>
								<p><img src="img/user/index.jpg" class="img-circle" width="80"></p>
								<p><b>Library Manager</b></p>
								<div class="row">
									<div class="col-md-6">
										<p class="small mt">MANAGER SINCE</p>
										<p>2015.06</p>
									</div>
									<div class="col-md-6">
										<p class="small mt">PERIOD YEAR</p>
										<p>4 years</p>
									</div>
								</div>
							</div>
						</div><!-- /col-md-4 -->
                      	

                    </div><!-- /row -->
  
  
  

	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="bootstrap/css/default.css" />
	<!-- 	<link rel="stylesheet" type="text/css" href="bootstrap/css/component2.css" /> -->
		<link rel="stylesheet" type="text/css" href="bootstrap/css/component.css" />
		<script src="bootstrap/js/modernizr.custom.js"></script>
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-7243260-2']);
		  _gaq.push(['_trackPageview']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
	</head>
	<body>
	 <div class="row mt">
		<br>
		<div class="well well-sm"><b>최신 도서 5</b></div>
		<div class="main">
				<ul id="bk-list" class="bk-list clearfix">
				<c:forEach items="${book}" var="b" varStatus ="status">
					<li>
						<div class="bk-book book-${status.count} bk-bookdefault">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
								<a href="bookdetail.do?id=${b.id}"><img src="img/book/${b.img}"></a> 
								</div>
							</div>
							<div class="bk-page">
							</div>
							<div class="bk-back">
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
						<div class="bk-info">
							<h3>
								<span>${b.name}</span>
								<span>${b.writer}</span>
							</h3>
						</div>
					</li>
					</c:forEach>
				</ul>	
		<script src="bootstrap/js/books1.js"></script>
		<script>
			$(function() {

				Books.init();

			});
		</script>
		</div></div></div>
	</body>







