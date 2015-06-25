package com.control;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.command.SeatCommand;
import com.command.SeatLogCommand;
import com.command.UserSeatCommand;
import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.UserSeat;
import com.frame.Biz;
import com.util.Nav;


@Controller
public class SeatControl {
	
	@Resource(name="userseatbiz")
	Biz ubiz;
	@Resource(name="seatlogbiz")
	Biz lbiz;
	@Resource(name="seatbiz")
	Biz biz;
	
	@RequestMapping("/seatmain.do")
	public ModelAndView seatmain(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		ArrayList<Object> seatlist = null;
		HttpSession session = request.getSession();
		
		try {
			seatlist = biz.get();
		} catch (Exception e) {
			System.out.println("좌석 열람실 정보 실패");
			e.printStackTrace();
		}
		
		mv.setViewName("main");
		
		mv.addObject("nav", Nav.seat);
		mv.addObject("seatlist", seatlist);
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "seat/seatstate.jsp");
		return mv; 
	}
	
	@RequestMapping("/userseatregister.do")
	public String register(HttpServletRequest request, SeatCommand s, UserSeatCommand us, SeatLogCommand sl) throws Exception{
		
		int s_id = us.getS_id();
		String u_id = "id01";	
		System.out.println("s_id: "+ s_id);		
		
			try {
				ubiz.register(new UserSeat(u_id, s_id));
				lbiz.register(new SeatLog(u_id, s_id));
				biz.modify(new Seat(s_id, "n"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "redirect:/seatmain.do"; 
	}
}
