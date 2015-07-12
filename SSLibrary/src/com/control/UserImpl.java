package com.control;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.MessageLog;
import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.UpdateAndReturnBiz;

@Service("user_usermodifyimpl")
public class UserImpl {
   @Resource(name = "userbiz")
   Biz biz;
   @Resource(name = "userseatbiz")
   Biz userseatbiz;
   @Resource(name = "seatbiz")
   Biz seatbiz;
   @Resource(name = "messagelogbiz")
   Biz message_biz;

   
   @Resource(name = "seatlogbiz")
   UpdateAndReturnBiz seatlogbiz;

   @Transactional
   public void tr_usermodifyimpl(String id) {
      User userinfo = new User(id, "s"); // user의 상태를 정지로 바꿔줌
      try {
         biz.modify(userinfo);
         UserSeat userseat = (UserSeat) userseatbiz.get(new UserSeat(id));
         message_biz.register(new MessageLog(id, 0, "System", id+"님의 계정이 일시정지 되었습니다."));
         
         if (userseat != null) {
            userseatbiz.remove(new UserSeat(id));// 좌석 반납
            seatlogbiz.logreturn(new SeatLog(id));// 로그에 남김
            seatbiz.modify(new Seat(userseat.getS_id(), "y"));// 좌석 사용가능
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}