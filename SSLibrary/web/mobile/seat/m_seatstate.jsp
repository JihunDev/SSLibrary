<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="seattable">
	<c:forEach items="${seatlist}" var="s" varStatus="i">
		<c:choose>

			<c:when test="${user.isadmin == 'n' }">
				<c:choose>
					<c:when test="${myseat == null}">
						<c:choose>
							<c:when test="${s.state == 'y'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										name="s_id" onclick="register(this.form);" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'n'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										name="s_id" onclick="registeredSeat();" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'f'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										name="s_id" onclick="repairState();" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
						</c:choose>
					</c:when>

					<c:otherwise>
						<c:choose>
							<c:when test="${s.state == 'y'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										value="${s.id}" data-toggle="button" aria-pressed="false"
										autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'n'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										value="${s.id}" name="s_id" onclick="sendMsg(this.form);"
										value="${s.id}" data-toggle="button" aria-pressed="false"
										autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'f'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										value="${s.id}" onclick="repairState();" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:when>

			<c:when test="${user == null || user.isadmin == 's'}">
				<form>
					<input type="hidden" name="s_state" value="${s.state}">
					<button type="button" class="btn btn-primary ${s.state}_btn">${s.id}</button>
				</form>
			</c:when>

		</c:choose>
	</c:forEach>
</div>
<div id=managerSeat></div>
