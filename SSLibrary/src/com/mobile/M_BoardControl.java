package com.mobile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

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
public class M_BoardControl {
	@Resource(name = "boardbiz")
	Biz biz;
	@Resource(name = "boardbiz")
	SearchBiz boardsearchbiz;
	@Resource(name = "boardbiz")
	UpdateAndReturnBiz boardUpdateAndReturnBiz;

	@RequestMapping("/m_boardmain.do")
	public ModelAndView m_boardmain(BoardGetReplyNumCommand com) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> return_list = new ArrayList<Object>();
		int count = 0;
		int reply_count = 0;
		try {
			list = boardsearchbiz.getid(com.getSort());
			for (Object obj1 : list) {
				Board b = (Board) obj1;
				reply_count = boardsearchbiz.getnum_reply(b);
				BoardGetReplyNumCommand bcom = new BoardGetReplyNumCommand(
						b.getId(), b.getU_id(), b.getCounter(), b.getTitle(),
						b.getContent(), b.getReg_date(), b.getSort(),
						b.getFile_name(), b.getReg_number(), reply_count);
				return_list.add(bcom);
				reply_count = 0;
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("sortname", com.getSort());
		mv.addObject("boardlist", return_list);

		String list_count = String.valueOf(count);
		mv.addObject("boardlist_length", list_count);
		mv.addObject("m_center", "board/m_list.jsp");
		return mv;
	}

	@RequestMapping("/m_boardwrite.do")
	public ModelAndView m_boardwrite(String sort) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		mv.addObject("sort", sort);
		mv.addObject("m_center", "board/m_register.jsp");
		return mv;
	}

	@RequestMapping("/m_boardwriteimpl.do")
	public ModelAndView m_boardwriteimpl(BoardUploadCommand com) {
		ModelAndView mv = new ModelAndView();
		Board board = null;
		if (com.getReg_number() == 0) {
			board = new Board(com.getU_id(), com.getTitle(), com.getContent(),
					com.getSort(), com.getFile_name().getOriginalFilename(),
					com.getReg_number());
			mv.setViewName("redirect:/m_boardmain.do?sort=" + com.getSort());
		} else {
			board = new Board(com.getU_id(), com.getContent(), com.getSort(),
					com.getReg_number());
			mv.setViewName("redirect:/m_boarddetail.do?id="
					+ com.getReg_number());
		}

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
					FileOutputStream out = new FileOutputStream(dir
							+ file.getOriginalFilename());
					out.write(data);
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return mv;
	}

	@RequestMapping("/m_boarddetail.do")
	public ModelAndView m_boarddetail(int id) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
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
		mv.addObject("boardreply", list);
		mv.addObject("boarddetail", board2);
		mv.addObject("m_center", "board/m_detail.jsp");

		return mv;
	}

	@RequestMapping("/m_boardmodify.do")
	public ModelAndView m_boardmodify(Board board) {
		ModelAndView mv = new ModelAndView("mobile/m_main");
		Board board2 = null;

		if (board.getReg_number() == 0) { // 게시글
			try {
				board2 = (Board) biz.get(board.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}

			mv.addObject("boardupdate", board2);
			mv.addObject("m_center", "board/m_update.jsp");
		} else { // 댓글
			mv.setViewName("redirect:/m_boarddetail.do?id="
					+ board.getReg_number());
		}
		return mv;
	}

	@RequestMapping("/m_boardmodifyimpl.do")
	public ModelAndView m_boardmodifyimpl(BoardUploadCommand com) {
		ModelAndView mv = new ModelAndView();
		Board board = null;
		
		System.out.println(com);
		if (com.getReg_number() == 0) {
			board = new Board(com.getId(), com.getTitle(), com.getContent(),
					com.getSort(), com.getFile_name().getOriginalFilename());

			mv.setViewName("redirect:/m_boarddetail.do?id=" + com.getId());
		} else {
			board = new Board(com.getId(), com.getContent(), com.getSort());
			
			mv.setViewName("redirect:/m_boarddetail.do?id="
					+ com.getReg_number());
		}

		try {
			biz.modify(board);
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
					FileOutputStream out = new FileOutputStream(dir
							+ file.getOriginalFilename());
					out.write(data);
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return mv;
	}

	@RequestMapping("/m_boardremoveimpl.do")
	public ModelAndView m_boardremoveimpl(Board board) {
		ModelAndView mv = new ModelAndView();
		Board delete_board = null;
		System.out.println(board);
		try {
			delete_board = new Board(board.getId(), board.getReg_number());
			biz.remove(delete_board);
			if (board.getReg_number() == 0) {
				mv.setViewName("redirect:/m_boardmain.do?sort="
						+ board.getSort());
			} else {
				mv.setViewName("redirect:/m_boarddetail.do?id="
						+ board.getReg_number());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
