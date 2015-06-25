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
	public ModelAndView loginimpl(HttpServletRequest request, String id, String pwd) {
		User result = null;
		String check = "";
		
		try {
			result = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		
		
		if(result!=null && (result.getPwd()).equals(pwd)){
			check = "ok";
		}else{
			check = "fail";
		}
		HttpSession session = request.getSession();
		session.setAttribute("user", result);
		session.setAttribute("check", check);
	
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("left","left.jsp");
		mv.addObject("center","center.jsp");
		return mv;
	}

}
