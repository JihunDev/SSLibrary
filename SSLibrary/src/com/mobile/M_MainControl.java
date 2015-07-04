package com.mobile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.MessageLog;
import com.entity.User;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class M_MainControl {
	@Resource(name = "userbiz")
	Biz userbiz;
	@Resource(name = "messagelogbiz")
	SearchBiz messagelogsearchbiz;

	// 메인화면
	@RequestMapping("/m_main.do")
	public ModelAndView m_main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		session.setAttribute("m_top", "m_top.jsp");
		if(user == null){
			mv.addObject("m_center", "m_login.jsp");
		}else {
			mv.addObject("m_center", "m_center.jsp");
		}//조금더 생각해보겠음 뒤로가기 할때에 로그인으로 자꾸감		

		return mv;
	}

	// 회원가입 창으로 이동
	@RequestMapping("/m_register.do")
	public ModelAndView m_register() {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		mv.addObject("m_center", "user/m_register.jsp");
		return mv;
	}

	// 회원가입 impl
	@RequestMapping("/m_registerimpl.do")
	public ModelAndView m_registerimpl(HttpServletRequest request,
			UserCommand com) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		ArrayList<Object> list = new ArrayList<Object>();
		User user = null;
		String fistimg = "index.jpg";
		String imgfile = com.getImg().getOriginalFilename();

		if (imgfile == null || imgfile.equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), fistimg, com.getEmail(), com.getIsadmin());
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());

			MultipartFile file = com.getImg();
			String dir = "C:/lib/SSLibrary/web/img/user/";
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

		try {
			list = userbiz.get();
			for (Object obj : list) {
				User check = (User) obj;
				if (com.getId().equals(check.getId())) {
					mv.addObject("m_center", "user/m_register.jsp");
					mv.addObject("fail", "fail");
				} else {
					userbiz.register(user);
					session.setAttribute("user", user);
					mv.addObject("m_center", "m_center.jsp");
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return mv;
	}

	// 로그인
	@RequestMapping("/m_login.do")
	public ModelAndView m_login(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		User result = null;
		ArrayList<Object> list = new ArrayList<Object>();
		int msgchecknumber = 0;
		try {
			result = (User) userbiz.get(new User(id));
			list = messagelogsearchbiz.getid(new MessageLog(id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result.getIsadmin().equals("d")) {
			// 삭제 회원 로그인 불가능
		} else {
			if (result != null && (result.getPwd()).equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", result);
				session.setAttribute("id", id);

				for (Object obj : list) {
					MessageLog log = (MessageLog) obj;
					String read = log.getRead();
					if (read.equals("n")) {
						msgchecknumber += 1;
					}
				}

				session.setAttribute("msgcheck", msgchecknumber);
				// 메세지 수 카운트
				session.setAttribute("user", result);
				// 회원정보 세션에 올림
				mv.addObject("m_center", "m_center.jsp");
			} else {
				mv.addObject("m_center", "m_login.jsp");
			}
		}
		return mv;
	}

	// id중복체크
	@ResponseBody
	@RequestMapping("/m_idcheck.do")
	public String m_idcheck(String id) {
		User user = null;
		String result = "";
		try {
			user = (User) userbiz.get(id);
			if (user != null) {
				result = "0";
			} else {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
