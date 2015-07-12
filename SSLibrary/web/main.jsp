
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
<title>SangSang Library</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!--external css-->
<link href="bootstrap/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="bootstrap/css/style.css" rel="stylesheet">
<link href="bootstrap/css/style-responsive.css" rel="stylesheet">

<!--     <script src="bootstrap/js/chart-master/Chart.js"></script> -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#myCarousel {
	width: 100%;
}

a {
	text-decoration: none;
	color: black;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	margin: auto;
}

.navbar-default {
	position: fixed;
	left: 0;
	right: 0;
	z-index: 1002;
	background: #66c1bd;
	border-bottom: 1px solid #5eada9;
	min-height: 60px;
	padding: 0 15px;
	border-radius: 0px 0px 0px 0px;
}

.fieldsetform {
	margin: 6% 6% 6% 6%;
}

.givemargin {
	margin-top: 3%;
	width: 100%;
}

.table {
	text-align: center;
}

.table>thead>tr>th {
	text-align: center;
}

.theadcolor>thead>tr>th {
	background: #66c1bd;
	color: white;
	vertical-align: middle;
}

.btncolor {
	background: #66c1bd;
	color: white;
	vertical-align: middle;
}

.listtabletitle {
	height: 100px;
}

.listpagingnum {
	text-align: center;
	font-size: large;
}
</style>
<script>
 /*function makeHeight() {
   var section = document.querySelector("#main-content");
   var center = document.querySelector("#center");

   var mHeight = center.clientHeight + 30;
   // ClientHeight를 써서 표 높이만큼 늘리게 함.
   if (mHeight < 400) {
      mHeight = 690;
   }
   center.style.height = mHeight + 'px';
   section.style.height = mHeight + 'px';
}
$(document).ready(function() {
   makeHeight();
}); */
<%--    $(document).ready(function() {
      setInterval(function() { //좌석 자동 반납
         $.ajax({
            async : 'false',
            url : 'expireseat.do',
            data : {},
            success : function(data) {
               //      alert(data);
            },
            error : function(data) {
               //alert("좌석 자동반납이 종료 안 돼");
            }
         });
      }, 5000);

      setInterval(function() { //연체된 사람 정지되게 함.
         $.ajax({
            async : 'false',
            url : 'stopborrowbook.do',
            success : function(data) {
               //   alert(data);
            },
            error : function() {
               //   alert("으앙 에러 ㅠㅠ")
            }
         });
      }, 5000);

      setInterval(function() {
         $.ajax({
            async : 'false',
            url : 'resetuser.do',
            success : function(data) {
            },
            error : function() {
            }
         });
      }, 5000);
   });
   window.onload = function() {
      setInterval(function() {
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
   }; --%>
// 사이즈 조절 
	function resize_main(){
		var windowwidth = $(window).width();
		var classname = document.getElementById("msg_ul");
		if(classname != null){
			if (windowwidth < 600) {
				$('#top_menu').css('margin-left','1%');
				$('#logo').css('margin-left','-1%');
				$('#msg_ul').css('float','right');
				document.getElementById("msg_ul").className = 'dropdown-menu dropdown-menu-right extended inbox'; 
			}else{
				$('#top_menu').css('margin-left','92px');
				$('#logo').css('margin-left','1%');
				document.getElementById("msg_ul").className = 'dropdown-menu extended inbox'; 
			}
		}
	};
	
	$(document).ready(function(){
		resize_main();
	});
	$(window).resize(function(){
		resize_main();
		
	});

</script>
</head>

<body>

	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->
		<nav class="navbar navbar-default" role="navigation">
			<jsp:include page="${top}" />
		</nav>
		<!--header end-->

		<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
		<!--sidebar start-->
		<aside>
			<div id="sidebar">
				<!-- sidebar menu start-->
				<jsp:include page="${nav}" />
			</div>
		</aside>
		<!--sidebar end-->

		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section id="main-content">
			<section id="center" class="wrapper">
				<div class="row">
					<jsp:include page="${center}" />

					<%--    <div class="row">
                  <!-- TWITTER PANEL -->
                  <div class="col-md-4 mb">
                            <div class="darkblue-panel pn">
                               <div class="darkblue-header">
                             <h5>DROPBOX STATICS</h5>
                               </div>
                        <canvas id="serverstatus02" height="120" width="120"></canvas>
                        <script>
                           var doughnutData = [
                                 {
                                    value: 60,
                                    color:"#68dff0"
                                 },
                                 {
                                    value : 40,
                                    color : "#444c57"
                                 }
                              ];
                              var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                        </script>
                        <p>April 17, 2014</p>
                        <footer>
                           <div class="pull-left">
                              <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                           </div>
                           <div class="pull-right">
                              <h5>60% Used</h5>
                           </div>
                        </footer>
                            </div><! -- /darkblue panel -->
                  </div><!-- /col-md-4 -->
                  
                  
                  <div class="col-md-4 mb">
                     <!-- INSTAGRAM PANEL -->
                     <div class="instagram-panel pn">
                        <i class="fa fa-instagram fa-4x"></i>
                        <p>@THISISYOU<br/>
                           5 min. ago
                        </p>
                        <p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
                     </div>
                  </div><!-- /col-md-4 -->
                  
                  <div class="col-md-4 col-sm-4 mb">
                     <!-- REVENUE PANEL -->
                     <div class="darkblue-panel pn">
                        <div class="darkblue-header">
                           <h5>REVENUE</h5>
                        </div>
                        <div class="chart mt">
                           <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                        </div>
                        <p class="mt"><b>$ 17,980</b><br/>Month Income</p>
                     </div>
                  </div><!-- /col-md-4 -->
                  
               </div><!-- /row -->
             --%>

				</div>
				<!-- /col-lg-9 END SECTION MIDDLE -->

				</div>
				<!--  /row  -->
			</section>
		</section>

		<!--main content end-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				SDS Campus Secure Code Team 5 : YouSangYi | LeeDongWoo | KimJiHun <a
					href="main.do" class="go-top"> <i class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="bootstrap/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="bootstrap/js/jquery.scrollTo.min.js"></script>
	<script src="bootstrap/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="bootstrap/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="bootstrap/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="bootstrap/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="bootstrap/js/gritter-conf.js"></script>

	<!--script for this page-->
	<script src="bootstrap/js/sparkline-chart.js"></script>
	<script src="bootstrap/js/zabuto_calendar.js"></script>

	<script type="application/javascript">
		
		
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    
	
	</script>


</body>
</html>