package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.control.impl.UserImpl;
import com.entity.User;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class UserControl {
	@Resource(name = "userbiz")
	Biz biz;
	@Resource(name = "userbiz")
	SearchBiz searchbiz;
	@Resource(name = "user_usermodifyimpl")
	UserImpl userimpl;

	@RequestMapping("/usersearch.do")
	public ModelAndView usersearch(String search) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> list_check = new ArrayList<Object>();
		try {
			list = biz.get();
			for (Object obj : list) {
				User user = (User) obj;
				String check = user.getIsadmin();
				if (check.equals("d")) {

				} else {
					list_check.add(user);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (search.equals("true")) {
			// 검색을 수행한 후에 bookmain.do를 불렀으므로 전체리스트를 전달하지 않는다.

		} else if (search.equals("false")) {
			// 메뉴에서 처음으로 자료실을 선택할 때 전체 리스트와 요소 수 전달
			mv.addObject("search", "search=false&");
			mv.addObject("userlist", list_check);
			mv.addObject("usercount", String.valueOf(list_check.size()));
		}
		mv.addObject("center", "admin/user/list.jsp");
		return mv;
	}

	@RequestMapping("/userdetail.do")
	public ModelAndView userdetail(String id) {
		ModelAndView mv = new ModelAndView("main");
		User userlist = null;
		try {
			userlist = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userlist", userlist);
		mv.addObject("center", "admin/user/detail.jsp");
		return mv;
	}

	@RequestMapping("/userremoveimpl.do")
	public ModelAndView userremoveimpl(String id) {
		ModelAndView mv = new ModelAndView(
				"redirect:/usersearch.do?search=false");
		User user = new User(id, "d");
		try {
			biz.remove(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/usermodify.do")
	public ModelAndView usermodify(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null;
		try {
			user = (User) biz.get(new User(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userupdate", user);
		mv.addObject("center", "admin/user/update.jsp");
		return mv;
	}

	@RequestMapping("/usermodifyimpl.do")
	public ModelAndView usermodifyimpl(HttpServletRequest request,
			UserCommand com) {

		System.out.println("usermodifyimpl.do com: " + com);
		ModelAndView mv = new ModelAndView(
				"redirect:/usersearch.do?search=false");
		String old_img = request.getParameter("oldimg");
		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		User user = null;

		if (img == null || img.equals("")) {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), old_img, com.getEmail(), com.getIsadmin());
			System.out.println("usermodifyimpl.do user: " + user);
		} else {
			user = new User(com.getId(), com.getPwd(), com.getName(),
					com.getPhone(), com.getImg().getOriginalFilename(),
					com.getEmail(), com.getIsadmin());
			System.out.println("usermodifyimpl.do user: " + user);
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
			biz.modify(user);

			User user_ch = (User) biz.get(new User(com.getId()));
			System.out.println("usermodifyimpl.do user_ch: " + user_ch);
			
			if (user_ch.getIsadmin().equals("s")) {
				String id = user_ch.getId();
				userimpl.tr_usermodifyimpl(id);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/usersearchname.do")
	public ModelAndView usersearchname(UserCommand user1,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> list_check = new ArrayList<Object>();

		String name = user1.getName();
		String isadmin = user1.getIsadmin();
		String id = "";

		if (isadmin.equals("")) {
			isadmin = null;
		}
		if (name.equals("")) {
			name = null;
		}

		try {
			list = searchbiz.getname(new User(id, name, isadmin));
			System.out.println(list);
			for (Object obj : list) {
				User user2 = (User) obj;
				list_check.add(user2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();

		session.setAttribute("search", "search=true&");
		session.setAttribute("userlist", list_check);
		session.setAttribute("usercount", String.valueOf(list_check.size()));
		// 검색을 수행했다는 search값과 검색 결과 리스트 및 요소 수 전달

		mv.addObject("center", "admin/user/list.jsp");
		return mv;
	}
}
