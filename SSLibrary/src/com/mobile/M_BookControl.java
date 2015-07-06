package com.mobile;

import java.util.ArrayList;

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
	@Resource(name = "userbiz")
	// user정보
	Biz userbiz;

	@RequestMapping("/m_bookmain.do")
	// 메인
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

	// 검색하기
	@RequestMapping("/m_booksearch.do")
	public ModelAndView m_booksearch(String issearch, String category,
			String search) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> resultlist = new ArrayList<Object>();
		ArrayList<Object> sublist1 = new ArrayList<Object>();
		ArrayList<Object> sublist2 = new ArrayList<Object>();

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

		mv.addObject("booklist", resultlist);
		mv.addObject("m_center", "book/m_search.jsp");

		return mv;
	}

	// 책 연장하기
	@RequestMapping("/m_userbookmodifyimpl.do")
	public ModelAndView m_userbookmodifyimpl(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		User sessionuser = (User) session.getAttribute("user");
		String uid = sessionuser.getId(); // 회원 아이디 정보 세션에서
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
			String qt = Integer.toString(userbook.getRenew_qt());
			String start = userbook.getStart_date().substring(0, 10);
			String end = userbook.getEnd_date().substring(0, 10);
			String[] info = { bid, book1.getName(), start, end, qt };
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
		upreuserbookbiz.logreturn(modifyuserbook); // y로 수정
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
			booklist.add(info);
		}

		Book b = new Book(id);
		sbookbiz.getnum_reply(b);

		System.out.println("회원이 반납했습니다. 관리자님 확인해주세요.");

		mv.addObject("returnqt", returnqt);
		mv.addObject("booklist", booklist);
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

	@RequestMapping("/m_userbookregister.do")
	// 책 대여하기
	public ModelAndView m_userbookregister(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString(); // 회원 아이디 정보 세션에서
															// 가져오기
		User user = null;
		int borrowbook = 0; // 책을 빌렸는지 확인 여부
		// (0 : 아무일도 없음 / 1 : 중복 대여 불가 / 2 : 갯수없어 대여할 수 없음 / 3 : 대여완료 )
		int overlap = 0; // 대여가 중복되었는지 여부 (1 : 중복됨 / 2 : 중복 안됨)

		Book upbook; // 빌리려는 책 정보 가져오는 곳
		Book upbooknew; // 대여 성공시 대여가능 수 1개 줄이기 위해 넣어줘야 하는 책 업데이트 정보
		int current_qt = 0; // 대여 가능한 책이 몇개인지 가져오는 변수

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
		String bid = "";

		if (userbooklist.size() == 0) { // 대여를 한번도 안한 경우
			overlap = 2;
			System.out.println("중복 안됬지롱");

		} else { // 대여를 한번이라도 한 사람인 경우

			for (Object obj : userbooklist) { // 회원이 빌린 책id들과 지금 대여하려는 책 id 비교함
				UserBook userbook = (UserBook) obj;
				bid = userbook.getB_id();// id 뽑아와서 넣기
				System.out.println("책 id : " + bid);

				if (bid.equals(id) || bid == id) {// 대여할려는 책이 중복일 경우
					System.out
							.println("---------------------이미 대여한 책이라 빌릴 수 없음---------------------");
					overlap = 1; // 중복된 경우
					borrowbook = 1;
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
