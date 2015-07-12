<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
<c:set var="list_length" value="${boardlist_length}" />

<%
	int list_length = toInt((String) pageContext.getAttribute("list_length"));
	String sort = request.getParameter("sort");
	
	String sort_name = sort.substring(0,1).toUpperCase() + sort.substring(1);
	String search = request.getParameter("search");
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

<style>
a {
	text-decoration: none;
}
</style>
<script>
function getBoard(f){
 	 f.action="boardsearch.do";
	 f.method="post";
	 f.submit();
}
window.onload = function(){
	  	if(<%=page_eno%>==0){
			$('#boardlist_div').html("<tr><td colspan=5>등록된 게시물이 없습니다.</td><tr>");
		}   

		//makeHeight();
}
</script>
<div class="fieldsetform">
<div class="listtabletitle">	
	<table class="table" style="width:100%;">
		<tr>
			<th><h1><%=sort_name%> Board</h1></th>
		</tr>
	</table>	
</div>

<div style="float:right;">
<form class="form-inline">
	<div class="input-group">
	<input type="hidden" name="sort" value="<%=sort%>">

	<button class="btn btn-default btn-sm btncolor" style="width:auto;float:right;margin:0 2px;"  type="button" onclick="getBoard(this.form);">검색</button>
	<input type="text" style="width:auto;float:right;margin:0 2px;"  id="search" name="search" class="form-control input-sm" placeholder="Search for...">
	<select id="issearch" style="width:auto;float:right;margin:0 2px;"  name="issearch" class="form-control input-sm">
		<option value="ct">제목+내용</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="id">ID</option>
	</select>
	<c:set var="loginuser_isadmin" value="${user.isadmin}" />
		<%
	   String loginuser_isadmin = (String) pageContext.getAttribute("loginuser_isadmin");
	   if(sort.equals("notice") && loginuser_isadmin != null){
	      if(loginuser_isadmin.equals("y")){
	         %><a class="btn btn-default btn-sm btncolor" href="boardwrite.do?sort=<%=sort%>">글쓰기</a><%
	      }
	   }else if(loginuser_isadmin != null){
	      if(loginuser_isadmin.equals("y") || loginuser_isadmin.equals("n")){
	         %><a class="btn btn-default btn-sm btncolor" href="boardwrite.do?sort=<%=sort%>">글쓰기</a><%   
	      }
	   }
	%>
	</div>
	<!-- /input-group -->
</form>
</div>
<br>
<br>
	<fieldset>
<table class="table table-striped theadcolor">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th class="hidden-xs">작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody id="boardlist_div">
		<c:forEach items="${boardlist}" var="b" varStatus="board_status">
			<c:set var="foreach_count" value="${board_status.count}" />
			<%
				int count = (int) pageContext.getAttribute("foreach_count");
				if(count >= record_start_no &&  count <= record_end_no){
			%>
			<tr>
				<td>${b.id}</td>
				<td><a href="boarddetail.do?id=${b.id}">${b.title}(${b.reply_num})</a></td>
				<td>${b.u_id}</td>
				<td class="hidden-xs">${b.reg_date}</td>
				<td>${b.counter}</td>
			</tr>
			<%}%>
		</c:forEach>
	</tbody>
	<!-- test후 페이지 넘어가는 거 만듬 -->
</table>

<hr>
<div class="listpagingnum">
<a class="btn btn-default btn-sm btncolor" href="boardmain.do?${search}sort=<%=sort%>&pageno=1"><span class="glyphicon glyphicon-backward"></span></a>
<a class="btn btn-default btn-sm btncolor" href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=prev_pageno%>"><span class="glyphicon glyphicon-triangle-left"></span></a>
<%if(page_eno == 0){
	%><b><a href="boardmain.do?${search}sort=<%=sort%>&pageno=1">[1]</a></b><%
}else{
	for(int i =page_sno;i<=page_eno;i++){
%>
<a href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=i%>"> <%
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

<a class="btn btn-default btn-sm btncolor" href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=next_pageno%>"><span class="glyphicon glyphicon-triangle-right"></span></a>
<a class="btn btn-default btn-sm btncolor" href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=total_page%>"><span class="glyphicon glyphicon-forward"></span></a>
</div>

</fieldset>
</div>
