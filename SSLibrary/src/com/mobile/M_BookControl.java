package com.mobile;

import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	//book
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "bookbiz")
	SearchBiz sbookbiz;
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
	//user
	@Resource(name = "userbiz")
	Biz userbiz;

	@RequestMapping("/m_bookmain.do")
	public ModelAndView m_bookmain(HttpServletRequest request) {
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

	@RequestMapping("/m_booksearch.do")
	public ModelAndView m_booksearch(String issearch, String category,
			String search) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> resultlist = new ArrayList<Object>();
		ArrayList<Object> sublist1 = new ArrayList<Object>();
		ArrayList<Object> sublist2 = new ArrayList<Object>();

		if (issearch.equals("name")) {
			try {
				list = sbookbiz.getname(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (issearch.equals("writer")) {
			try {
				list = sbookbiz.getwriter(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				list = sbookbiz.getname(search);
				for (Object o : list) {
					sublist1.add(o);
				}
				sublist2 = sbookbiz.getwriter(search);
				for (Object o1 : sublist2) {
					Book b1 = (Book) o1;
					Iterator<Object> it = sublist1.iterator();
					while (it.hasNext()) {
						Book b2 = (Book) it.next();
						if (b1.getId().equals(b2.getId())) {
						} else {
							sublist1.add(o1);
							break;
						}

					}
				}
				list = sublist1;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		switch (category) {
		case "i":
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("i")) {
					resultlist.add(o);
				}
			}
			break;
		case "n":
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("n")) {
					resultlist.add(o);
				}
			}
			break;
		case "m":
			for (Object o : list) {
				Book b = (Book) o;
				if (b.getId().substring(0, 1).equals("m")) {
					resultlist.add(o);
				}
			}
			break;
		default:
			resultlist = list;
			break;
		}
		mv.addObject("booklist", resultlist);
		mv.addObject("m_center", "book/m_search.jsp");
		return mv;
	}
	
	@RequestMapping("/m_bookloglist.do")
	public ModelAndView m_bookloglist(HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId();
		ArrayList<Object> result = new ArrayList<Object>();
		result = sbooklogbiz.getname(uid);
		mv.addObject("booklist", result);
		mv.addObject("m_center", "book/m_list.jsp");
		return mv;
	}

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

	@RequestMapping("/m_userbookmodifyimpl.do")
	public ModelAndView m_userbookmodifyimpl(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId();
		int isqt = 0;
		UserBook book = new UserBook(uid, id);
		UserBook usersbook = (UserBook) userbookbiz.get(book);
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();
		int renew_qt = usersbook.getRenew_qt();
		if (renew_qt >= 2) {
			System.out.println("더 연장할 수 없습니다.");
			isqt = 1;
		} else {
			userbookbiz.modify(book);
			BookLog blog = new BookLog(id, uid);
			ArrayList<Object> booklog = new ArrayList<Object>();
			booklog = sbooklogbiz.getid(blog);
			for (Object obj : booklog) {
				BookLog logbook = (BookLog) obj;
				BookLog logbook2 = new BookLog(logbook.getId(),
						logbook.getB_id(), logbook.getU_id(),
						usersbook.getRenew_qt());
				uprebiz.logupdate(logbook2);
				System.out.println(logbook2);
			}
			System.out.println("연장 완료");
			isqt = 2;
		}
		userbooklist = suserbookbiz.getid(uid);
		for (Object obj : userbooklist) {
			UserBook userbook = (UserBook) obj;
			String bid = userbook.getB_id();
			Book book1 = (Book) bookbiz.get(bid);
			String qt = Integer.toString(userbook.getRenew_qt());
			String start = userbook.getStart_date().substring(0, 10);
			String end = userbook.getEnd_date().substring(0, 10);
			String[] info = { bid, book1.getName(), start, end, qt };
			if (userbook.getIsreturn() == "n"
					|| userbook.getIsreturn().equals("n")) {
				booklist.add(info);// array에 담음
			}
		}
		session.setAttribute("booklist", booklist);
		mv.addObject("qt", isqt);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	@RequestMapping("/m_userbookremove.do")
	public ModelAndView m_userbookremove(HttpServletRequest request, String id)
			throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId();
		BookLog blog = new BookLog(id, uid);
		ArrayList<Object> booklog = new ArrayList<Object>();
		booklog = sbooklogbiz.getid(blog);
		for (Object obj : booklog) {
			BookLog logbook = (BookLog) obj;
			BookLog logbook2 = new BookLog(logbook.getId(), logbook.getB_id(),
					logbook.getU_id(), logbook.getReal_date());
			booklogbiz.modify(logbook2);
		}
		int returnqt = 0;
		UserBook userbook = new UserBook(uid, id);
		userbook = (UserBook) userbookbiz.get(userbook);
		UserBook modifyuserbook = new UserBook(uid, id, "y");
		upreuserbookbiz.logreturn(modifyuserbook);
		returnqt = 1;
		ArrayList<Object> userbooklist = new ArrayList<Object>();
		ArrayList<Object> booklist = new ArrayList<Object>();
		userbooklist = suserbookbiz.getid(uid);
		for (Object obj : userbooklist) {
			UserBook userbook1 = (UserBook) obj;
			String bid = userbook1.getB_id();
			Book book1 = (Book) bookbiz.get(bid);
			String[] info = { bid, book1.getName(), userbook1.getStart_date(),
					userbook1.getEnd_date() };
			if (userbook1.getIsreturn() == "n"
					|| userbook1.getIsreturn().equals("n")) {
				booklist.add(info);
			}
		}
		Book b = new Book(id);
		sbookbiz.getnum_reply(b);
		System.out.println("회원이 반납했습니다. 관리자님 확인해주세요.");
		mv.addObject("returnqt", returnqt);
		mv.addObject("booklist", booklist);
		mv.addObject("m_center", "user/m_usinginfo.jsp");
		return mv;
	}

	@RequestMapping("/m_userbookregister.do")
	// 책 대여하기
	public ModelAndView m_userbookregister(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId(); // 회원 아이디 정보 세션에서
											// 가져오기
		User user = null;
		int borrowbook = 0; // 책을 빌렸는지 확인 여부
		// (0 : 아무일도 없음 / 1 : 중복 대여 불가 / 2 : 갯수없어 대여할 수 없음 / 3 : 대여완료 / 4 : 관리자가
		// 확인 안해줌)
		int overlap = 0; // 대여가 중복되었는지 여부 (1 : 중복됨 / 2 : 중복 안됨)

		Book upbook; // 빌리려는 책 정보 가져오는 곳
		Book upbooknew; // 대여 성공시 대여가능 수 1개 줄이기 위해 넣어줘야 하는 책 업데이트 정보
		int current_qt = 0; // 대여 가능한 책이 몇개인지 가져오는 변수

		/*
		 * String isreturn = null; // 반환되었는지 여부를 알기 위한 변수 (관리자 확인 안하고 또 그책 빌릴때)
		 */
		try {
			user = (User) userbiz.get(uid); // 지금 누구 회원이 로그인 했는지 회원 아이디 가져오기
			System.out.println("지금 로그인 한 user  :  " + user.getId());
			System.out.println("빌리려는 책 아이디 : " + id); // 지금 빌리려고 하는 책 id
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 1. 대여 중복인 경우
		// 로그인한 회원이 어떤 책들을 빌렸었는 지 userbook에서 가져온다.(arraylist에 for문으로 넣기)
		// 지금 빌리는 책 아이디와 비교한다.(if 문으로 비교)
		// 중복된 책이 있다면 빌려주지 않는다. (borrowbook =1)

		ArrayList<Object> userbooklist = new ArrayList<Object>(); // 회원이 빌렸던 책들
																	// 알기 위해 만든
																	// 변수
		try {
			userbooklist = suserbookbiz.getid(uid);// user가 빌린 책 넣기
			System.out.println("user가 빌린 책 : " + userbooklist);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String bid = ""; // ArrayList에서 book id 빼기 위해서 만든 변수

		if (userbooklist.size() == 0) { // 대여를 한번도 안한 경우
			overlap = 2;
			System.out.println("중복 안됬지롱");

		} else { // 대여를 한번이라도 한 사람인 경우

			for (Object obj : userbooklist) { // 회원이 빌린 책id들과 지금 대여하려는 책 id 비교함
				UserBook userbook = (UserBook) obj;
				bid = userbook.getB_id();// id 뽑아와서 넣기
				System.out.println("책 id : " + bid);

				if ((bid.equals(id) || bid == id)) {// 대여할려는 책이 중복일 경우

					if ((userbook.getIsreturn() == "n" || userbook
							.getIsreturn().equals("n"))) {// 관리자가 확인한 경우
						System.out
								.println("---------------------이미 대여한 책이라 빌릴 수 없음---------------------");
						overlap = 1; // 중복된 경우
						borrowbook = 1; // 중복대여 불가

					} else {// 관리자가 확인안한 경우
						System.out
								.println("---------------------관리자가 아직 확인을 안해줌---------------------");
						overlap = 1; // 중복된 경우
						borrowbook = 4; // 관리자가 확인 안해줌

					}
					try {
						upbook = (Book) bookbiz.get(id);// 현재 빌리려는 책의 정보를 가져온다.
						mv.addObject("bookdetail", upbook);
						break;
					} catch (Exception e) {
						e.printStackTrace();
					}

				} else {
					overlap = 2; // 중복 안 된경우
				}
			}
			System.out.println("중복 여부 : " + overlap);
		}

		if (overlap == 2) { // 중복이 안된 경우
			// 2. 대여할 책이 없는 경우(중복 안되고 current_qt = 0)
			// 현재 책 아이디에서 남은 갯수를 가져온다.
			// 남은 갯수(current_qt)가 0인것은 대여할 수 없다는 표시를 한다. (borrowbook =2)

			try {
				upbook = (Book) bookbiz.get(id); // 현재 빌리려는 책의 정보를 가져온다.
				current_qt = upbook.getCurrent_qt(); // 대여 가능한 수 확인한다.

				if (current_qt == 0) { // 대여 가능한 책 수량이 0일 경우
					System.out
							.println("---------------------대여 가능한 책 0---------------------");
					borrowbook = 2;
					try {
						upbook = (Book) bookbiz.get(id);// 현재 빌리려는 책의 정보를 가져온다.
						mv.addObject("bookdetail", upbook);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else if (current_qt != 0 && bid != id) {// 대여가 가능할 경우
					// 3. 대여가 가능한 경우(대여 중복이 아니면서 대여할 책이 있는 경우)
					// upbooknew에 갯수를 한개를 빼서 업데이트 한다.
					// userbook과 booklog에 등록한다.
					upbooknew = new Book(upbook.getId(), upbook.getName(),
							upbook.getWriter(), upbook.getImg(),
							upbook.getFloor(), upbook.getTotal_qt(),
							upbook.getCurrent_qt() - 1);
					System.out.println("업데이트 한 book : " + upbooknew);
					bookbiz.modify(upbooknew);
					UserBook book = new UserBook(user.getId(), id);
					userbookbiz.register(book); // userbook에 등록
					System.out.println("userbook 등록 : " + book);

					BookLog logbook = new BookLog(id, user.getId()); // booklog에
																		// 등록
					booklogbiz.register(logbook);
					System.out.println("userbook과 booklog에 등록 완료!!");
					borrowbook = 3;
					Book newbook = (Book) bookbiz.get(upbooknew.getId());
					mv.addObject("bookdetail", newbook);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		mv.addObject("borrowbook", borrowbook);
		mv.addObject("m_center", "book/m_detail.jsp");
		return mv;
	}
}
