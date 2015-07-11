<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%> 

          <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="메뉴"></div>
              </div>
            <!--logo start-->
            <a href="main.do" class="logo"><b>SangSang Library</b></a>
            <!--logo end-->
       
            <div class="top-menu">
<%if(user == null){  %>
<script>
function logincheck(f){
	var id = f.id.value;
	var pwd = f.pwd.value;
	$.ajax({
		type:'post',
		data:{
			'id': id,
			'pwd': pwd
		},
		async : 'false',
		url : 'loginimpl.do',
		success : function(data){
			if(data == "loginok")
				location.href = "main.do";
			else
				alert("ID와 비밀번호가 맞지 않습니다.");
		},
		error : function(){
			alert("login ajax fail");
		}	
		
	});
}

</script>

 <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="glyphicon glyphicon-user"></span>
              </button>
            </div>
<div class="collapse navbar-collapse" id="myNavbar" >
<div id="navbar" class="navbar-collapse collapse in">
<ul class="nav navbar-nav navbar-right">
                <li>
         <form class="form-inline" role="form">
         <div class="form-group">
         <label class="sr-only" for="id">ID :</label>
            <input type="text" class="form-control input-sm"  name="id" id="id" placeholder="Enter ID">         
             </div>
          <div class="form-group">
         <label class="sr-only" for="pwd">PASSWORD :</label>
            <input type="password" class="form-control input-sm" name="pwd" id="pwd" placeholder="Enter password">
             </div>
    <input type="button" value ="login" class="login" onclick="logincheck(this.form)">
      <a class="login" href="register.do">register</a>
         </form>
</ul>
</div>
</div>

<%}else{ %>
     <div class="nav notify-row" id="top_menu">
               
               
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-envelope-o"></i>
                            <span id="msgnumber" class="badge bg-theme">${msgcheck}</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <li>
                                <p class="green">You have new messages</p>
                            </li>
                            <c:forEach items="${msg_list}" var="m">
                            <li>
                                <a href="msgdetail.do?id=${m.id}">
                                    <!-- <span class="photo"><img alt="avatar" src="img/user/ui-zac.jpg"></span> -->
                                    <span class="subject">
                                    <span class="from">${m.sender_id}</span>
                                    <span class="time">${m.send_date}</span>
                                    </span>
                                    <span class="message">
                                        ${m.text}
                                    </span>
                                </a>
                            </li>
                            </c:forEach>
                       <!--      <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Divya Manian</span>
                                    <span class="time">40 mins.</span>
                                    </span>
                                    <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Dan Rogers</span>
                                    <span class="time">2 hrs.</span>
                                    </span>
                                    <span class="message">
                                        Love your new Dashboard.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Dj Sherman</span>
                                    <span class="time">4 hrs.</span>
                                    </span>
                                    <span class="message">
                                        Please, answer asap.
                                    </span>
                                </a>
                            </li>-->
                            <li> 
                                <a href="msgloglist.do?id=${id}">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>

            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout.do">Logout</a></li>
            	</ul>
            </div>

<%} %>
           
            
<%-- 


<%if(user == null){  %>
<script>
function logincheck(f){
	var id = f.id.value;
	var pwd = f.pwd.value;
	$.ajax({
		type:'post',
		data:{
			'id': id,
			'pwd': pwd
		},
		async : 'false',
		url : 'loginimpl.do',
		success : function(data){
			if(data == "loginok")
				location.href = "main.do";
			else
				alert("ID와 비밀번호가 맞지 않습니다.");
		},
		error : function(){
			alert("login ajax fail");
		}	
		
	});
}
</script>

<div id="top">
   <fieldset>
         <form class="form-inline" role="form">
         <div class="form-group">
         <label class="sr-only" for="id">ID :</label>
            <input type="text" class="form-control input-sm"  name="id" id="id" placeholder="Enter ID">         
             </div>
          <div class="form-group">
         <label class="sr-only" for="pwd">PASSWORD :</label>
            <input type="password" class="form-control input-sm" name="pwd" id="pwd" placeholder="Enter password">
             </div>
    <input type="button" value ="login" class="btn btn-primary btn-sm" onclick="logincheck(this.form)">
      <a class="btn btn-primary btn-sm" href="register.do" role="button">register</a>
         </form>
   </fieldset>   
</div>
<%}else{ %>
<div id="afterlogin">
   <fieldset>
            <div><a href="msglogcheck.do"><b>message</b><span class="badge">${msgcheck}</span></a></div>
             <div><img src="img/user/${user.img}" class="img-circle" alt="Cinque Terre" width="40" height="40"></div>
              <div><a href="detail.do?id=${user.id}"><b>${user.id}님 환영합니다.</b></a></div>
              <a class="btn btn-primary btn-sm" href="logout.do" role="button"><b>로그아웃</b></a>
      </fieldset>
</div>
<%} %> --%>