<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%User user = (User)session.getAttribute("user");%> 
 <ul class="sidebar-menu" id="nav-accordion">   
              
 	<%if(user!=null && user.getIsadmin().equals("y")){ %> 
 		 <p class="centered"><a href="detail.do?id=${user.id}"><img src="img/user/${user.img}" class="img-circle" width="150"></a></p>
              	  <h5 class="centered">${user.name}</h5>
              	  
                  <li class="sub-menu">
                   <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>내 정보</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="usinginfo.do?id=${user.id}">현재 이용 정보</a></li>
                          <li><a  href="msgloglist.do?id=${user.id}">메세지 내역</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;">
                          <i class="fa fa-desktop"></i>
                          <span>열람실 관리</span>
                      </a>
                      <ul class="sub">
                          <li><a href="seatmain.do">열람실 좌석 현황</a></li>
                          <li><a href="adminseatloglist.do">좌석 이용 내역</a></li>
                      </ul>
                  </li>

 				<li class="sub-menu">
                   <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>자료실 관리</span>
                      </a>
                      <ul class="sub">
                     	  <li><a href="bookmain.do?search=false">도서 자료</a></li>
                          <li><a href="bookregister.do">신규 도서 등록</a></li>
                          <li><a href="adminbookloglist.do">도서 대여 기록</a></li>
                          <li><a href="userbookremoveconfirm.do">도서 반납 내역</a></li>
                      </ul>
                  </li>



               <!--    <li class="sub-menu">
                       <a  href="bookmain.do?search=false">
                          <i class="fa fa-desktop"></i>
                          <span>자료실관리</span>
                      </a>
                  </li> -->
                  <li class="sub-menu">
                      <a href="usersearch.do?search=false">
                          <i class="fa fa-desktop"></i>
                          <span>회원관리</span>
                      </a>
                  </li>
    <%}else if((user!=null && user.getIsadmin().equals("n")) || (user!=null && user.getIsadmin().equals("s"))){ %>              
               <p class="centered"><a href="detail.do?id=${user.id}"><img src="img/user/${user.img}" class="img-circle" width="150"></a></p>
              	  <h5 class="centered">${user.name}</h5>
              	  
                  <li class="sub-menu">
                   <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>내 정보</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="usinginfo.do?id=${user.id}">현재 이용 정보</a></li>
                          <li><a  href="msgloglist.do?id=${user.id}">메세지 내역</a></li>
                      </ul>
                  </li>
                 <li class="sub-menu">
                      <a href="seatmain.do">
                          <i class="fa fa-dashboard"></i>
                          <span>열람실</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                       <a href="bookmain.do?search=false">
                          <i class="fa fa-dashboard"></i>
                          <span>자료실</span>
                      </a>
                  </li>        
    <%}else{%>
       <li class="sub-menu">
                      <a href="seatmain.do">
                          <i class="fa fa-dashboard"></i>
                          <span>열람실</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                       <a href="bookmain.do?search=false">
                          <i class="fa fa-dashboard"></i>
                          <span>자료실</span>
                      </a>
                  </li>
    <%} %>
                  <li class="sub-menu">
                      <a href="boardmain.do?search=false&sort=notice">
                          <i class="fa fa-dashboard"></i>
                          <span>공지사항</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                     <a href="boardmain.do?search=false&sort=free">
                          <i class="fa fa-dashboard"></i>
                          <span>자유게시판</span>
                      </a>
                  </li>
              </ul>
