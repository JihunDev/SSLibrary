<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f){
	var total_qt =  f.total_qt.value; //億照啪 嫡嬴螞 熱薑й 疇 瞪羹 高
	var originaltotal_qt = ${bookinfo.total_qt}; //錳楚 疇 瞪羹 高
	var current_qt =f.current_qt.value; //錳楚 疇 ⑷營 渠罹 陛棟 熱
	
	var result = 0;
	
	if(total_qt>originaltotal_qt){//熱薑高檜 渦 贗 陽
		result = (total_qt-originaltotal_qt) + Number(current_qt);

			$('input[name=current_qt]').val(result);		
		
	}else if(total_qt<originaltotal_qt){//熱薑 高檜 渦 濛擊 陽
		if(current_qt!=0 && (originaltotal_qt-total_qt)<=current_qt){
		result =current_qt-(originaltotal_qt-total_qt);
			$('input[name=current_qt]').val(result);		
		}else if(current_qt!=0 && (originaltotal_qt-total_qt)>current_qt){
			alert('陴擎 疇爾棻 渦 號擎 熱榆擊 還橾 熱 橈蝗棲棻.');
			 f.total_qt.focus();
		      return;
			
		}else{
		
			alert('⑷營 賅萇 疇檜 渠罹 醞檜橫憮 熱榆擊 還橾 熱 橈蝗棲棻.');
			 f.total_qt.focus();
		      return;
		}
	}

	if((total_qt>99999)){
		alert('譆渠 厥擊 熱 氈朝 熱榆擎 99999偃 殮棲棻.');
		 f.total_qt.focus();
	      return;	
	}
	var c = confirm('熱薑ж衛啊蝗棲梱?'); 
	if(c==true){
		f.action='bookmodifyimpl.do';
		f.method = 'POST';
		f.submit();
	} 
};
</script>
<div class="row centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Book Update</h3>
                    </div>
                        <div class="panel-body">
                     <form name="updatebook" role="form" enctype="multipart/form-data">
                     <div class="col-md-12">
                            <div class="form-group">
                            <input type ="hidden" name="id" value="${bookinfo.id}">
							<input type ="hidden" name="oldimg" value="${bookinfo.img}">
							<input type ="hidden" name="current_qt" value="${bookinfo.current_qt}">
                           
                            <label class="control-label" for="id">ID</label>
                            <input type="text" name="id" class="form-control" placeholder="ID" value="${bookinfo.id}" disabled>
                            </div>
                            <div class="form-group">
                             <label class="control-label" for="name">NAME</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="NAME" value="${bookinfo.name}">
                            </div>
                            <div class="form-group">
                            <label class="control-label" for="writer">WRITER</label>
                                <input type="text" name="writer" id="writer" class="form-control" placeholder="WRITER" value="${bookinfo.writer}">
                            </div> 
                            <div class="form-group">
                             <label class="control-label" for="oldimg">錳楚餌霞 : <img height="30" src="img/book/${bookinfo.img}"></label>
                            </div>
                            <div class="form-group">
                             <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                            </div>
                            <div class="form-group">
                           <label class="control-label" for="floor">FLOOR</label>
                           <c:choose>
								<c:when test="${bookinfo.floor=='1類'}"> 
								<select name="floor" class="form-control">
								<option>摹鷗</option>
								<option value="1類" selected>1類</option>
								<option value="2類">2類</option>
								<option value="3類">3類</option>
								<option value="4類">4類</option>
								</select> 
								</c:when> 
								<c:when test="${bookinfo.floor=='2類'}">
								<select name="floor" class="form-control">
								<option>摹鷗</option>
								<option value="1類" >1類</option>
								<option value="2類" selected>2類</option>
								<option value="3類">3類</option>
								<option value="4類">4類</option>
								</select> 
								</c:when>
								<c:when test="${bookinfo.floor=='3類'}">
								<select name="floor" class="form-control">
								<option>摹鷗</option>
								<option value="1類" >1類</option>
								<option value="2類">2類</option>
								<option value="3類" selected>3類</option>
								<option value="4類">4類</option>
								</select> 
								</c:when>
								<c:otherwise>
								<select name="floor" class="form-control">
								<option>摹鷗</option>
								<option value="1類" >1類</option>
								<option value="2類">2類</option>
								<option value="3類" >3類</option>
								<option value="4類" selected>4類</option>
								</select> 
								</c:otherwise>
								</c:choose>  
                            </div>
                             <div class="form-group">
                                <input type="text" name="total_qt" id="total_qt" class="form-control" placeholder="TOTAL_QT" value="${bookinfo.total_qt}">
                            </div>
                            <input type="button" class="btn btn-primary btn-block" value="熱薑" onclick="update(this.form);">
                        	</div>
                        	</form>
                    		</div>
                    		  </div>
                </div>
            </div>                