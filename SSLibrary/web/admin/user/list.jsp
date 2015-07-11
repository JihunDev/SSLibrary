<%@page import="com.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
	ArrayList<Object> userlist = (ArrayList<Object>) session.getAttribute("userlist");
	String usercount = (String) session.getAttribute("usercount");
	String search = (String) session.getAttribute("search");
%>
<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
<c:set var="list_length" value="${usercount}" />

<%
	int list_length = toInt((String) pageContext.getAttribute("list_length"));
	int pageno = toInt(request.getParameter("pageno"));

   if(pageno<1){//현재 페이지
      pageno = 1;
   }
   int total_record = list_length;      //총 레코드 수
   
   int page_per_record_cnt = 10;  //페이지 당 레코드 수
   int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//                                              [6],[7],[8],[9],[10]                                 

   int record_end_no = pageno*page_per_record_cnt;            
   int record_start_no = record_end_no-(page_per_record_cnt-1);
   if(record_end_no>total_record){
      record_end_no = total_record;
   }
                                 
                                 
   int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
   if(pageno>total_page){
      pageno = total_page;
   }

   

//    현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
   int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
//      현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)   
//   ex)    14      =   13(몫)      =    (66 / 5)      1   (1(나머지) =66 % 5)           
   
   int page_eno = group_no*group_per_page_cnt;      
//      현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
//   ex)    70      =   14   *   5
   int page_sno = page_eno-(group_per_page_cnt-1);   
//       현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
//   ex)    66   =   70 -    4 (5 -1)
   
   if(page_eno>total_page){
//      현재 그룹 끝 번호가 전체페이지 수 보다 클 경우      
      page_eno=total_page;
//      현재 그룹 끝 번호와 = 전체페이지 수를 같게
   }
   
   int prev_pageno = page_sno - group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
//      이전 페이지 번호   = 현재 그룹 시작 번호 - 페이지당 보여줄 번호수   
//   ex)      46      =   51 - 5            
   int next_pageno = page_sno +group_per_page_cnt;   // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
//      다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
//   ex)      56      =   51 - 5
   if(prev_pageno<1){
//      이전 페이지 번호가 1보다 작을 경우      
      prev_pageno=1;
//      이전 페이지를 1로
   }
   if(next_pageno>total_page){
//      다음 페이지보다 전체페이지 수보가 클경우      
      next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
//      next_pageno=total_page
//      다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
//   ex)            =    76 / 5 * 5 + 1   ????????       
   }
   
   // [1][2][3].[10]
   // [11][12]
%>
<script>
$(document).ready(function(){
	  	if(<%=page_eno%>==0){
			alert("검색결과가 없습니다.");
		}   
	});
	
function searchByName(f){
	 f.action="usersearchname.do";
	 f.method="POST";
	 f.submit();
	
};
</script>
<div class="fieldsetform">
<form class="form-inline">
	<select class="form-control input-sm" name="isadmin">
		<option value="">전체</option>
		<option value="n">회원</option>
		<option value="s">정지</option>
		<option value="d">탈퇴</option>
	</select>
	 <div class="input-group">
	<input type="text" id="name" name="name" class="form-control input-sm" placeholder="Search for...">
     <span class="input-group-btn">
     <button class="btn btn-default btn-sm" type="button" onclick="searchByName(this.form)">검색</button></span></div>
	<!-- <input type="text" name="name" >
	<input type="submit" value="검색"> -->
</form>
	<legend align="center">User list (${user.id})</legend>
	<div>
	
	</div>
	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th class="hidden-xs">TEL</th>
					<th class="hidden-xs">E-MAIL</th>
					<th>회원상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist}" var="u" varStatus="user_status">
				<c:set var="foreach_count" value="${user_status.count}" />
			<%
				int count = (int) pageContext.getAttribute("foreach_count");
				if(count >= record_start_no &&  count <= record_end_no){
			%>
					<tr>
						<td><a href="userdetail.do?id=${u.id}">${u.id}</a></td>
						<td>${u.name}</td>
						<td class="hidden-xs">${u.phone}</td>
						<td class="hidden-xs">${u.email}</td>
						<td>${u.isadmin}</td>
					</tr>
			<%}%>
				</c:forEach>
			</tbody>
		</table>
		<a href="usersearch.do?${search}pageno=1">[맨앞으로]</a>
<a href="usersearch.do?${search}pageno=<%=prev_pageno%>">[이전]</a>
<%
if(page_eno == 0){
	%><b><a href="usersearch.do?${search}pageno=1">[1]</a></b><%
}else{
	for(int i =page_sno;i<=page_eno;i++){
%>
<a href="usersearch.do?${search}pageno=<%=i%>"> <%
 	if(pageno == i){
 %>
	<b>[<%=i%>]
</b> <%
 	}else{
 %> <%=i%> <%
 	}
 %>
</a>
<%--   콤마    --%>
<%
	if(i<page_eno){
%>
,
<%
	}
%>
<%
	}}
%>

<a href="usersearch.do?${search}pageno=<%=next_pageno%>">[다음]</a>
<a href="usersearch.do?${search}pageno=<%=total_page%>">[맨뒤로]</a>
	</div></div>