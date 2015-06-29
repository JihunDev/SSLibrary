package com.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.MessageLog;
import com.entity.UserSeat;
import com.frame.Biz;

@Controller
public class MessageControl {

	@Resource(name = "messagelogbiz")
	Biz messagelogbiz;

	@Resource(name = "userseatbiz")
	Biz ubiz;
	
	
	@ResponseBody
	@RequestMapping("/msgsendimpl.do")
	public String msgsendimpl(String s_id_str, String sender_id, String text, HttpServletRequest request){
		int s_id = Integer.parseInt(s_id_str);
		
		System.out.println(" s_id: " +s_id  + " sender_id: " + sender_id);
		String u_id = "";
		UserSeat u_seat = null;
		
		//u_seat = ubiz.get(new UserSeat(s_id));
		
		try {
			messagelogbiz.register(new MessageLog(u_id, s_id, sender_id, text));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/seatmain.do";
	}
}
