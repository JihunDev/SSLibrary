<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function register(f){
   var id = f.id.value;
   var name = f.name.value;
    var writer = f.writer.value;
    var img = f.img.value;
    var total_qt = f.total_qt.value;
    var floor = f.floor.value;
   if(id==""){
      alert('책 종류를 선택해주세요');
      return;
   };
   if(name == null || name == ''){
      alert('NAME를 입력하세요');
      f.name.focus();
      return;
   };
   if(writer == null || writer == ''){
      alert('WRITER를 입력하세요');
      f.writer.focus();
      return;
   };
   if(img == null || img == ''){
      alert('IMG를 넣어주세요');
      return;
   };
   if(floor == '선택'){
      alert('층수를 선택해주세요');
      return;
   };
    if(total_qt== null || total_qt == ''){
      alert('수량을 입력하세요');
      f.total_qt.focus();
      return;
   };
   
   var c = confirm('등록하시겠습니까?');
   if(c==true){
      f.action='bookregisterimpl.do';
      f.method = 'POST';
      f.submit();
   } 
};
</script>
<div class="givemargin">
<div class="centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Book Register</h3>
                    </div>
                        <div class="panel-body">
                     <form role="form" enctype="multipart/form-data">
                     <div class="col-md-12">
                            <div class="form-group">
                            <label class="control-label" for="id">CATEGORY</label>
                            <select class="form-control " name="id"><option value="">선택</option><option value="i">IT</option><option value="n">소설</option><option value="m">만화책</option></select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="name" id="name" class="form-control" placeholder="NAME">
                            </div>
                            <div class="form-group">
                                <input type="text" name="writer" id="writer" class="form-control" placeholder="WRITER">
                            </div> 
                            <div class="form-group">
                             <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                            </div>
                            <div class="form-group">
                           <label class="control-label" for="floor">FLOOR</label><select class="form-control" name="floor"><option>선택</option><option>1층</option><option>2층</option><option>3층</option><option>4층</option></select>
                            </div>
                             <div class="form-group">
                                <input type="text" name="total_qt" class="form-control" placeholder="TOTAL_QT">
                            </div>
                            <input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form);">
                           </div>
                           </form>
                          </div>
                            </div>
                </div>
            </div>       
            </div>         