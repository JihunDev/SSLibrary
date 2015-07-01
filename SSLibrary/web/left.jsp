<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	
</script>
<style></style>
</head>
<body>
	<div class="container-fluid">
		<h4>날씨</h4>
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
</body>
</html>