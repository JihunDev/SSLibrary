<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div data-role="content">
	<ul data-role="listview">
		<c:forEach items="${messagelog}" var="m">
			<li>
				<a href="m_msgdetail.do?id=${m.id}">						
					<h3>${m.text}</h3>
					<p>${m.sender_id} | ${m.send_date}</p>
					<p class="ui-li-aside">
						<c:if test="${m.read == 'y'}">
							<strong>ok</strong>
						</c:if>
						<c:if test="${m.read == 'n'}">
							<strong>no</strong>
						</c:if>
					</p>						
				</a>
			</li>
		</c:forEach>
	</ul>
</div>
