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
		
		try {
			result = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String center = "center.jsp";
		System.out.println(result);
	
		if(result!=null && (result.getPwd()).equals(pwd)){
			confirm("로그인하시겠습니까?");
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
		}else{
			alert("아이디와 비밀번호가 맞지 않습니다. 다시 입력해주세요");
		}
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("left","left.jsp");
		mv.addObject("center",center);
		return mv;
	}

	private void confirm(String string) {
		// TODO Auto-generated method stub
		
	}

	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}
}
