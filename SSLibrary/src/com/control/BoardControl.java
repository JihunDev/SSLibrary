package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.BoardCommand;
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
	public ModelAndView boardmain(String sort) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println("sort main : " + sort);
		ArrayList<Object> list = new ArrayList<Object>();
		int count = 0;
		try {
			list = boardsearchbiz.getid(sort);
			for (Object obj : list) {
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("sortname", sort);
		mv.addObject("boardlist", list);
		String list_count =  String.valueOf(count);
		System.out.println("list_count:"+list_count);
		mv.addObject("boardlist_length",	 list_count);
		mv.addObject("center", "board/list.jsp");
		return mv;
	}

	@RequestMapping("/boardwrite.do")
	public ModelAndView boardwrite() {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("center", "board/register.jsp");
		return mv;
	}

	@RequestMapping("/boardwriteimpl.do")
	public String boardwriteimpl(BoardCommand com) {

		System.out.println(com);

		Board board = new Board(com.getU_id(), com.getTitle(),
				com.getContent(), com.getSort(), com.getFile_name()
						.getOriginalFilename(), com.getReg_number());

		System.out.println("command : " + board);
		try {
			biz.register(board);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

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
		return "boardmain.do?sort=" + com.getSort();
	}

	@RequestMapping("/boarddetail.do")
	public ModelAndView boarddetail(int id) {
		ModelAndView mv = new ModelAndView("main");
		
		ArrayList<Object> list = new ArrayList<Object>();
		Board board = new Board(id);
		Board board2 = null;
		
		try {
			board2 = (Board) biz.get(board);
			boardUpdateAndReturnBiz.logupdate(board);//카운터
			
			list = boardsearchbiz.getname(new Board(board2.getId(),board2.getSort()));//리플불러오기
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("id : "+id);
		System.out.println("list : "+list);
		mv.addObject("boardreply", list);
		mv.addObject("boarddetail", board2);
		mv.addObject("center", "board/detail.jsp");
		
		
		return mv;
	}

	@RequestMapping("/boardmodify.do")
	public ModelAndView boardmodify(Board board) {
		ModelAndView mv = new ModelAndView("main");
		Board board2 = null;
		try {
			board2 = (Board) biz.get(board.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("boardupdate", board2);
		mv.addObject("center", "board/update.jsp");
		return mv;
	}

	@RequestMapping("/boardmodifyimpl.do")
	public ModelAndView boardmodifyimpl(BoardCommand com) {
		Board board = new Board(com.getId(), com.getTitle(), com.getContent(),
				com.getSort(), com.getFile_name().getOriginalFilename());

		try {
			biz.modify(board);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

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
		ModelAndView mv = new ModelAndView("redirect:/boardmain.do?sort="
				+ board.getSort());
		return mv;
	}

	@RequestMapping("/boardremoveimpl.do")
	public ModelAndView boardremoveimpl(Board board) {
		String re = board.getSort();
		System.out.println("sort re : " + re);
		try {
			biz.remove(board.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("redirect:/boardmain.do?sort="
				+ board.getSort());
		return mv;
	}

	@RequestMapping("/boardreplyregister.do")
	public ModelAndView boardreplyregister(Board board) {
		Board board2 = new Board(board.getU_id(), board.getContent(),
				board.getSort(), board.getReg_number());
		try {
			biz.register(board2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("redirect:/boarddetail.do?id="
				+ board2.getReg_number());
		return mv;
	}


}
