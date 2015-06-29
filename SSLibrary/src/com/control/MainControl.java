package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.Book;
import com.entity.MessageLog;
import com.entity.User;
import com.entity.UserBook;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.util.Nav;

@Controller
public class MainControl {
	@Resource(name = "userbiz")
	Biz biz;
	@Resource(name = "messagelogbiz")
	Biz messagelogbiz;
	@Resource(name = "messagelogbiz")
	SearchBiz messagelogsearchbiz;
	@Resource(name = "userbookbiz")
	SearchBiz userbookbiz;
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	@Resource(name = "bookbiz")
	Biz bookbiz;

	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		HttpSession session = request.getSession();
		session.setAttribute("top", "top.jsp");
		session.setAttribute("left", "user/login.jsp");
		mv.addObject("nav", Nav.home);
		mv.addObject("center", "center.jsp");

		String ls_name = "";
		String ls_value = "";
		Enumeration<String> enum_app = session.getAttributeNames();
		while (enum_app.hasMoreElements()) {
			ls_name = enum_app.nextElement().toString();
			ls_value = session.getAttribute(ls_name).toString();
			System.out.println("얻어온 세션 이름 :" + ls_name);
			System.out.println("얻어온 세션 값 :" + ls_value);
		}
		return mv;
	}

	@RequestMapping("/register.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("nav", Nav.register);
		mv.addObject("center", "user/register.jsp");
		return mv;
	}

	@RequestMapping("/registerimpl.do")
	public ModelAndView registerimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("main");

		User user = new User(com.getId(), com.getPwd(), com.getName(),
				com.getPhone(), com.getImg().getOriginalFilename(),
				com.getEmail(), com.getIsadmin());

		try {
			biz.register(user);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		if (img == null || img.equals("")) {

		} else {
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
		mv.addObject("nav", Nav.register);
		mv.addObject("center", "center.jsp");
		return mv;
	}

	@RequestMapping("/loginimpl.do")
	public ModelAndView loginimpl(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		User result = null;
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		try {
			result = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result != null && (result.getPwd()).equals(pwd)) {
			mv.addObject("nav", Nav.register);
			mv.addObject("center", "center.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
			session.setAttribute("id", id);
		} else {
			mv.addObject("check", "fail");
			mv.addObject("center", "center.jsp");
		}
		return mv;
	}

	@RequestMapping("/del.do")
	public ModelAndView del(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		String id = request.getParameter("id");
		String is = "d";
		try {
			biz.remove(new User(id, is));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("nav", Nav.register);// 추후수정
		mv.addObject("center", "center.jsp");
		return mv;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main.do";
	}

	@ResponseBody
	@RequestMapping("/idcheck.do")
	public String idcheck(String id) {
		User user = null;
		String result = "";
		try {
			user = (User) biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user != null) {
			result = "0";
		} else {
			result = "1";
		}

		return result;
	}

	@RequestMapping("/detail.do")
	public ModelAndView detail(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null;
		try {
			user = (User) biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("user", user);
		mv.addObject("nav", Nav.register);
		mv.addObject("center", "user/detail.jsp");
		return mv;
	}

	@RequestMapping("/modify.do")
	public ModelAndView modify(String id) {
		User user = null;
		try {
			user = (User) biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView("main");
		mv.addObject("nav", Nav.register);
		mv.addObject("userupdate", user);
		mv.addObject("center", "user/update.jsp");
		return mv;
	}

	@RequestMapping("/modifyimpl.do")
	public ModelAndView modifyimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("main");

		User user = new User(com.getId(), com.getPwd(), com.getName(),
				com.getPhone(), com.getImg().getOriginalFilename(),
				com.getEmail(), com.getIsadmin());

		try {
			biz.modify(user);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		if (img == null || img.equals("")) {

		} else {
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
		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		mv.addObject("nav", Nav.register);
		mv.addObject("center", "center.jsp");
		return mv;
	}

	@RequestMapping("/msgloglist.do")
	public ModelAndView msgloglist(String id) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> ml = new ArrayList<Object>();
		ArrayList<Object> mlre = new ArrayList<Object>();
		try {
			ml = messagelogsearchbiz.getid(id);
			for (Object ob : ml) {
				MessageLog msg = (MessageLog) ob;
				String text = msg.getText();
				text = text.substring(0, 10);
				text = text + "...";
				MessageLog msgre = new MessageLog(msg.getId(), msg.getU_id(),
						msg.getS_id(), msg.getSender_id(), text, msg.getRead(),
						msg.getSend_date(), msg.getRead_date());
				mlre.add(msgre);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("nav", Nav.register);
		mv.addObject("messagelog", mlre);
		mv.addObject("center", "messagelog/messagelist.jsp");
		return mv;
	}

	@RequestMapping("/msgdetail.do")
	public ModelAndView msglogdetail(String id) {
		ModelAndView mv = new ModelAndView("main");
		MessageLog msg = null;

		try {
			msg = (MessageLog) messagelogbiz.get(id);
			messagelogbiz.modify(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("nav", Nav.register);
		mv.addObject("messagelogdetail", msg);
		mv.addObject("center", "messagelog/messagedetail.jsp");

		return mv;
	}

	@RequestMapping("/usinginfo.do")
	public ModelAndView usinginfo(String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();

		Object userseat = null;
		HttpSession session = request.getSession();

		try {
			userbooklist = userbookbiz.getid(id);// userbook에서 꺼내옴
			for (Object obj : userbooklist) {
				UserBook userbook = (UserBook) obj;
				String bid = userbook.getB_id();// id 뽑아옴

				Book book = (Book) bookbiz.get(bid);// 하나씩 찾음

				String[] info = { bid, book.getName(),
						userbook.getStart_date(), userbook.getEnd_date() };
				// 현재 이용 정보에 필요한 값 String 배열에 넣음
				booklist.add(info);// array에 담음
			}
			userseat = userseatbiz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("userseat", userseat);		
		session.setAttribute("booklist",booklist);
		mv.addObject("nav", Nav.register);
		mv.addObject("center", "user/usinginfo.jsp");

		return mv;
	}

}
