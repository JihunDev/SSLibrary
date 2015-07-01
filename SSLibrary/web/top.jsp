<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<div id="top">
<%if(user == null){  %>
   <fieldset>
         <form class="form-inline" role="form" action="loginimpl.do" method="POST" enctype="multipart/form-data">
         <table>
         <tr><td width="180px">
         <div class="form-group">
         <label class="sr-only" for="id">ID :</label>
            <input type="text" class="form-control input-sm"  name="id" id="id" placeholder="Enter ID">         
             </div></td><td width="180px">
          <div class="form-group">
         <label class="sr-only" for="pwd">PASSWORD :</label>
            <input type="password" class="form-control input-sm" name="pwd" id="pwd" placeholder="Enter password">
             </div>
             </td><td width="60px">
    <input type="submit" value ="login" class="btn btn-primary btn-sm""></td>
       <td width="60px"><a class="btn btn-primary btn-sm" href="register.do" role="button">register</a></td></tr>
          </table>
         </form>
   </fieldset>   
   
<%}else{ %>
   <fieldset>
         <table>
            <tbody>
               <tr>
                  <td width="70px"><a href="msglogcheck.do"><b>message</b><span class="badge">${msgcheck}</span></a><br></td>
                  <td width="70px">  <img src="img/user/${user.img}" class="img-circle" alt="Cinque Terre" width="45" height="45"></td>
                  <td width="140px"><a href="detail.do?id='${user.id}'"><b>${user.id}´Ô È¯¿µÇÕ´Ï´Ù.</b></a></td>
                  <td width="80px"><a class="btn btn-primary btn-sm" href="logout.do" role="button"><b>·Î±×¾Æ¿ô</b></a></td>
               </tr>
            </tbody>
         </table>
      </fieldset>
<%} %>

</div>
<div id="logo">
<h1 id="mainname"><a href="main.do"><img width="70%"src="img/css/mainname.gif"></a></h1>
</div>