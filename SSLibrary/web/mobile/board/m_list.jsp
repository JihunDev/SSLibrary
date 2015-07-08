<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sortname !='notice'}">
	<a href="m_boardwrite.do" class="ui-btn">등록</a>
</c:if>
<div>
	<ul id="list" data-role="listview" data-filter="true"
		data-filter-placeholder="Search..." data-inset="true">
		<c:forEach items="${boardlist}" var="b">
			<li><a href="m_boarddetail.do?id=${b.id}">
					<c:if test="${b.reply_num == 0}">
					<h3>${b.title}</h3>
					</c:if>
					<c:if test="${b.reply_num != 0}">
					<h3>${b.title} (${b.reply_num})</h3>
					</c:if>
					<p>글쓴이 : ${b.u_id}</p>
					<p>작성일 : ${b.reg_date}</p>
					<p class="ui-li-aside">
						<strong>글번호 : ${b.id}</strong>
					</p> <span class="ui-li-count">조회수 : ${b.counter}</span>
			</a></li>
		</c:forEach>
	</ul>
</div>
<br>
<button onclick="re();">더보기</button>
