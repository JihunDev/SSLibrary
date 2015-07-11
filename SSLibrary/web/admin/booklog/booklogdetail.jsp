<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function makeHeight() {
		var section = document.querySelector("#main-conten");
		var center = document.querySelector("#center");
		var center_area = document.querySelector('#home_center');

		var mHeight = center_area.clientHeight + 80;
		/* ClientHeight를 써서 표 높이만큼 늘리게 함. */
		if (mHeight < 850) {
			mHeight = 850;
		}
		center.style.height = mHeight + 'px';
		section.style.height = mHeight + 'px';
	};

	function displaybook(data) {
		var cont = Object.keys(data).length;
		var element = document.getElementById("lastbooklist");

		$('#book_result').empty();
		var output = '';
		output += '<fieldset><legend align="center">검색 결과</legend><table id="lastbooklist" class="table table-hover">'
		output += '<thead><tr><th >ID</th><th >B_ID</th><th>U_ID</th><th>START_DATE</th><th class="hidden-xs">END_DATE</th><th>REAL_DATE</th><th class="hidden-xs">RENEW_QT</th></thead>';
		output += '<tbody id="bookloglist">';
		if (cont == 0) {
			output += '<tr><td colspan=7>검색 결과가 존재하지 않습니다.</td><tr>';
		} else {
			$(data).each(function(index, item) {

				with (item) {
					output += '<tr><td>' + id + '</td>';
					output += '<td>' + b_id + '</td>';
					output += '<td>' + u_id + '</td>';
					output += '<td>' + start_date + '</td>';
					output += '<td class="hidden-xs">' + end_date + '</td>';
					output += '<td>' + real_date + '</td>';
					output += '<td class="hidden-xs">' + renew_qt + '</td></tr>';

				}
			});
		}
		output += "</table></fieldset>"
		$('#book_result').html(output);
		var element2 = $("#bookloglist");
		if (element2.height() >= 500) {
			$('#lastbooklist').addClass("scroll");
		}

	}

	function getLogBook() {
		var whatsearch = $('#whatsearch').val();
		var searchname = $('#searchname').val();
		$.ajax({
			dataType : 'JSON',
			async : 'false', /* 화면에 전송한다음에 내려오기 전에 뿌릴 것이면 false  */
			data : {
				'whatsearch' : whatsearch,
				'name' : searchname
			}, /* 전송하기 전에 뿌릴 것이면 true*/
			url : 'adminbooklogsearch.do',
			success : function(data) {
				displaybook(data);
			}
		});
	};
</script>
<div id="home_center" class="fieldsetform">
	<form class="form-inline">
		<select class="form-control input-sm" id="whatsearch">
			<option value="user">회원</option>
			<option value="book">도서</option>
		</select>
		<div class="input-group">
			<input type="text" id="searchname" name="searchname"
				class="form-control input-sm" placeholder="Search for..."> <span
				class="input-group-btn">
				<button class="btn btn-default btn-sm" type="button"
					onclick="getLogBook();">검색</button>
			</span>
		</div>
		<div style="float: right;">
			<button class="btn btn-default btn-sm" style="float: right;"
				type="submit" onclick='location.href="adminbookloglist.do"'>목록</button>
		</div>
	</form>
	<div id="book_result">
		<fieldset>
			<legend align="center">도서 과거 대여 내역</legend>
			<table width="700" class="table table-hover scroll">
				<thead>
					<tr>
						<th>ID</th>
						<th>B_ID</th>
						<th>U_ID</th>
						<th>START_DATE</th>
						<th class="hidden-xs">END_DATE</th>
						<th>REAL_DATE</th>
						<th class="hidden-xs">RENEW_QT</th>
				</thead>
				<tbody>
					<c:forEach items="${loglist}" var="b">
						<!-- 추후수정 -->
						<tr>
							<td>${b.id}</td>
							<td>${b.b_id}</td>
							<td>${b.u_id}</td>
							<td>${b.start_date}</td>
							<td class="hidden-xs">${b.end_date}</td>
							<td>${b.real_date}</td>
							<td class="hidden-xs">${b.renew_qt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</div>
</div>
