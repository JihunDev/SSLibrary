<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

</script>

<c:if test="${sortname !='notice'}">
	<a href="m_boardwrite.do" class="ui-btn">등록</a>
</c:if>
<div data-role="content">
	<ul data-role="listview" data-filter="true"
		data-filter-placeholder="Search...">
		<c:forEach items="${boardlist}" var="b">
			<li><a href="m_boarddetail.do?id=${b.id}">
					<h3>${b.title}(${b.reply_num})</h3>
					<p>글쓴이 : ${b.u_id}</p>
					<p>작성일 : ${b.reg_date}</p>
					<p class="ui-li-aside">
						<strong>글번호 : ${b.id}</strong>
					</p> <span class="ui-li-count">조회수 : ${b.counter}</span>
			</a></li>
		</c:forEach>
	</ul>
</div>
