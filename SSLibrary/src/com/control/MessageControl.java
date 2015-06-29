package com.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.MessageLog;
import com.frame.Biz;
import com.frame.SearchBiz;

public class MessageControl {
	@Resource(name = "messagelogbiz")
	Biz messagelogbiz;

	@RequestMapping("/msgsendimpl.do")
	public String msgsendimpl(String u_id, String s_id_str, String sender_id, String text, HttpServletRequest request){
		int s_id = Integer.parseInt(s_id_str);
		
		System.out.println("u_id: " +u_id+ " s_id: " +s_id  + " sender_id: " + sender_id);
		
		try {
			messagelogbiz.register(new MessageLog(u_id, s_id, sender_id, text));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/seatmain.do";
	}
	
}
