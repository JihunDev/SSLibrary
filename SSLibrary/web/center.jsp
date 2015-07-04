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
  </div>
	<div class="col-sm-6">
  <div id="notice" class="board">
	<font size="3px"><b>공지사항&nbsp;&nbsp;&nbsp;&nbsp;</b></font><b>
	<a class="btn btn-default btn-sm" role="button" href="boardmain.do?sort=notice">더보기</a></b>
		<table class="table table-condensed">
		<thead>
		<tr>
			<th>번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>조회수</th>
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
	<div class="col-sm-6">
	<div id="free" class="board">
	<font size="3px"><b>자유게시판&nbsp;&nbsp;&nbsp;&nbsp;</b></font><b><a class="btn btn-default btn-sm" role="button" href="boardmain.do?sort=free">더보기</a></b>
	<table class="table table-condensed">
		<thead>
		<tr>
			<th>번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>조회수</th>
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
<%-- <div id="top10book" class="col-sm-12">
<fieldset>
<font size="3px"><b>최신도서 TOP10</b><br></font>
<div id="top10bookimg">
	<c:forEach items="${book}" var="b" varStatus ="status">
				<a href="bookdetail.do?id=${b.id}"><img class="bookimg" width="70px" src="img/book/${b.img}"></a>
		<c:if test="${status.count%5==0}">
				<br><img src="img/css/shelve.gif">
		</c:if>
	</c:forEach>
</div>
</fieldset>
</div> 
<div>
<div id="test"> --%>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>3D Book Showcase</title>
		<meta name="description" content="3D Book Showcase with CSS 3D Transforms" />
		<meta name="keywords" content="3d transforms, css3 3d, book, jquery, open book, css transitions" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="bootstrap/css/default.css" />
		<link rel="stylesheet" type="text/css" href="bootstrap/css/component2.css" />
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
		<div class="container">	
			<div class="main">
			<br>
				<h3 align="center"><b>최신도서 TOP 10</b></h3>	<br>
				<ul id="bk-list" class="bk-list clearfix">
				<c:forEach items="${book}" var="b" varStatus ="status">
					<c:if test="${status.count==1}">
					<li>
						<div class="bk-book book-1">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
										<span>${b.name}</span>
										<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
									<br>
									<p>Billfish hog sucker trout-perch lenok orbicular velvetfish. </p>
								</div>
								<div class="bk-content">
									<p><br>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel?<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage delinquency and the State tries to reform him - but at what cost?</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
									<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==2}">
					<li>
						<div class="bk-book book-2">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
										<span>${b.name}</span>
										<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content">
								<br>
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet swordfish limia ghost carp filefish.</p>
								</div>
								<div class="bk-content bk-content-current">
									<p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok orbicular velvetfish. Delta smelt striped bass. <br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord of the Cata Nostra. The Catfather.</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
										<span>${b.name}</span>
										<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==3}">
					<li>
						<div class="bk-book book-3">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
										<span>${b.name}</span>
										<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
								<br>
									<p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue catfish bottlenose electric ray sablefish.</p>
								</div>
								<div class="bk-content">
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio.<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<img src="images/3.png" alt="cat"/>
								<p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth school. Navigating his way through the challenges of growing up, Holden dissects the 'phony' aspects of society.</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
									<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
				</c:if>
					<c:if test="${status.count==4}">
					<li>
						<div class="bk-book book-1">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
											<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
								<br>
									<p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black pickerel. Pacific cod.</p>
								</div>
								<div class="bk-content">
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio.<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage delinquency and the State tries to reform him - but at what cost?</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
											<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==5}">
					<li>
						<div class="bk-book book-2">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
											<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content">
								<br>
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet swordfish limia ghost carp filefish.</p>
								</div>
								<div class="bk-content bk-content-current">
									<p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok orbicular velvetfish. Delta smelt striped bass.<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord of the Cata Nostra. The Catfather.</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
								<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==6}">
						<li>
						<div class="bk-book book-3">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
										<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
								<br>
									<p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue catfish bottlenose electric ray sablefish.</p>
								</div>
								<div class="bk-content">
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio.<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<img src="images/3.png" alt="cat"/>
								<p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth school. Navigating his way through the challenges of growing up, Holden dissects the 'phony' aspects of society.</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
									<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==7}">
			  	<li>
						<div class="bk-book book-1">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
										<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
								<br>
									<p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black pickerel. Pacific cod.</p>
								</div>
								<div class="bk-content">
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod.<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage delinquency and the State tries to reform him - but at what cost?</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
									<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==8}">
				<li>
						<div class="bk-book book-2">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
										<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content">
								<br>
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet swordfish limia ghost carp filefish.</p>
								</div>
								<div class="bk-content bk-content-current">
									<p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black pickerel. Pacific cod.</p>
								</div>
							</div>
							<div class="bk-back">
								<p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord of the Cata Nostra. The Catfather.<br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
									<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
				<c:if test="${status.count==9}">
					<li>
						<div class="bk-book book-3">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
											<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
								<br>
									<p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue catfish bottlenose electric ray sablefish.</p>
								</div>
								<div class="bk-content">
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. <br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<img src="images/3.png" alt="cat"/>
								<p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth school. Navigating his way through the challenges of growing up, Holden dissects the 'phony' aspects of society.</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
										<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					<c:if test="${status.count==10}">
					<li>
						<div class="bk-book book-1">
							<div class="bk-front">
								<div class="bk-cover-back"></div>
								<div class="bk-cover">
									<h2>
											<span>${b.name}</span>
									<span>${b.writer}</span>
									</h2>
								</div>
							</div>
							<div class="bk-page">
								<div class="bk-content bk-content-current">
								<br>
									<p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black pickerel. Pacific cod.</p>
								</div>
								<div class="bk-content">
									<p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind shark California halibut; false trevally warty angler!</p>
								</div>
								<div class="bk-content">
									<p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra danio. <br><a href="bookdetail.do?id=${b.id}"><b>자세히 보기</b></a></p>
								</div>
							</div>
							<div class="bk-back">
								<p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage delinquency and the State tries to reform him - but at what cost?</p>
							</div>
							<div class="bk-right"></div>
							<div class="bk-left">
								<h2>
										<span>${b.name}</span>
									<span>${b.writer}</span>
								</h2>
							</div>
							<div class="bk-top"></div>
							<div class="bk-bottom"></div>
						</div>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				<div class="bookshelf"></div>
			</div>
		</div><!-- /container -->
	 	<script src="bootstrap/js/books2.js"></script>
		<script>
			$(function() {

				Books.init();

			});
		</script>
	</body>







