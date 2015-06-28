package com.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;

@Controller
public class BoardControl {
	
	@Resource(name="boardbiz")
	Biz biz;
	
	@RequestMapping("/boardmain.do")
	public ModelAndView boardmain(HttpServletRequest request) {
		
		return null;
	}
	
	
}
