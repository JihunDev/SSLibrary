package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserCommand;
import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class UserControl {
	@Resource(name = "userbiz")
	Biz biz;
	@Resource(name = "userbiz")
	SearchBiz searchbiz;
	@Resource(name = "userseatbiz")
	Biz userseatbiz;
	@Resource(name = "seatbiz")
	Biz seatbiz;
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz seatlogbiz;

	@RequestMapping("/usersearch.do")
	public ModelAndView usersearch() {
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
		mv.addObject("userlist", list_check);
		mv.addObject("center", "admin/user/list.jsp");
		return mv;
	}

	@RequestMapping("/userdetail.do")
	public ModelAndView userdetail(String id) {
		ModelAndView mv = new ModelAndView("main");
		User user = null;
		try {
			user = (User) biz.get(new User(id));
			System.out.println(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("userlist", user);
		mv.addObject("center", "admin/user/detail.jsp");
		return mv;
	}

	@RequestMapping("/userremoveimpl.do")
	public ModelAndView userremoveimpl(String id) {
		ModelAndView mv = new ModelAndView("redirect:/usersearch.do");
		System.out.println(id);
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
	public ModelAndView usermodifyimpl(UserCommand com) {
		ModelAndView mv = new ModelAndView("redirect:/usersearch.do");
		User user = new User(com.getId(), com.getPwd(), com.getName(),
				com.getPhone(), com.getImg().getOriginalFilename(),
				com.getEmail(), com.getIsadmin());
		try {
			biz.modify(user);
			User user_ch = (User) biz.get(com.getId());
			if (user_ch.getIsadmin().equals("s")) {
				UserSeat userseat = (UserSeat) userseatbiz.get(new UserSeat(
						user_ch.getId()));
				userseatbiz.remove(new UserSeat(user_ch.getId()));// ÁÂ¼® ¹Ý³³
				seatlogbiz.logreturn(new SeatLog(user_ch.getId()));// ·Î±×¿¡ ³²±è
				seatbiz.modify(new Seat(userseat.getS_id(), "y"));// ÁÂ¼® »ç¿ë°¡´É º¯°æ
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		MultipartFile file = com.getImg();
		String dir = "C:/lib/SSLibrary/web/img/user/";
		String img = file.getOriginalFilename();
		if (img == null || img.equals("")) {

		} else {
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
		return mv;
	}

	@RequestMapping("/usersearchname.do")
	public ModelAndView usersearchname(User user1) {
		ModelAndView mv = new ModelAndView("main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> list_check = new ArrayList<Object>();
		System.out.println(user1);
		String name = user1.getName();
		String isadmin = user1.getIsadmin();
		String id = "";

		if (isadmin.equals("")) {
			isadmin = null;
		}
		if (name.equals("")) {
			name = null;
		}

		System.out.println("name : " + name);
		System.out.println("isadmin : " + isadmin);
		try {
			list = searchbiz.getname(new User(id, name, isadmin));
			System.out.println(list);
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
		mv.addObject("userlist", list_check);
		mv.addObject("center", "admin/user/list.jsp");
		return mv;
	}
}
