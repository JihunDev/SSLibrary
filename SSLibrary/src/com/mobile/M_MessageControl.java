package com.mobile;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.MessageLog;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class M_MessageControl {
	@Resource(name = "messagelogbiz")
	Biz messagelogbiz;
	@Resource(name = "messagelogbiz")
	SearchBiz messagelogsearchbiz;
	@Resource(name = "userseatbiz")
	SearchBiz s_ubiz;

	@RequestMapping("/m_msgloglist.do")
	public ModelAndView m_msgloglist(String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> ml = new ArrayList<Object>();
		ArrayList<Object> mlre = new ArrayList<Object>();
		try {
			ml = messagelogsearchbiz.getid(id);
			for (Object ob : ml) {
				MessageLog msg = (MessageLog) ob;
				String text = msg.getText();
				if (text.length() > 10) {
					text = text.substring(0, 10);
					text = text + "...";
				}
				MessageLog msgre = new MessageLog(msg.getId(), msg.getU_id(),
						msg.getS_id(), msg.getSender_id(), text, msg.getRead(),
						msg.getSend_date(), msg.getRead_date());
				mlre.add(msgre);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("messagelog", mlre);
		mv.addObject("m_center", "message/m_list.jsp");
		return mv;
	}

	@RequestMapping("/m_msgdetail.do")
	public ModelAndView m_msglogdetail(String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		ArrayList<Object> list = new ArrayList<Object>();
		// int number = (int) session.getAttribute("msgcheck");
		MessageLog msg = null;
		int number = 0;
		try {
			msg = (MessageLog) messagelogbiz.get(id);
			messagelogbiz.modify(id);
			list = messagelogbiz.get();
			for (Object obj : list) {
				System.out.println(obj);
				MessageLog numbercheck = (MessageLog) obj;
				if (numbercheck.getRead().equals("n")) {
					number += 1;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("msgcheck", number);// 메세지 체크
		System.out.println(number);
		mv.addObject("messagelogdetail", msg);
		mv.addObject("m_center", "message/m_detail.jsp");

		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/m_msgsendimpl.do")
	public String m_msgsendimpl(String s_id_str, String sender_id, String text, HttpServletRequest request){
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
			e.printStackTrace();
		}
		
		return "redirect:/m_seatmain.do";
	}

}
