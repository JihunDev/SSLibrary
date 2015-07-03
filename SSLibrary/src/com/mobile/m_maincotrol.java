package com.m_control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class m_maincotrol {

	@RequestMapping("/m_main.do")
	public ModelAndView m_main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("m_main");

		mv.addObject("m_top", "moblie/m_top.jsp");
		mv.addObject("m_center", "moblie/m_login.jsp");

		return mv;
	}
}
