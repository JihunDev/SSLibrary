package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.command.BoardCommand;
import com.entity.Board;
import com.frame.Biz;
import com.frame.SearchBiz;

@Controller
public class BoardControl {

	@Resource(name = "boardbiz")
	Biz biz;
	@Resource(name = "boardbiz")
	SearchBiz boardsearchbiz;

	@RequestMapping("/boardmain.do")
	public ModelAndView boardmain(String sort) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println("sort main : " + sort);
		ArrayList<Object> list = new ArrayList<Object>();
		try {
			list = boardsearchbiz.getid(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("sortname", sort);
		mv.addObject("boardlist", list);
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
				com.getContent(), com.getSort(), com.getFile_name().getOriginalFilename(),
				com.getReg_number());
		
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
		return "boardmain.do?sort="+com.getSort();
	}

	@RequestMapping("/boarddetail.do")
	public ModelAndView boarddetail(int id) {
		ModelAndView mv = new ModelAndView("main");
		Board board = new Board(id);
		Board board2 = null;
		try {
			board2 = (Board) biz.get(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("boarddetail", board2);
		mv.addObject("center", "board/detail.jsp");
		
		return mv;
	}

	@RequestMapping("/boardmodify.do")
	public ModelAndView boardmodify(Board board) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println(board);
		Board board2 = null;
		try {
			board2 = (Board) biz.get(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("boardupdate", board2);
		mv.addObject("center", "board/update.jsp");
		return mv;
	}

	@RequestMapping("/boardmodifyimpl.do")
	public String boardmodifyimpl(BoardCommand com) {
		System.out.println("modifyimpl "+com);
		
		Board board = new Board(com.getU_id(), com.getTitle(),
				com.getContent(), com.getSort(), com.getFile_name().getOriginalFilename(),
				com.getReg_number());
		
		System.out.println("command : " + board);
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
		return "boardmain.do?sort="+com.getSort();
	}

	@RequestMapping("/boardremoveimpl.do")
	public ModelAndView boardremoveimpl(Board board) {
		String re = board.getSort();
		System.out.println("sort re : "+re);
		try {
			biz.remove(board.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("redirect:/boardmain.do?sort="+board.getSort());   
	    
		return mv;
	}
}
