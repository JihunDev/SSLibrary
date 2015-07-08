package com.mobile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.MessageLog;
import com.entity.User;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class M_MainControl {
	@Resource(name = "userbiz")
	Biz userbiz;
	@Resource(name = "messagelogbiz")
	SearchBiz messagelogsearchbiz;

	@RequestMapping("/m_main.do")
	public ModelAndView m_main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		mv.addObject("m_center", "m_login.jsp");
		return mv;
	}

	@RequestMapping("/m_center.do")
	public ModelAndView m_center(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		mv.addObject("m_center", "m_center.jsp");
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

	@RequestMapping("/m_login.do")
	public ModelAndView m_login(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		ArrayList<Object> list = new ArrayList<Object>();
		User result = null;
		int msgchecknumber = 0;

		try {
			if (id == null || id.equals("")) {//값이 없으면
				mv.addObject("m_center", "m_login.jsp");
			} else {
				result = (User) userbiz.get(new User(id));
				list = messagelogsearchbiz.getid(new MessageLog(id));
				if (result.getIsadmin().equals("d")) {//정지회원이면
					mv.addObject("m_center", "m_login.jsp");
				} else {
					if (result != null && (result.getPwd()).equals(pwd)) {
						for (Object obj : list) {
							MessageLog log = (MessageLog) obj;
							String read = log.getRead();
							if (read.equals("n")) {
								msgchecknumber += 1;
							}
						}
						mv = new ModelAndView("redirect:/m_center.do");
					} else {
						mv.addObject("m_center", "m_login.jsp");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("user", result);
		System.out.println("세션 정보 : "+ result);
		session.setAttribute("msgcheck", msgchecknumber);
		System.out.println("로그인 메세지 : "+ msgchecknumber);
		return mv;
	}

	@ResponseBody
	@RequestMapping("/m_idcheck.do")
	public String m_idcheck(String id) {
		User user = null;
		String result = "";
		try {
			user = (User) userbiz.get(id);
			if (user != null) {
				result = "0";
			} else {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/m_logout.do")
	public String m_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/m_main.do";
	}

}
