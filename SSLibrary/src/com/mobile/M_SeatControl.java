package com.mobile;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.command.UserSeatCommand;
import com.entity.Seat;
import com.entity.SeatLog;
import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class M_SeatControl {
	@Resource(name = "seatbiz")
	Biz biz;
	@Resource(name = "userseatbiz")
	Biz ubiz;
	@Resource(name = "seatlogbiz")
	UpdateAndReturnBiz ur_lbiz;
	@Resource(name = "seatlogbiz")
	SearchBiz s_lbiz;
	@Resource(name = "seatlogbiz")
	Biz lbiz;
	@Resource(name = "userseatbiz")
	SearchBiz s_ubiz;
	@Resource(name = "userbiz")
	Biz user_biz;

	@RequestMapping("/m_seatmain.do")
	public ModelAndView m_seatmain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ArrayList<Object> seatlist = null;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		Object myseat = null;
		try {
			myseat = ubiz.get(user.getId());
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			seatlist = biz.get();
		} catch (Exception e) {
			System.out.println("좌석 열람실 정보 실패");
			e.printStackTrace();
		}

		mv.setViewName("mobile/m_main");

		// 좌석 정보
		mv.addObject("seatlist", seatlist);
		System.out.println(seatlist);

		// 내가 이미 좌석예약을 했으면 유효, 없으면 null
		mv.addObject("myseat", myseat);

		mv.addObject("dialogpage", "seatdialog.jsp");
		mv.addObject("seateduserpage", "seateduserinfo.jsp");
		mv.addObject("registermsg", "register.jsp");

		mv.addObject("m_center", "seat/m_seatstate.jsp");
		return mv;
	}

	// 사용자 좌석 예약 메소드
	@RequestMapping("/m_userseatregister.do")
	public String m_userseatregister(HttpServletRequest request,
			UserSeatCommand us) throws Exception {

		int s_id = us.getS_id();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();

		System.out.println("s_id: " + s_id);
		System.out.println("u_id: " + u_id);

		try {
			ubiz.register(new UserSeat(u_id, s_id));
			lbiz.register(new SeatLog(u_id, s_id));
			biz.modify(new Seat(s_id, "n"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/m_seatmain.do";
	}

	// 수정할 좌석에 등록된 회원의 정보 전달
	@SuppressWarnings({ "unchecked" })
	@ResponseBody
	@RequestMapping("/m_seatmodify.do")
	public ResponseEntity<String> m_seatmodify(String s_id,
			HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		Seat seat = null;
		ArrayList<Object> seatbys_id = null;
		String u_id = "";

		try {
			seat = (Seat) biz.get(new Seat(sid_num));
		} catch (Exception e) {
			System.out
					.println("seatmodify.do : (Seat) biz.get(new Seat(sid_num)) Fail");
			e.printStackTrace();
		}
		// 수정할 좌석의 정보를 불러와 해당 좌석의 u_id 추출
		try {
			seatbys_id = (ArrayList<Object>) s_ubiz.getid(s_id);
			// 좌석정보가 있으면 우선 삭제
			if (seatbys_id != null) {
				for (Object obj : seatbys_id) {
					UserSeat u_seat = (UserSeat) obj;
					u_id = u_seat.getU_id();
				}
			}
		} catch (Exception e) {
			System.out
					.println("seatmodify.do : (ArrayList<Object>) s_ubiz.getid(s_id) Fail");
			e.printStackTrace();
		}

		JSONObject result = null;
		try {

			User user = (User) user_biz.get(u_id);
			UserSeat userseat = (UserSeat) ubiz.get(u_id);
			result = new JSONObject();
			result.put("s_id", userseat.getS_id());
			result.put("u_id", userseat.getU_id());
			result.put("pwd", user.getPwd());
			result.put("name", user.getName());
			result.put("phone", user.getPhone());
			result.put("img", user.getImg());
			result.put("email", user.getEmail());
			result.put("start_time", userseat.getStart_time());
			result.put("end_time", userseat.getEnd_time());
			result.put("renew_qt", userseat.getRenew_qt());

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("receiver_sid: " + seat.getId());
		System.out.println("receiver_uid: " + u_id);
		System.out.println("seatstate: " + seat.getState());
		System.out.println("userdetail(JSON): " + result);

		ResponseEntity<String> returnData = null;
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/json;charset=EUC-KR");

		returnData = new ResponseEntity<String>(result.toJSONString(), header,
				HttpStatus.CREATED // 강제로 결과를 만들어 넣어주는것
		);
		return returnData;
	}

	// 좌석 수정 수행 및 결과 반환
	@ResponseBody
	@RequestMapping("/m_seatmodifyimpl.do")
	public String m_seatmodifyimpl(String s_id, String state,
			HttpServletRequest request) {
		int sid_num = Integer.parseInt(s_id);
		String result = "";
		String new_state = state;

		ArrayList<Object> seatbys_id = null;
		String u_id = "";

		try {
			// 수정할 좌석의 정보를 불러와 해당 좌석의 u_id 추출
			seatbys_id = (ArrayList<Object>) s_ubiz.getid(s_id);
			// 좌석정보가 있으면 우선 삭제
			if (seatbys_id != null) {
				for (Object obj : seatbys_id) {
					UserSeat seat = (UserSeat) obj;
					u_id = seat.getU_id();
				}
				ubiz.remove(u_id);
			}
			biz.modify(new Seat(sid_num, new_state));

		} catch (Exception e) {
			System.out.println("seatmodifyimpl.do Fail");
			e.printStackTrace();
		}
		return result;
	}

	// ////////////////////////////////유징인포/////////////////////////////////////////

	// 연장
	@RequestMapping("/m_userseatmodify.do")
	public ModelAndView m_userseatmodify(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();
		UserSeat userseat = null;
		UserSeat returnuserseat = null;

		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		UserSeat us = (UserSeat) userseat;
		if (us.getRenew_qt() == 2) {
		} else {
			try {
				ubiz.modify(new UserSeat(u_id));
				ur_lbiz.logupdate(new SeatLog(u_id));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
			String start = (String) userseat.getStart_time().substring(10)
					.substring(0, 9);
			String end = (String) userseat.getEnd_time().substring(10)
					.substring(0, 9);
			returnuserseat = new UserSeat(userseat.getU_id(),
					userseat.getS_id(), start, end, userseat.getRenew_qt());
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("userseat", returnuserseat);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// 반납
	@RequestMapping("/m_userseatremove.do")
	public ModelAndView m_userseatremove(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String u_id = user.getId();
		Object userseat = null;
		int s_id = 0;
		try {
			userseat = (UserSeat) ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		UserSeat us = (UserSeat) userseat;
		if(us!=null){
			s_id = us.getS_id();	
		}

		try {
			ubiz.remove(new UserSeat(u_id));
			ur_lbiz.logreturn(new SeatLog(u_id));
			biz.modify(new Seat(s_id, "y"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			userseat = ubiz.get(new UserSeat(u_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("userseat", userseat);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// 좌석 대여 과거 내역 출력
	@RequestMapping("/m_seatloglist.do")
	public ModelAndView m_seatloglist(String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");

		ArrayList<Object> sl_l = null;
		try {
			sl_l = s_lbiz.getid(new SeatLog(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("seatloglist", sl_l);
		mv.addObject("m_center", "seat/m_list.jsp");

		return mv;
	}
}
