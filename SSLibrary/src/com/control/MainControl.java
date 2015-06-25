package com.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.User;
import com.frame.Biz;
import com.util.Nav;

@Controller
public class MainControl {
	@Resource(name="userbiz")
	Biz biz;
	
	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request){
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
	
	@RequestMapping("/loginimpl.do")
	public ModelAndView loginimpl(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		User result = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id+"  "+pwd);	
		
		try {
			result = (User) biz.get(new User(id));
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		if(result!=null && (result.getPwd()).equals(pwd)){
			System.out.println("있음");
			mv.addObject("nav", Nav.register);
			mv.addObject("left", "user/loginok.jsp");
			mv.addObject("center", "center.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
			// 로그인시 유저 정보 세션에 넣음
			
		}else{
			System.out.println("없음");
			mv.addObject("check", "fail");
			mv.addObject("left", "left.jsp");
			mv.addObject("center", "center.jsp");
		}
		
		return mv;
	}

}
