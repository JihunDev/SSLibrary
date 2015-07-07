<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>


<fieldset class="ui-grid-a">
   <div class="ui-block-a">
      <a href="m_seatmain.do" data-role="button" data-inline="true"
         style="height: 100px; width: 100px"><img width="80" src="img/mobile/Pencil.png"><br>열람실</a>
   </div>
   <div class="ui-block-b">
      <a href="m_bookmain.do" data-role="button" data-inline="true"
         style="height: 100px; width: 100px"><img width="80" src="img/mobile/Bookmarks.png"><br>도서 조회</a>
   </div>
   <div class="ui-block-a">
      <a href="m_usinginfo.do?id=${user.id}" data-role="button" data-inline="true"
         style="height: 100px; width: 100px"><img width="80" src="img/mobile/User.png"><br>이용정보</a>
   </div>
   <div class="ui-block-b">
      <a href="m_msgloglist.do?id=${user.id}" data-role="button" data-inline="true"
         style="height: 100px; width: 100px"><img width="80" src="img/mobile/Mail.png"><br>메세지 : ${msgcheck}</a>
   </div>
   <div class="ui-block-a">
      <a href="m_boardmain.do?sort=notice" data-role="button" data-inline="true"
         style="height: 100px; width: 100px"><img width="80" src="img/mobile/Clipboard.png"><br>공지사항</a>
   </div>
   <div class="ui-block-b">
      <a href="m_boardmain.do?sort=free" data-role="button" data-inline="true"
         style="height: 100px; width: 100px"><img width="80" src="img/mobile/Chats.png"><br>자유 게시판</a>
   </div>
</fieldset>