<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%> 
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
              <div><a href="detail.do?id='${user.id}'"><b>${user.id}님 환영합니다.</b></a></div>
              <a class="btn btn-primary btn-sm" href="logout.do" role="button"><b>로그아웃</b></a>
      </fieldset>
</div>
<%} %>
<div id="logo">
<h1 id="mainname"><a href="main.do"><img width="70%" src="img/css/mainname.gif"></a></h1>
</div>