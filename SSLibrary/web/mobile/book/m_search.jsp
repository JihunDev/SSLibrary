<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function displaybook(data) {
		$('#book_result').empty();
		var output = '';
		output += '<table class="table table-hover">'
		output += '<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th><th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>';
		$(data)
				.each(
						function(index, item) {
							with (item) {
								output += '<tr><td><a href="bookdetail.do?id='
										+ bid + '">' + bid + '</a></td>';
								output += '<td>' + name + '</td>';
								output += '<td>' + writer + '</td>';
								output += '<td><img width="50px" src="img/book/'+img+'"></td>';
								output += '<td>' + floor + '</td>';
								output += '<td>' + total_qt + '</td>';
								output += '<td>' + current_qt + '</td>';
								output += '<td>' + reg_date + '</td></tr>';
							}
						});
		output += "</table>"
		$('#book_result').html(output);
	}

	function getBook() {
		var search = $('#search').val();
		var category = $('#category').val();
		var issearch = $('#issearch').val();

		$.ajax({
			dataType : 'JSON',
			async : 'false',
			data : {
				'issearch' : issearch,
				'category' : category,
				'search' : search
			},
			url : 'm_booksearch.do',
			success : function(data) {
				displaybook(data);
				makeHeight();
			}
		});
	};
</script>

<!-- 책 검색 -->
<form class="form-inline">
	<div class="ui-grid-a">
		<div class="ui-block-a">
			<select id="issearch">
				<option value="">선택</option>
				<option value="name">책이름</option>
				<option value="writer">저자</option>
			</select>
		</div>
		<div class="ui-block-b">
			<select id="category">
				<option value="">선택</option>
				<option value="i">IT</option>
				<option value="n">소설</option>
				<option value="m">만화책</option>
			</select>
		</div>
	</div>
	<input type="text" id="search" placeholder="Search for...">
	<button type="button" onclick="getBook();">검색</button>
</form>

<!-- 책 출력부  -->
<div id="book_result">
	<table data-role="table" data-mode="columntoggle" class="ui-responsive" id="myTable">
		<thead>
			<tr>
				<th data-priority="7">ID</th>
				<th data-priority="7">NAME</th>
				<th data-priority="7">WRITER</th>
				<th data-priority="1">IMG</th>
				<th data-priority="2">FLOOR</th>
				<th data-priority="4">TOTAL_QT</th>
				<th data-priority="4">CURRENT_QT</th>
				<th data-priority="3">REGDATE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${booklist}" var="b">
				<tr>
					<td><a href="m_bookdetail.do?id=${b.id}">${b.id}</a></td>
					<td>${b.name}</td>
					<td>${b.writer}</td>
					<td><img width="30px" src="img/book/${b.img}"></td>
					<td>${b.floor}</td>
					<td>${b.total_qt}</td>
					<td>${b.current_qt}</td>
					<td>${b.reg_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


