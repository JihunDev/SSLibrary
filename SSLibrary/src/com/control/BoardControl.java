package com.control;

import java.io.FileInputStream;
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
public class BoardControl {

	@Resource(name = "boardbiz")
	Biz biz;
	@Resource(name = "boardbiz")
	SearchBiz boardsearchbiz;
	@Resource(name = "boardbiz")
	UpdateAndReturnBiz boardUpdateAndReturnBiz;

	@RequestMapping("/boardmain.do")
	public ModelAndView boardmain(BoardGetReplyNumCommand com) {
		ModelAndView mv = new ModelAndView("main");

		ArrayList<Object> list = new ArrayList<Object>();
		ArrayList<Object> return_list = new ArrayList<Object>();

		int count = 0;
		int reply_count = 0;
		try {
			list = boardsearchbiz.getid(com.getSort());
			for (Object obj1 : list) {
				Board b = (Board) obj1;						
				reply_count = boardsearchbiz.getnum_reply(b);
				BoardGetReplyNumCommand bcom = new BoardGetReplyNumCommand(b.getId(), b.getU_id(),
						b.getCounter(),b.getTitle(), b.getContent(), b.getReg_date(),
						b.getSort(), b.getFile_name(),
						b.getReg_number(), reply_count);
				return_list.add(bcom);
				reply_count =0;
				count++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("sortname", com.getSort());
		mv.addObject("boardlist", return_list);
		String list_count = String.valueOf(count);
		mv.addObject("boardlist_length", list_count);
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
			mv.setViewName("redirect:/boardmain.do?sort=" + com.getSort());
		} else {
			board = new Board(com.getU_id(), com.getContent(), com.getSort(),
					com.getReg_number());
			mv.setViewName("redirect:/boarddetail.do?id=" + com.getReg_number());
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
			boardUpdateAndReturnBiz.logupdate(board);// Ä«¿îÅÍ

			list = boardsearchbiz.getname(new Board(board2.getId(), board2
					.getSort()));// ¸®ÇÃºÒ·¯¿À±â

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
		

		if(board.getReg_number() == 0){ //°Ô½Ã±Û
			try {
				board2 = (Board) biz.get(board.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.addObject("boardupdate", board2);
			mv.addObject("center", "board/update.jsp");	
		}else{									//´ñ±Û
			mv.setViewName("redirect://boarddetail.do?id=" + board.getReg_number());			
		}
		
		return mv;
	}

	@RequestMapping("/boardmodifyimpl.do")
	public ModelAndView boardmodifyimpl(BoardUploadCommand com) {
		Board board =  null;
		ModelAndView mv = new ModelAndView();
		System.out.println(" com.getReg_number() : " + com.getReg_number());
		System.out.println("com.getU_id: " + com.getU_id());
		if(com.getReg_number() == 0){
		// °Ô½Ã±Û
			board = new Board(com.getId(), com.getTitle(), com.getContent(),	com.getSort(), com.getFile_name().getOriginalFilename());
//			mv.setViewName("redirect:/boardmain.do?sort=" + board.getSort());
			mv.setViewName("redirect:/boarddetail.do?id=" + com.getId());
		}else{
		//´ñ±Û
			board = new Board(com.getId(), com.getContent(), com.getSort());	
			System.out.println("´ñ±Û board: " + board);
			mv.setViewName("redirect:/boarddetail.do?id=" + com.getReg_number());				
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

	@RequestMapping("/boardremoveimpl.do")
	public ModelAndView boardremoveimpl(Board board) {
		ModelAndView mv = new ModelAndView();
		Board delete_board = null;
		
		try {
			delete_board = new Board(board.getId(), board.getReg_number());
			System.out.println(delete_board);
			biz.remove(delete_board);
			if(board.getReg_number() == 0){ 
			//°Ô½Ã±Û
				mv.setViewName("redirect:/boardmain.do?sort=" + board.getSort());			
			}else{
			//´ñ±Û
				mv.setViewName("redirect:/boarddetail.do?id=" + board.getReg_number());			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

}
