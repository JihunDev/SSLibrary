<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	User user = (User)session.getAttribute("user");


	ArrayList<Object> booklist = (ArrayList<Object>) session.getAttribute("booklist");
	String bookcount = (String) session.getAttribute("bookcount");
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
<c:set var="list_length" value="${bookcount}" />

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
function makeHeight() {
   var section = document.querySelector("#section");
   var left = document.querySelector("#left");
   var center = document.querySelector("#center");
   var center_area = document.querySelector('#book_center');
   
   var mHeight = center_area.clientHeight+120;
   /* ClientHeight를 써서 표 높이만큼 늘리게 함. */
   if (mHeight < 700) {
      mHeight = 700;
   }
   center.style.height = mHeight + 'px';
   section.style.height = mHeight + 'px';
   left.style.height = mHeight + 'px';
};

function displaybook(data) {
   $('#book_result').empty();
   var output = '';
   output+='<table class="table table-hover">'
   output+='<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th><th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>';
   var count = 0;
   $(data).each(function(index, item) {
      with (item) {
    		    output += '<tr><td><a href="bookdetail.do?id='+bid+'">'+bid+'</a></td>';
        		output += '<td>'+name+'</td>';
         		output += '<td>'+writer+'</td>';
        		output += '<td><img width="50px" src="img/book/'+img+'"></td>';
       			output += '<td>'+floor+'</td>';
        		output += '<td>'+ total_qt+'</td>';
         		output += '<td>'+current_qt+'</td>';
         		output += '<td>'+reg_date+'</td></tr>';
			}
      });
   output+="</table>"
   $('#book_result').html(output);
   makeHeight();

}


function getBook(f) {
   var search = $('#search').val();  
   var category = $('#category').val();
   var issearch = $('#issearch').val();
   
   f.action = 'booksearch.do';
   f.method = 'POST';
   f.submit();
   
  /*  $.ajax({
      dataType : 'JSON',
      async:'false',
      data:{
         'issearch' : issearch,
         'category' : category,
         'search': search},            
      url : 'booksearch.do',
      success:function(data){
         //displaybook(data);
         makeHeight();
      }
   });*/ 
};
function deletebook(isdelete){
   if(isdelete=="1"){
      alert("누군가 대여 중이어서 삭제할 수 없습니다.");
   }else{
   }
}

$(document).ready(function(){
   makeHeight();
   var isdelete = $('#isdelete').val();
      deletebook(isdelete);
});


/* function display(data){
   $('#book_result').empty(); //remove는 style까지 다 지움
   var output='';
   output +='<table width="700" border="1">';
   output+='<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th><th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>';
   $(data).each(function(index, item){
      output+='<tr>';
      with(item){
         output+='<th>'+id+'</th>';
         output+='<td>'+name+'</td>';
         output+='<td>'+writer+'</td>';
         output+="<td><img width='100px' src='img/book/"+img+"'></td>";
         output+='<td>'+floor+'</td>';
         output+='<td>'+total_qt+'</td>';
         output+='<td>'+current_qt+'</td>';
         output+='<td>'+reg_date+'</td>';
      }
      output+='</tr>';
   });
   output+='</table>';
   $('#book_result').html(output);   
   makeHeight();
   
      
};

function firstBook(){
   $.ajax({
      url : 'booklist.do',
      dataType : 'JSON',
      async : false,
      success : function(data){
         display(data);
         makeHeight();
      }      
   });
};

$(document).ready(function(){
   firstBook();
   makeHeight();
}); */
</script>


<div class="fieldsetform">
<input type="hidden" id="isdelete" value="${isdelete}">
<div id="book_center">
<form class="form-inline">
 <select id="issearch" name="issearch" class="form-control input-sm"><option value="">선택</option><option value="name">책이름</option><option value="writer">저자</option></select>
 <select id="category" name="category" class="form-control input-sm"><option value="">선택</option><option value="i">IT</option><option value="n">소설</option><option value="m">만화책</option></select>
    <div class="input-group">
     <input type="text" id="search" name="search" class="form-control input-sm" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default btn-sm" type="button" onclick="getBook(this.form);" >검색</button>
      </span>
    </div><!-- /input-group -->

   <%if(user!=null && user.getIsadmin().equals("y")){ %>
   <div class="btn-group">
   <a class="btn btn-default btn-sm" href="bookregister.do" role="button">등록</a>
   <a class="btn btn-default btn-sm" href="adminbookloglist.do" role="button">도서 대여 기록</a>
   <a class="btn btn-default btn-sm" href="userbookremoveconfirm.do" role="button">회원 도서 반납 내역</a>
   </div>
   <%} %>
   <fieldset>
   <legend align="center">Book list (count: ${bookcount})</legend>
				<div id="book_result">
					<table width="700" class="table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>NAME</th>
								<th>WRITER</th>
								<th>IMG</th>
								<th>FLOOR</th>
								<th>TOTAL_QT</th>
								<th>CURRENT_QT</th>
								<th>REGDATE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${booklist}" var="b" varStatus="book_status">
								<c:set var="foreach_count" value="${book_status.count}" />
								<%
										int count = (int) pageContext.getAttribute("foreach_count");
										if(count >= record_start_no &&  count <= record_end_no){
								%>
								<tr>
									<td><a href="bookdetail.do?id=${b.id}">${b.id}</a></td>
									<td>${b.name}</td>
									<td>${b.writer}</td>
									<td><img width="30px" src="img/book/${b.img}"></td>
									<td>${b.floor}</td>
									<td>${b.total_qt}</td>
									<td>${b.current_qt}</td>
									<td>${b.reg_date}</td>
								</tr>
								<%}%>
							</c:forEach>
						</tbody>
					</table>
					<hr>
<a href="bookmain.do?${search}pageno=1">[맨앞으로]</a>
<a href="bookmain.do?${search}pageno=<%=prev_pageno%>">[이전]</a>
<%
	for(int i =page_sno;i<=page_eno;i++){
%>
<a href="bookmain.do?${search}pageno=<%=i%>"> <%
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
	}
%>

<a href="bookmain.do?${search}pageno=<%=next_pageno%>">[다음]</a>
<a href="bookmain.do?${search}pageno=<%=total_page%>">[맨뒤로]</a>
				</div>
			</fieldset>
     </form>
</div>
</div>