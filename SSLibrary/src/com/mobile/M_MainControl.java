package com.mobile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.User;
import com.frame.Biz;

@Controller
public class M_MainControl {
	@Resource(name = "userbiz")
	Biz userbiz;

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

	@RequestMapping("/m_login.do")
	public ModelAndView m_login(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		User result = null;

		try {
			if (id == null || id.equals("")) {
				User sessionuser = (User) session.getAttribute("user");
				if (sessionuser != null) {
					String sessionid = sessionuser.getId();
					result = (User) userbiz.get(new User(sessionid));
					session.setAttribute("user", result);
					mv = new ModelAndView("redirect:/m_center.do");
				} else {
					mv = new ModelAndView("redirect:/m_main.do");
				}
			} else {
				result = (User) userbiz.get(new User(id));
				if (result == null || result.getIsadmin().equals("d")) {
					mv = new ModelAndView("redirect:/m_main.do");
				} else {
					if (result != null && (result.getPwd()).equals(pwd)) {
						session.setAttribute("user", result);
						mv.addObject("id", result.getId());
						mv = new ModelAndView("redirect:/m_center.do");
					} else {
						mv = new ModelAndView("redirect:/m_main.do");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
