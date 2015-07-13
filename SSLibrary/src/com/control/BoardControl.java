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

import com.command.BoardGetReplyNumCommand;
import com.command.BoardUploadCommand;
import com.entity.Board;
import com.frame.Biz;
import com.frame.SearchBiz;
import com.frame.UpdateAndReturnBiz;

@Controller
public class BoardControl {

	@Resource(name = "boardbiz")
	Biz biz;
	@Resource(name = "boardbiz")
	SearchBiz boardsearchbiz;
	@Resource(name = "boardbiz")
	UpdateAndReturnBiz boardUpdateAndReturnBiz;

	@RequestMapping("/boardmain.do")
	public ModelAndView boardmain(String sort, String search) {
		ModelAndView mv = new ModelAndView("main");

		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> return_list = new ArrayList<Object>();

		System.out.println("sort: " + sort);
		int reply_count = 0;
		try {
			list = boardsearchbiz.getid(sort);
			System.out.println(list);
			for (Object obj1 : list) {
				Board b = (Board) obj1;						
				reply_count = boardsearchbiz.getnum_reply(b);
				BoardGetReplyNumCommand bcom = new BoardGetReplyNumCommand(b.getId(), b.getU_id(),
						b.getCounter(),b.getTitle(), b.getContent(), b.getReg_date(),
						b.getSort(), b.getFile_name(),
						b.getReg_number(), reply_count);
				return_list.add(bcom);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(search.equals("true")){
		// 검색을 수행한 후에 bookmain.do를 불렀으므로 전체리스트를 전달하지 않는다.
			
		}else if(search.equals("false")){
		// 메뉴에서 처음으로 자료실을 선택할 때 전체 리스트와 요소 수 전달
			mv.addObject("search", "search=false&");

			mv.addObject("sortname", sort);
			mv.addObject("boardlist", return_list);
			System.out.println(return_list);
			String list_count = String.valueOf(return_list.size());
			mv.addObject("boardlist_length", list_count);
		}
		
		mv.addObject("center", "board/list.jsp");
		return mv;
	}

	@RequestMapping("/boardwrite.do")
	public ModelAndView boardwrite(String sort) {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("center", "board/register.jsp");
		mv.addObject("sort", sort);
		return mv;
	}

	@RequestMapping("/boardwriteimpl.do")
	public ModelAndView boardwriteimpl(BoardUploadCommand com) {

		System.out.println(com);
		Board board = null;
		ModelAndView mv = new ModelAndView();

		if (com.getReg_number() == 0) {
			board = new Board(com.getU_id(), com.getTitle(), com.getContent(),
					com.getSort(), com.getFile_name().getOriginalFilename(),
					com.getReg_number());
			mv.setViewName("redirect:/boardmain.do?search=false&sort=" + com.getSort());
		} else {
			board = new Board(com.getU_id(), com.getContent(), com.getSort(),
					com.getReg_number());
			mv.setViewName("redirect:/boarddetail.do?search=false&id=" + com.getReg_number());
		}
		System.out.println("command : " + board);
		try {
			biz.register(board);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (com.getFile_name() != null) {

			MultipartFile file = com.getFile_name();
			String dir = "C:/lib/SSLibrary/web/img/board/";
			String img = file.getOriginalFilename();
			if (img == null || img.equals("")) {

			} else {
				byte[] data;
				try {
					data = file.getBytes();
					FileOutputStream out = new FileOutputStream(dir	+ file.getOriginalFilename());
					out.write(data);
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}

		}
		return mv;
	}

	/*
	 * @RequestMapping("/boardreplyregister.do") public ModelAndView
	 * boardreplyregister(Board board) { Board board2 = new
	 * Board(board.getU_id(), board.getContent(), board.getSort(),
	 * board.getReg_number()); try { biz.register(board2); } catch (Exception e)
	 * { e.printStackTrace(); } ModelAndView mv = new
	 * ModelAndView("redirect:/boarddetail.do?id=" + board2.getReg_number());
	 * return mv; }
	 */

	@RequestMapping("/boarddetail.do")
	public ModelAndView boarddetail(int id) {
		ModelAndView mv = new ModelAndView("main");

		ArrayList<Object> list = new ArrayList<Object>();
		Board board = new Board(id);
		Board board2 = null;

		try {
			board2 = (Board) biz.get(board);
			boardUpdateAndReturnBiz.logupdate(board);// 카운터

			list = boardsearchbiz.getname(new Board(board2.getId(), board2
					.getSort()));// 리플불러오기

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("id : " + id);
		System.out.println("list : " + list);
		mv.addObject("boardreply", list);
		mv.addObject("boarddetail", board2);
		mv.addObject("center", "board/detail.jsp");

		return mv;
	}

	@RequestMapping("/boardmodify.do")
	public ModelAndView boardmodify(Board board) {
		ModelAndView mv = new ModelAndView("main");
		Board board2 = null;
		

		if(board.getReg_number() == 0){ //게시글
			try {
				board2 = (Board) biz.get(board.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.addObject("boardupdate", board2);
			mv.addObject("center", "board/update.jsp");	
		}else{									//댓글
			mv.setViewName("redirect://boarddetail.do?id=" + board.getReg_number());			
		}
		
		return mv;
	}

	@RequestMapping("/boardmodifyimpl.do")
	public ModelAndView boardmodifyimpl(HttpServletRequest request, BoardUploadCommand com) {
		Board board =  null;
		ModelAndView mv = new ModelAndView();
		String old_file_name = request.getParameter("old_file_name");
		System.out.println("기존파일 : " + old_file_name);
		System.out.println(" com.getReg_number() : " + com.getReg_number());
		System.out.println("com.getU_id: " + com.getU_id());
		System.out.println(com);


		
		if(com.getReg_number() == 0){
		// 게시글
			MultipartFile file = com.getFile_name();
			String dir = "C:/lib/SSLibrary/web/img/board/";
			String img = file.getOriginalFilename();
			
			if(img == null || img.equals("")){
				board = new Board(com.getId(), com.getTitle(), com.getContent(),	com.getSort(), old_file_name);
			}else{
				board = new Board(com.getId(), com.getTitle(), com.getContent(),	com.getSort(), com.getFile_name().getOriginalFilename());
			}
			if (com.getFile_name() != null) {

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
			}
			mv.setViewName("redirect:/boarddetail.do?id=" + com.getId());
			
			
		}else{
		//댓글
			board = new Board(com.getId(), com.getContent(), com.getSort());	
			System.out.println("댓글 board: " + board);
			mv.setViewName("redirect:/boarddetail.do?id=" + com.getReg_number());				
		}	
		try {
			biz.modify(board);
		} catch (Exception e1) {
			e1.printStackTrace();
		}	
		
		return mv;
	}

	@RequestMapping("/boardremoveimpl.do")
	public ModelAndView boardremoveimpl(Board board) {
		ModelAndView mv = new ModelAndView();
		Board delete_board = null;
		
		try {
			delete_board = new Board(board.getId(), board.getReg_number());
			System.out.println(delete_board);
			biz.remove(delete_board);
			if(board.getReg_number() == 0){ 
			//게시글
				mv.setViewName("redirect:/boardmain.do?search=false&sort=" + board.getSort());			
			}else{
			//댓글
				mv.setViewName("redirect:/boarddetail.do?id=" + board.getReg_number());			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/boardsearch.do")
	public ModelAndView boardsearch(String search, String sort, String issearch, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		Board board = null;
		
		
		ArrayList<Object> result_list = new ArrayList<Object>();
		ArrayList<Object> list = null;
		
		System.out.println("검색어: " + search + " 게시판 종류: " + sort + " 검색 분류: " + issearch);
		
		switch (issearch) {
			case "id":
				String u_id = search;
				board = new Board(u_id, null, null, sort);
				break;
			case "ct":
				String text = search;
				board = new Board(null, text, text, sort);
				break;
			case "title":
				String title = search;
				board = new Board(null, title, null, sort);
				break;
			case "content":
				String content = search;
				board = new Board(null, null, content, sort);
				break;
		}
		System.out.println(board);
		int reply_count=0;
		try {
			for (Object obj1 : boardsearchbiz.getwriter(board)) {
				Board b = (Board) obj1;
				if(sort.equals(b.getSort())){
					reply_count = boardsearchbiz.getnum_reply(b);
					BoardGetReplyNumCommand bcom = new BoardGetReplyNumCommand(b.getId(), b.getU_id(),
							b.getCounter(),b.getTitle(), b.getContent(), b.getReg_date(),
							b.getSort(), b.getFile_name(),
							b.getReg_number(), reply_count);
					result_list.add(bcom);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("sortname", sort);
		session.setAttribute("boardlist", result_list);
		String list_count = String.valueOf(result_list.size());
		session.setAttribute("boardlist_length", list_count);

		session.setAttribute("search", "search=true&");
		mv.addObject("center", "board/list.jsp");
		return mv;
	}

}
