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
import com.util.Nav;

@Controller
public class BoardControl {

	@Resource(name = "boardbiz")
	Biz biz;
	@Resource(name = "boardbiz")
	SearchBiz boardsearchbiz;

	@RequestMapping("/boardmain.do")
	public ModelAndView boardmain(String sort) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println("sort : " + sort);
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
	public ModelAndView boardwriteimpl(BoardCommand com) {
		ModelAndView mv = new ModelAndView("main");
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
		mv.addObject("nav", Nav.register);
		mv.addObject("center", "board/list.jsp");
		return mv;
	}

	@RequestMapping("/boarddetail.do.do")
	public ModelAndView boarddetail(HttpServletRequest request) {

		return null;
	}

	@RequestMapping("/boardmodify.do")
	public ModelAndView boardmodify(HttpServletRequest request) {

		return null;
	}

	@RequestMapping("/boardmodifyimpl.do")
	public ModelAndView boardmodifyimpl(HttpServletRequest request) {

		return null;
	}

	@RequestMapping("/boardremoveimpl.do")
	public ModelAndView boardremoveimpl(HttpServletRequest request) {

		return null;
	}

}
