<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%User user = (User)session.getAttribute("user");%> 
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


function getBook() {
   var search = $('#search').val();  
   var category = $('#category').val();
   var issearch = $('#issearch').val();
   
   $.ajax({
      dataType : 'JSON',
      async:'false',
      data:{
         'issearch' : issearch,
         'category' : category,
         'search': search},            
      url : 'booksearch.do',
      success:function(data){
         displaybook(data);
         makeHeight();
      }
   });
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
 <select id="issearch" class="form-control input-sm"><option value="">선택</option><option value="name">책이름</option><option value="writer">저자</option></select>
 <select id="category" class="form-control input-sm"><option value="">선택</option><option value="i">IT</option><option value="n">소설</option><option value="m">만화책</option></select>
    <div class="input-group">
     <input type="text" id="search" class="form-control input-sm" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default btn-sm" type="button" onclick="getBook();" >검색</button>
      </span>
    </div><!-- /input-group -->

   <%if(user!=null && user.getIsadmin().equals("y")){ %>
   <div class="btn-group">
   <a class="btn btn-default btn-sm" href="bookregister.do" role="button">등록</a>
   <a class="btn btn-default btn-sm" href="userbookremoveconfirm.do" role="button">회원 도서 반납 내역</a>
   </div>
   <%} %>
   <fieldset>
   <legend align="center">Book list</legend>
   <div id="book_result">
      <table width="700" class="table table-hover">
      <thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th>
      <th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>
      <tbody>
      <c:forEach items="${booklist}" var="b"> <!-- 추후수정 -->
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
      </c:forEach>
      </tbody>
      </table>
   </div>
   </fieldset>
     </form>
</div>
</div>