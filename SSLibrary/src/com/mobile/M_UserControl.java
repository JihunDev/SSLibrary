package com.mobile;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Book;
import com.entity.UserBook;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class M_UserControl {
	@Resource(name = "userbookbiz")
	SearchBiz userbookbiz;
	@Resource(name = "userbiz")
	SearchBiz SearchBiz;
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	@Resource(name = "bookbiz")
	Biz bookbiz;

	@RequestMapping("/m_usinginfo.do")
	public ModelAndView m_usinginfo(String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();
		UserSeat userseat = null;
		UserSeat returnuserseat = null;

		try {
			userbooklist = userbookbiz.getid(id);// userbook¿¡¼­ ²¨³»¿È
			for (Object obj : userbooklist) {
				UserBook userbook = (UserBook) obj;
				String bid = userbook.getB_id();// id »Ì¾Æ¿È
				Book book = (Book) bookbiz.get(bid);// ÇÏ³ª¾¿ Ã£À½
				String start = userbook.getStart_date().substring(0, 10);
				String end = userbook.getEnd_date().substring(0, 10);
				String[] info = { bid, book.getName(), start, end };
				booklist.add(info);
			}
			userseat = (UserSeat) userseatbiz.get(id);
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
		session.setAttribute("booklist", booklist);
		mv.addObject("m_center", "user/m_usinginfo.jsp");

		return mv;
	}

}
