package com.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainControl {
	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("top", "top.jsp");
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "center.jsp");
		return mv; 
	}
}
