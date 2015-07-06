package com.mobile;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Book;
import com.entity.BookLog;
import com.entity.User;
import com.entity.UserBook;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class M_BookControl {
	@Resource(name = "userbookbiz")
	Biz userbookbiz;
	@Resource(name = "userbookbiz")
	SearchBiz suserbookbiz;
	@Resource(name = "userbookbiz")
	UpdateAndReturnBiz upreuserbookbiz;
	@Resource(name = "booklogbiz")
	Biz booklogbiz;
	@Resource(name = "booklogbiz")
	SearchBiz sbooklogbiz;
	@Resource(name = "booklogbiz")
	UpdateAndReturnBiz uprebiz;
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "bookbiz")
	SearchBiz sbookbiz;

	@RequestMapping("/m_bookmain.do")
	// 메인////////////////////////////////////////////
	public ModelAndView bookmain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> list = null;

		try {
			list = bookbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("booklist", list);
		mv.addObject("m_center", "book/m_search.jsp");
		return mv;
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	// 검색하기////////////////////////////////////////////
	@RequestMapping("/m_booksearch.do")
	public ResponseEntity<String> booksearch(String issearch, String category,
			String search) {
		ResponseEntity<String> returnData = null;

		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/json;charset=EUC-KR");

		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> resultlist = new ArrayList<Object>();
		ArrayList<Object> sublist1 = new ArrayList<Object>();
		ArrayList<Object> sublist2 = new ArrayList<Object>();

		System.out.println(issearch);
		System.out.println(category);
		System.out.println(search);

		if (issearch.equals("name")) { // 책제목 검색할 때
			try {
				list = sbookbiz.getname(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (issearch.equals("writer")) { // 글쓴이 검색할 때
			try {
				list = sbookbiz.getwriter(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // 책제목과 글쓴이 모두에서 검색할 때
			try {
				list = sbookbiz.getname(search);
				for (Object o : list) {
					sublist1.add(o);
				}
				sublist2 = sbookbiz.getwriter(search);
				for (Object o1 : sublist2) {
					Book b1 = (Book) o1;
					for (Object o2 : sublist1) {
						Book b2 = (Book) o2;
						if (b1.getId().equals(b2.getId())) {
						} else {
							sublist1.add(o1);
						}
					}
				}

				list = sublist1;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		switch (category) { // 카테고리 분류
		case "i": // 카테고리가 IT일 경우
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("i")) {
					resultlist.add(o);
					System.out.println(resultlist);
				}
			}
			break;
		case "n": // 카테고리가 소설일 경우
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("n")) {
					resultlist.add(o);
				}
			}
			break;
		case "m": // 카테고리가 만화책일 경우
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("m")) {
					resultlist.add(o);
				}
			}
			break;
		default: // 카테고리 전체에서 검색
			resultlist = list;
			break;
		}

		JSONArray ja = new JSONArray();
		for (Object obj : resultlist) { // resultlist를 jason으로 넘겨줌
			Book book = (Book) obj;
			JSONObject jo = new JSONObject();
			jo.put("bid", book.getId());
			jo.put("name", book.getName());
			jo.put("writer", book.getWriter());
			jo.put("img", book.getImg());
			jo.put("floor", book.getFloor());
			jo.put("total_qt", book.getTotal_qt());
			jo.put("current_qt", book.getCurrent_qt());
			jo.put("reg_date", book.getReg_date());

			ja.add(jo);
		}
		returnData = new ResponseEntity<String>(ja.toJSONString(), header,
				HttpStatus.CREATED // 강제로 결과를 만들어 넣어주는것
		);
		return returnData;
	}

	// 책 연장하기
	@RequestMapping("/m_userbookmodifyimpl.do")
	public ModelAndView m_userbookmodifyimpl(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // 회원 아이디 정보 세션에서
															// 가져오기
		int isqt = 0;
		UserBook book = new UserBook(uid, id);
		UserBook usersbook = (UserBook) userbookbiz.get(book); // 회원이 빌렸던 책의 정보
																// userbook에서
																// 가져오기

		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>(); // 다시 usinginfo에
																// 들어갈 정보
		int renew_qt = usersbook.getRenew_qt(); // 연장횟수가 몇번인지 가져오기
		if (renew_qt >= 2) { // 연장이 2번 이상이면
			System.out.println("더 연장할 수 없습니다.");
			isqt = 1;

		} else { // 연장이 2번 미만이면
			userbookbiz.modify(book);// 유저의 책 정보 업데이트 -> 연장횟수 증가, 7일 증가... 2번만
										// 되야함...

			// booklog 업데이트
			BookLog blog = new BookLog(id, uid);
			ArrayList<Object> booklog = new ArrayList<Object>();
			booklog = sbooklogbiz.getid(blog); // Booklog에서 회원이 빌렸던 책의 정보를 가져온다.

			for (Object obj : booklog) {// 새로 연장한 정보를 넣어준다.
				BookLog logbook = (BookLog) obj;
				BookLog logbook2 = new BookLog(logbook.getId(),
						logbook.getB_id(), logbook.getU_id(),
						usersbook.getRenew_qt());
				uprebiz.logupdate(logbook2); // 연장 정보 업데이트
				System.out.println(logbook2);

			}

			System.out.println("연장 완료");
			isqt = 2;
		}

		userbooklist = suserbookbiz.getid(uid);// userbook에서 꺼내옴(다시 usinginfo에
												// 들어갈 정보)
		for (Object obj : userbooklist) {
			UserBook userbook = (UserBook) obj;
			String bid = userbook.getB_id();// id 뽑아옴
			Book book1 = (Book) bookbiz.get(bid);// 하나씩 찾음
			String start = userbook.getStart_date().substring(0, 10);
			String end = userbook.getEnd_date().substring(0, 10);
			String[] info = { bid, book1.getName(), start, end };
			// 현재 이용 정보에 필요한 값 String 배열에 넣음
			booklist.add(info);// array에 담음
		}
		// mv.addObject("booklist",booklist); //바뀐것 다시 넣어줌
		session.setAttribute("booklist", booklist);
		mv.addObject("qt", isqt);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// 반납하기 : UserBook에 반납 정보 수정,Log에 반납처리
	@RequestMapping("/m_userbookremove.do")
	public ModelAndView m_userbookremove(HttpServletRequest request, String id)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // 회원 아이디 정보 세션에서
															// 가져오기
		// 1.회원의 아이디와 책 아이디를 가지고 booklog 테이블에 반납정보를 업데이트 한다.

		BookLog blog = new BookLog(id, uid);
		ArrayList<Object> booklog = new ArrayList<Object>();
		booklog = sbooklogbiz.getid(blog); // Booklog에서 회원이 빌렸던 책의 정보를 가져온다.

		for (Object obj : booklog) {// 새로 연장한 정보를 넣어준다.
			BookLog logbook = (BookLog) obj;
			BookLog logbook2 = new BookLog(logbook.getId(), logbook.getB_id(),
					logbook.getU_id(), logbook.getReal_date());
			booklogbiz.modify(logbook2); // 반납 정보 보내준다. real_date가 업데이트 됨
		}

		int returnqt = 0; // 반납했는지 안했는지

		// 2. UserBook의 isreturn을 y로 바꾼다.
		UserBook userbook = new UserBook(uid, id);
		userbook = (UserBook) userbookbiz.get(userbook);
		UserBook modifyuserbook = new UserBook(uid, id, "y");
		upreuserbookbiz.logreturn(modifyuserbook); // y로 수정

		returnqt = 1;

		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>(); // 다시 usinginfo에
																// 들어갈 정보
		userbooklist = suserbookbiz.getid(uid);// userbook에서 꺼내옴(다시 usinginfo에
												// 들어갈 정보)
		for (Object obj : userbooklist) {
			UserBook userbook1 = (UserBook) obj;
			String bid = userbook1.getB_id();// id 뽑아옴
			Book book1 = (Book) bookbiz.get(bid);// 하나씩 찾음

			String[] info = { bid, book1.getName(), userbook1.getStart_date(),
					userbook1.getEnd_date() };
			// 현재 이용 정보에 필요한 값 String 배열에 넣음
			booklist.add(info);// array에 담음
		}

		// 그 책의 qt를 1다시 증가시켜준다.
		Book b = new Book(id);
		sbookbiz.getnum_reply(b);

		System.out.println("회원이 반납했습니다. 관리자님 확인해주세요.");
		mv.addObject("returnqt", returnqt);
		session.setAttribute("booklist", booklist);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	// 자기 대여 내역 보기 (마이페이지 : 도서 이력)
	@RequestMapping("/m_bookloglist.do")
	public ModelAndView m_bookloglist(HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user"); // 회원 아이디 정보
																// 세션에서
		String uid = sessionuser.getId();

		ArrayList<Object> result = new ArrayList<Object>();
		result = sbooklogbiz.getname(uid); // uid로 가져온 booklog의 리스트들....
		mv.addObject("booklist", result);
		mv.addObject("m_center", "book/m_list.jsp");
		return mv;
	}

	// 책 아이디 눌렀을 때 나오는 책 상세 정보
	@RequestMapping("/m_bookdetail.do")
	public ModelAndView m_bookdetail(String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		Object result = null;
		try {
			result = bookbiz.get(id);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("bookdetail", result);
		mv.addObject("m_center", "book/m_detail.jsp");
		return mv;
	}

}
