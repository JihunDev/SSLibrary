<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	
	if(pwd == null || pwd == ''){
		alert("PWD를 입력하세요.");
	}else if(pwd != pwdcheck){
		alert("비밀번호가 같지 않습니다.");
	}else if((pwd.length < 8 || pwd.length > 16) || (pwdcheck.length < 8 || pwdcheck.length > 16)){
		alert("비밀번호는 8자리 이상 16자리 이하로 사용하시기 바랍니다.");	
	}else{
		var c = confirm('수정 하시겠습니까?');
		if (c == true) {
			f.action = 'usermodifyimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}			
}
</script>
<div class="givemargin">
<div class="row centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title text-center">회원수정</h3>
        </div>
            <div class="panel-body">
         <form class="form-horiziontal" role="form" enctype="multipart/form-data">
        <div class="col-md-12">
				<input type="hidden" name="oldimg" value="${userupdate.img}"><!-- 원래 등록이미지 -->
				<input type="hidden" name="id" value="${userupdate.id}">
                <div class="form-group">
			         	<c:choose>
					<c:when test="${userupdate.isadmin=='y'}"> 
						<select class="form-control" name="isadmin">
							<option value="y" selected>관리자</option>
							<option value="n">회원</option>
							<option value="s">정지 회원</option>
						</select>
					</c:when>
					<c:when test="${userupdate.isadmin=='n'}"> 
						<select class="form-control" name="isadmin">
							<option value="y">관리자</option>
							<option value="n" selected>회원</option>
							<option value="s">정지 회원</option>
						</select>
					</c:when>
					<c:when test="${userupdate.isadmin=='s'}"> 
						<select class="form-control" name="isadmin">
							<option value="y">관리자</option>
							<option value="n">회원</option>
							<option value="s" selected>정지 회원</option>
						</select>
					</c:when>
					<c:when test="${userupdate.isadmin=='d'}"> 
   					<select class="form-control" name="isadmin">
					      <option value="y">관리자</option>
					      <option value="n">회원</option>
					      <option value="s">정지 회원</option>
					      <option value="d" selected>탈퇴 회원</option>
				   </select>
					</c:when>
				</c:choose>  
				</div>
				<div class="form-group">
                <input type="text" name="id" id="id" class="form-control" placeholder="ID"  value="${userupdate.id}" disabled="disabled">
                </div>
                <div class="form-group">
                <input type="text" name="pwd" id="pwd" class="form-control" placeholder="PWD" value="${userupdate.pwd}">
                </div>
                <div class="form-group">
                <input type="text" name="pwdcheck" id="pwdcheck" class="form-control" placeholder="PWD CHECK" value="${userupdate.pwd}">
                </div> 
                <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="NAME" value="${userupdate.name}">
                </div>
                <div class="form-group">
                <input type="text" name="phone" class="form-control" placeholder="PHONE"  value="${userupdate.phone}">
                </div>
                 <div class="form-group">
                 <input type="text" name="email" class="form-control" placeholder="EMAIL" value="${userupdate.email}">           
                </div>
                <div class="form-group">
                <label class="control-label" for="oldimg">기존 사진 : <img class="img-circle" alt="Cinque Terre" width="30" height="30" src="img/user/${userupdate.img}"></label>
                </div>
                <div class="form-group">
                 <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                </div>
                <div class="btn-group btn-group-justified">
				  <div class="btn-group">
				   <input type="button"  class="btn btn-primary" value="update" onclick="update(this.form);">
				  </div>
				  <div class="btn-group">
				  <input type="button"  class="btn btn-primary" value="delete" onclick="del(this.form);">
				  </div>
				</div>
				</div>
            	</form>
        		</div>
   		  </div>
    </div>
</div>                
</div>