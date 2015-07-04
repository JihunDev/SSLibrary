package com.mobile;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class M_SeatControl {

	@Resource(name = "seatbiz")
	Biz biz;
	@Resource(name = "userseatbiz")
	Biz ubiz;
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz ur_lbiz;
	@Resource(name = "seatlogbiz")
	SearchBiz s_lbiz;

	// 연장
	@RequestMapping("/m_userseatmodify.do")
	public ModelAndView m_userseatmodify(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();
		UserSeat userseat = null;
		UserSeat returnuserseat = null;
		
		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		UserSeat us = (UserSeat) userseat;
		if (us.getRenew_qt() == 2) {
		} else {
			try {
				ubiz.modify(new UserSeat(u_id));
				ur_lbiz.logupdate(new SeatLog(u_id));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
			String start = (String) userseat.getStart_time().substring(10)
					.substring(0, 9);
			String end = (String) userseat.getEnd_time().substring(10)
					.substring(0, 9);
			returnuserseat = new UserSeat(userseat.getU_id(),
					userseat.getS_id(), start, end, userseat.getRenew_qt());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("userseat", returnuserseat);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// 반납
	@RequestMapping("/m_userseatremove.do")
	public ModelAndView m_userseatremove(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();
		Object userseat = null;

		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		UserSeat us = (UserSeat) userseat;
		int s_id = us.getS_id();

		try {
			ubiz.remove(new UserSeat(u_id));
			ur_lbiz.logreturn(new SeatLog(u_id));
			biz.modify(new Seat(s_id, "y"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			userseat = ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("userseat", userseat);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// 좌석 대여 과거 내역 출력
	@RequestMapping("/m_seatloglist.do")
	public ModelAndView m_seatloglist(String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");

		ArrayList<Object> sl_l = null;
		try {
			sl_l = s_lbiz.getid(new SeatLog(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("seatloglist", sl_l);
		mv.addObject("m_center", "seat/m_seatloglist.jsp");

		return mv;
	}
}
