package com.mobile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.Book;
import com.entity.User;
import com.entity.UserBook;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class M_UserControl {
	//user
	@Resource(name = "userbiz")
	Biz userbiz;
	@Resource(name = "userbiz")
	SearchBiz SearchBiz;
	//seat
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	//book
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "userbookbiz")
	SearchBiz userbookbiz;
	

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
				String qt = Integer.toString(userbook.getRenew_qt());
				String start = userbook.getStart_date().substring(0, 10);
				String end = userbook.getEnd_date().substring(0, 10);
				String[] info = { bid, book.getName(), start, end, qt };
				if (userbook.getIsreturn() == "n"
						|| userbook.getIsreturn().equals("n")) {
					booklist.add(info);// array¿¡ ´ãÀ½
				}
			}
			userseat = (UserSeat) userseatbiz.get(id);
			if (userseat != null) {
				String start = (String) userseat.getStart_time().substring(10)
						.substring(0, 9);
				String end = (String) userseat.getEnd_time().substring(10)
						.substring(0, 9);
				returnuserseat = new UserSeat(userseat.getU_id(),
						userseat.getS_id(), start, end, userseat.getRenew_qt());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("userseat", returnuserseat);
		session.setAttribute("booklist", booklist);
		mv.addObject("m_center", "user/m_usinginfo.jsp");

		return mv;
	}
	
	@RequestMapping("/m_register.do")
	public ModelAndView m_register() {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		mv.addObject("m_center", "user/m_register.jsp");
		return mv;
	}

	@RequestMapping("/m_registerimpl.do")
	public ModelAndView m_registerimpl(HttpServletRequest request,
			UserCommand com) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		ArrayList<Object> list = new ArrayList<Object>();
		User user = null;
		String fistimg = "index.jpg";
		String imgfile = com.getImg().getOriginalFilename();

		if (imgfile == null || imgfile.equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), fistimg, com.getEmail(), com.getIsadmin());
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());

			MultipartFile file = com.getImg();
			String dir = "C:/lib/SSLibrary/web/img/user/";
			byte[] data;

			try {
				data = file.getBytes();
				FileOutputStream out = new FileOutputStream(dir
						+ file.getOriginalFilename());
				out.write(data);
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {
			list = userbiz.get();
			for (Object obj : list) {
				User check = (User) obj;
				if (com.getId().equals(check.getId())) {
					mv.addObject("m_center", "user/m_register.jsp");
					mv.addObject("fail", "fail");
				} else {
					userbiz.register(user);
					session.setAttribute("user", user);
					mv = new ModelAndView("redirect:/m_center.do");
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/m_modify.do")
	public ModelAndView m_modify(String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		User user = null;
		try {
			user = (User) userbiz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userupdate", user);
		mv.addObject("m_center", "user/m_update.jsp");
		return mv;
	}

	@RequestMapping("/m_modifyimpl.do")
	public ModelAndView m_modifyimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("redirect:/m_center.do");
		HttpSession session = request.getSession();
		String old_img = request.getParameter("oldimg");
		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		User user = null;

		if (img == null || img.equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), old_img, com.getEmail(), com.getIsadmin());
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());
			byte[] data;
			try {
				data = file.getBytes();
				FileOutputStream out = new FileOutputStream(dir
						+ file.getOriginalFilename());
				out.write(data);
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {
			userbiz.modify(user);

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		session.setAttribute("user", user);
		return mv;
	}
}
