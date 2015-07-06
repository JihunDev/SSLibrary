<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<style type="text/css">
.clock {width:250px; margin:0 auto; padding:5px; color:#fff;  background : #fa9034; border-radius : 10px 10px 10px 10px;}

#Date { font-family: Arial, Helvetica, sans-serif; font-size:18px; text-align:center; }

#clockul { width:240px; margin:0 auto; padding:0px; list-style:none; text-align:center; }
#clockul>li { display:inline; font-size:2.2em; text-align:center; font-family: Arial, Helvetica, sans-serif; }

#point { position:relative; -moz-animation:mymove 1s ease infinite; -webkit-animation:mymove 1s ease infinite; padding-left:10px; padding-right:10px; }

@-webkit-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px #00c6ff;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px #00c6ff; }	
}


@-moz-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px #00c6ff;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px #00c6ff; }	
}

</style>
<script type="text/javascript" src="bootstrap/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
// Create two variable with the names of the months and days in an array
var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

// Create a newDate() object
var newDate = new Date();
// Extract the current date from Date object
newDate.setDate(newDate.getDate());
// Output the day, date, month and year    
$('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

setInterval( function() {
	// Create a newDate() object and extract the seconds of the current time on the visitor's
	var seconds = new Date().getSeconds();
	// Add a leading zero to seconds value
	$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
	},1000);
	
setInterval( function() {
	// Create a newDate() object and extract the minutes of the current time on the visitor's
	var minutes = new Date().getMinutes();
	// Add a leading zero to the minutes value
	$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
    },1000);
	
setInterval( function() {
	// Create a newDate() object and extract the hours of the current time on the visitor's
	var hours = new Date().getHours();
	// Add a leading zero to the hours value
	$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
    }, 1000);
	
}); 
</script>
	
	
	
	
	<div class="container-fluid">
  <!--   <div class="input-group">
     <input type="text" id="search" class="form-control input-sm" placeholder="도서 전체 검색">
      <span class="input-group-btn">
        <button class="btn btn-default btn-sm" type="button" onclick="getBook();" >검색</button>
      </span>
    </div>/input-group -->
	<div>
	<br>
		<div class="well well-sm"><b>날씨</b></div>
		<!-- weather widget start -->
		<div id="m-booked-weather-bl250-17526">
			<a href="//booked.kr/weather/seoul-18406" class="booked-wzs-250-175"
				style="background-color: #fa8b2a;">
				<div class="booked-wzs-250-175-data wrz-18">
					<div class="booked-wzs-250-175-right">
						<div class="booked-wzs-day-deck">
							<div class="booked-wzs-day-val">
								<div class="booked-wzs-day-number">
									<span class="plus">+</span>28
								</div>
								<div class="booked-wzs-day-dergee">
									<div class="booked-wzs-day-dergee-val">&deg;</div>
									<div class="booked-wzs-day-dergee-name">C</div>
								</div>
							</div>
							<div class="booked-wzs-day">
								<div class="booked-wzs-day-d">
									H: <span class="plus">+</span>29&deg;
								</div>
								<div class="booked-wzs-day-n">
									L: <span class="plus">+</span>23&deg;
								</div>
							</div>
						</div>
						<div class="booked-wzs-250-175-city">서울특별시</div>
						<div class="booked-wzs-250-175-date">수요일, 01 7월</div>
						<div class="booked-wzs-left">
							<span class="booked-wzs-bottom-l">7일 예보 보기</span>
						</div>
					</div>
				</div>
				<table cellpadding="0" cellspacing="0" class="booked-wzs-table-250">
					<tr>
						<td>목</td>
						<td>금</td>
						<td>토</td>
						<td>일</td>
						<td>월</td>
						<td>화</td>
					</tr>
					<tr>
						<td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td>
						<td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td>
						<td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td>
						<td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td>
						<td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td>
						<td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td>
					</tr>
					<tr>
						<td class="week-day-val"><span class="plus">+</span>27&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>24&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>27&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>26&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>28&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>28&deg;</td>
					</tr>
					<tr>
						<td class="week-day-val"><span class="plus">+</span>20&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>15&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>12&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>16&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>14&deg;</td>
						<td class="week-day-val"><span class="plus">+</span>15&deg;</td>
					</tr>
				</table>
			</a>
		</div>
		<script type="text/javascript">
			var css_file = document.createElement("link");
			css_file.setAttribute("rel", "stylesheet");
			css_file.setAttribute("type", "text/css");
			css_file.setAttribute("href",
					'//s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1');
			document.getElementsByTagName("head")[0].appendChild(css_file);
			function setWidgetData(data) {
				if (typeof (data) != 'undefined' && data.results.length > 0) {
					for (var i = 0; i < data.results.length; ++i) {
						var objMainBlock = document
								.getElementById('m-booked-weather-bl250-17526');
						if (objMainBlock !== null) {
							var copyBlock = document
									.getElementById('m-bookew-weather-copy-'
											+ data.results[i].widget_type);
							objMainBlock.innerHTML = data.results[i].html_code;
							if (copyBlock !== null)
								objMainBlock.appendChild(copyBlock);
						}
					}
				} else {
					alert('data=undefined||data.results is empty');
				}
			}
		</script>
		<script type="text/javascript" charset="UTF-8"
			src="http://widgets.booked.net/weather/info?action=get_weather_info&ver=4&cityID=18406&type=3&scode=124&ltid=3457&domid=593&cmetric=1&wlangID=24&color=fa8b2a&wwidth=250&header_color=ffffff&text_color=333333&link_color=08488D&border_form=1&footer_color=ffffff&footer_text_color=333333&transparent=0"></script>
		<!-- weather widget end -->
		</div>
		<br>	

      <!-- Responsive calendar - START -->
      <div class="calendar">
          <div class="well well-sm" ><b>달력</b></div>
    	<div class="responsive-calendar">
        <div class="controls">
            <a class="pull-left" data-go="prev"><div class="btn btn-primary">Prev</div></a>
            <h4><span data-head-year></span><span data-head-month></span></h4>
            <a class="pull-right" data-go="next"><div class="btn btn-primary">Next</div></a>
        </div><hr/>
        <div class="day-headers">
          <div class="day header">Mon</div>
          <div class="day header">Tue</div>
          <div class="day header">Wed</div>
          <div class="day header">Thu</div>
          <div class="day header">Fri</div>
          <div class="day header">Sat</div>
          <div class="day header">Sun</div>
        </div>
        <div class="days" data-group="days">
          
        </div>
      </div>
      </div>
<br>
<div class="well well-sm" ><b>시간</b></div>
<div class="clock">
<div id="Date">Monday 6 July 2015</div>

<ul id="clockul">
	<li id="hours">10</li>
    <li id="point">:</li>
    <li id="min">13</li>
    <li id="point">:</li>
    <li id="sec">03</li>
</ul>

</div>
</div>
      <!-- Responsive calendar - END -->
    <script src="bootstrap/js/responsive-calendar.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $(".responsive-calendar").responsiveCalendar({
          time: '2015-07',
          events: {
     			}
        });
      });
    </script>
 