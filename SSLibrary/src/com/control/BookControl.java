package com.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.util.Nav;

@Controller
public class BookControl {
	@Resource(name="bookbiz")
	Biz biz;
	
	@RequestMapping("/bookmain.do")
	public ModelAndView bookmain(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("nav", Nav.book);
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "book/booksearch.jsp");
		return mv; 
	}
}
