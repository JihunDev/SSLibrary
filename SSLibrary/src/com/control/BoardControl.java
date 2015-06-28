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
	
	@RequestMapping("/boardwrite.do")
	public ModelAndView boardwrite(HttpServletRequest request) {
		
		return null;
	}
	
	@RequestMapping("/boardwriteimpl.do")
	public ModelAndView boardwriteimpl(HttpServletRequest request) {
		
		return null;
	}
	
	@RequestMapping("/boarddetail.do.do")
	public ModelAndView boarddetail(HttpServletRequest request) {
		
		return null;
	}
	
	@RequestMapping("/boardmodify.do")
	public ModelAndView boardmodify(HttpServletRequest request) {
		
		return null;
	}
	
	@RequestMapping("/boardmodifyimpl.do")
	public ModelAndView boardmodifyimpl(HttpServletRequest request) {
		
		return null;
	}
	
	@RequestMapping("/boardremoveimpl.do")
	public ModelAndView boardremoveimpl(HttpServletRequest request) {
		
		return null;
	}
	
	
}
