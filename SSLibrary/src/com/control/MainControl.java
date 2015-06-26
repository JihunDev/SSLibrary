package com.control;

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
import com.entity.MessageLog;
import com.entity.User;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.util.Nav;

@Controller
public class MainControl {
	@Resource(name = "userbiz")
	Biz biz;
	
	@Resource(name = "messagelogbiz")
	SearchBiz mbiz;

	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		HttpSession session = request.getSession();
		session.setAttribute("top", "top.jsp");
		mv.addObject("nav", Nav.home);
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "center.jsp");
		return mv;
	}

	@RequestMapping("/register.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("nav", Nav.register);
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "user/register.jsp");
		return mv;
	}

	@RequestMapping("/registerimpl.do")
	public ModelAndView registerimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println(com);
		
		User user = new User(com.getId(), com.getPwd(), com.getName(),
				com.getPhone(), com.getImg().getOriginalFilename(),
				com.getEmail(), com.getIsadmin());
		
		System.out.println(user);
		
		try {
			biz.register(user);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user";
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
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "center.jsp");
		return mv;
	}
	

	@RequestMapping("/loginimpl.do")
	public ModelAndView loginimpl(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		User result = null;

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id + "  " + pwd);

		try {
			result = (User) biz.get(new User(id));
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result != null && (result.getPwd()).equals(pwd)) {
			System.out.println("있음");
			mv.addObject("nav", Nav.register);
			mv.addObject("left", "user/loginok.jsp");
			mv.addObject("center", "center.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
			// 로그인시 유저 정보 세션에 넣음

		} else {
			System.out.println("없음");
			mv.addObject("check", "fail");
			mv.addObject("left", "left.jsp");
			mv.addObject("center", "center.jsp");
		}
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

	@RequestMapping("/detail.do")
	public ModelAndView detail(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null; 
			try {
				user = (User) biz.get(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(user);
	
		mv.addObject("user",user);
		mv.addObject("nav", Nav.register);
		mv.addObject("left", "left.jsp");
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
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "user/update.jsp");
		return mv;
	}

	@RequestMapping("/modifyimpl.do")
	public ModelAndView modifyimpl(HttpServletRequest request, UserCommand com) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println(com);

		User user = new User(com.getId(), com.getPwd(), com.getName(),
				com.getPhone(), com.getImg().getOriginalFilename(),
				com.getEmail(), com.getIsadmin());
		
		System.out.println(user);
		
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
		mv.addObject("nav", Nav.register);
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "center.jsp");
		return mv;
	}
	
	@RequestMapping("/msgloglist.do")
	public ModelAndView msgloglist(String id) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println(id);
		ArrayList<Object> ml = null;
		try {
			ml = mbiz.getid(id);
			System.out.println(ml);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("nav", Nav.register);
		mv.addObject("left", "left.jsp");
		mv.addObject("messagelog", ml);
		mv.addObject("center", "messagelog/messagelist.jsp");
		return mv;
	}
	
}
