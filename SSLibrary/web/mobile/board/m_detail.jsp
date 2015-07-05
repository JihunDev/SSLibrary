<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function del(f) {/* delete가 예약어라 del씀 */
	var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'm_boardremoveimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}	
</script>

<style>
tbody td {
	border-bottom: 1px solid #d6d6d6;
}

tbody th {
	border-bottom: 1px solid #d6d6d6;
}

tr:nth-child(even) {
	background: #e9e9e9;
}
</style>

<table>
	<tbody>
		<tr>
			<th>제목</th>
			<td colspan="5">${boarddetail.title}</td>
		<tr>
			<th>분류</th>
			<td>${boarddetail.sort}</td>
			<th>글쓴이</th>
			<td>${boarddetail.u_id}</td>
			<th>조회</th>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="5">${boarddetail.reg_date}</td>
		</tr>
		<tr>
			<th colspan="6">내용</th>
		</tr>
		<tr>
			<td colspan="6">${boarddetail.content}</td>
		</tr>
	</tbody>
</table>
<form>
	<input type="text" name="sort" value="${boarddetail.sort}"> 
	<input type="text" name="id" value="${boarddetail.id}"> 
	<input type="text" name="reg_number" value="${boarddetail.reg_number}">
	<div class="ui-grid-b">
		<div class="ui-block-a">
			<input type="button" onClick="del(this.form);" value="수정">
		</div>
		<div class="ui-block-b">
			<input type="button" onClick="update(this.form);" value="삭제">
		</div>
		<div class="ui-block-c">
			<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">목록</a>
		</div>
	</div>
</form>
