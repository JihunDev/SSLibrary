package com.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserControl {
	
	
	
	@RequestMapping("/usersearch.do")
	public ModelAndView usersearch() {
		ModelAndView mv = new ModelAndView("main");
		
		
		return mv;
	}
	
}
