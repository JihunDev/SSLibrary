package com.control;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.MessageLog;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class MessageControl {

	@Resource(name = "messagelogbiz")
	Biz messagelogbiz;

	@Resource(name = "userseatbiz")
	Biz ubiz;
	@Resource(name = "userseatbiz")
	SearchBiz s_ubiz;
	
	@ResponseBody
	@RequestMapping("/msgsendimpl.do")
	public String msgsendimpl(String s_id_str, String sender_id, String text, HttpServletRequest request){
		int s_id = Integer.parseInt(s_id_str);
		
		String u_id = "";
		ArrayList<Object> seatbys_id = null;
		
		try {
			seatbys_id = s_ubiz.getid(s_id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for (Object obj : seatbys_id) {
			UserSeat u_seat = (UserSeat) obj;
			u_id = u_seat.getU_id();
		}
		
		System.out.println("u_id: " +u_id  +" s_id: " +s_id  + " sender_id: " + sender_id);
		
		try {
			messagelogbiz.register(new MessageLog(u_id, s_id, sender_id, text));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/seatmain.do";
	}
}
