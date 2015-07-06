<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
tbody td {
	border-bottom: 1px solid #d6d6d6;
}

tbody th {
	border-bottom: 1px solid #d6d6d6;
}
</style>

<script>
function del(f) {
	var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'm_boardremoveimpl.do';
			f.method = 'POST';
			f.submit();
		};
	}

function register(f) {
	var c = confirm('댓글을 등록 하시겠습니까?');
	if (c == true) {
		f.action = 'm_boardwriteimpl.do';
		f.method = 'POST';
		f.submit();
	}
	;
}

function update(f) {
	var reg_number = f.reg_number.value;
	var id = f.id.value;
	if(reg_number != 0){
		var c = confirm('댓글을 수정 하시겠습니까?');
		if (c == true) {
			f.action = 'm_boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
		};
	} else {
		var c = confirm('수정 하시겠습니까?');
		if (c == true) {
			f.action = 'm_boardmodify.do';
			f.method = 'POST';
			f.submit();
		};
	}
}
</script>

<!-- 게시글 -->
<table width="100%">
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

<!-- 게시글 수정 -->
<form>
	<input type="hidden" name="sort" value="${boarddetail.sort}"> 
	<input type="hidden" name="id" value="${boarddetail.id}"> 
	<input type="hidden" name="reg_number" value="${boarddetail.reg_number}">
	<c:if test="${boarddetail.u_id == user.id}">
		<div class="ui-grid-b">
			<div class="ui-block-a">
				<input type="submit" onClick="update(this.form);" value="수정">
			</div>
			<div class="ui-block-b">
				<input type="submit" onClick="del(this.form);" value="삭제">
			</div>
			<div class="ui-block-c">
				<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">목록</a>
			</div>
		</div>
	</c:if>
	<c:if test="${boarddetail.u_id != user.id}">
		<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">목록</a>
	</c:if>
</form>

<!-- reply 창 -->	
<form>
	<input type="hidden" name="reg_number" id="reg_number" value="${boarddetail.id}">
	<input type="hidden" name="sort" value="${boarddetail.sort}">
	<input type="hidden" name="u_id" value="${user.id}">
	<label for="content">Comment:</label>
	<textarea rows="5" cols="40" name="content"></textarea>
	<input type="button" value="등록" onclick="register(this.form)">
</form>	

<!-- reply 목록 -->
<br>
<ul data-role="listview" >
	<c:forEach items="${boardreply}" var="reply">
		<li>
			<h3>${reply.content}</h3>
			<p>${reply.u_id} | ${reply.reg_date}</p>
			<p class="ui-li-aside">
				<strong>등록번호 : ${reply.id}</strong>
			</p>
			
			<c:if test="${reply.u_id == user.id}">
				<form>
					<div data-role="collapsible">
        				<h1>수정삭제</h1>
        				<textarea rows="5" cols="40" name="content">${reply.content}</textarea>
    	  		  		<input type="hidden" name="sort" value="${reply.sort}">
						<input type="hidden" name="id" value="${reply.id}">	
						<input type="hidden" name="reg_number" value="${reply.reg_number}">	
						<input type="hidden" name="old_content" value="${reply.content}">	
						<input type="hidden" name="u_id" value="${user.id}">
						<input type="hidden" name="content" >	
    	  		  	   	<div class="ui-grid-a">
							<div class="ui-block-a">
    	  		  	   			<input type="button" id="btn_${reply.id}" value="수정" onclick="update(this.form)">
		 	     			</div>
				    		<div class="ui-block-b">
	      						<input type="button" value="삭제" onclick="del(this.form)">
      						</div>
				    	</div>
     				</div>
     			</form>
			</c:if>
			</li>
	</c:forEach>
</ul>
