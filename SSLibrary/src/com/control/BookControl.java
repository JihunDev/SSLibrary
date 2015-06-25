package com.control;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.frame.Biz;
import com.frame.SearchBiz;
import com.util.Nav;

@Controller
public class BookControl {
	@Resource(name="bookbiz")
	Biz biz;
	@Resource(name="bookbiz")
	SearchBiz biz2;
	
	@RequestMapping("/bookmain.do")
	public ModelAndView bookmain(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		ArrayList<Object> list = null;
		try {
			list= biz.get();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("booklist",list);
		mv.addObject("nav", Nav.book);
		mv.addObject("left", "left.jsp");
		mv.addObject("center", "book/booksearch.jsp");
		return mv; 
	}
	
	/*@ResponseBody //ajax용 booklist 불러오는것
	@RequestMapping("/booklist.do")
	public ResponseEntity<String> booklist() throws Exception{
		ResponseEntity<String> returnData = null;
		
		HttpHeaders header = new HttpHeaders(); 
		header.add("Content-type", "application/json;charset=EUC-KR");
		ArrayList<Object> list = new ArrayList<Object>();
		list = biz.get();
		
		JSONArray ja = new JSONArray();
		for(Object obj:list){
			Book book = (Book)obj;
			JSONObject jo = new JSONObject();
			jo.put("id", book.getId());
			jo.put("name", book.getName());
			jo.put("writer", book.getWriter());
			jo.put("img", book.getImg());
			jo.put("floor", book.getFloor());
			jo.put("total_qt", book.getTotal_qt());
			jo.put("current_qt", book.getCurrent_qt());
			jo.put("reg_date", book.getReg_date());
			
			ja.add(jo);
		}
		returnData = new ResponseEntity<String>(
				ja.toJSONString(),
				header,
				HttpStatus.CREATED //강제로 결과를 만들어 넣어주는것
				);
		return returnData;
	}*/
	
	@ResponseBody
	@RequestMapping("/booksearch.do")
	public ResponseEntity<String> booksearch(String issearch, String category,String search){
		ResponseEntity<String> returnData = null;
		
		HttpHeaders header = new HttpHeaders(); 
		header.add("Content-type", "application/json;charset=EUC-KR");
		
		ArrayList<Object> list = null;
		ArrayList<Object> resultlist = new ArrayList<Object>();
		
		System.out.println(issearch);
		System.out.println(category);
		System.out.println(search);

		if(issearch.equals("name")){
			try {
				list = biz2.getname(search);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(issearch.equals("writer")){
				try {
					list = biz2.getwriter(search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}else{
			try {
				list.add(biz2.getname(search));
				list.add(biz2.getwriter(search));	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(list);
		
		switch(category){
		case "i":
			for (Object o : list) {
				Book b = (Book) o;
				if(b.getId().substring(0,1).equals("i")){
					System.out.println(b);
					resultlist.add(o);
					System.out.println(resultlist);
				}
			}
			break;
		case "n": 
			for (Object o : list) {
				Book b = (Book) o;
				if(b.getId().substring(0,1).equals("n")){
					resultlist.add(o);
				}
			}
			break;
		case "m": 
			for (Object o : list) {
				Book b = (Book) o;
				if(b.getId().substring(0,1).equals("m")){
					resultlist.add(o);
				}
			}
			break;
		default : 
			for (Object o : list) {
				Book b = (Book) o;
				resultlist.add(o);
			}
			break;
		}
		
		System.out.println("resultlist = "+resultlist);
		
		/*Collections.sort(resultlist, new IDCompare<Object>());	*/
		
		JSONArray ja = new JSONArray();
		for(Object obj:resultlist){
			Book book = (Book)obj;
			JSONObject jo = new JSONObject();
			jo.put("id", book.getId());
			jo.put("name", book.getName());
			jo.put("writer", book.getWriter());
			jo.put("img", book.getImg());
			jo.put("floor", book.getFloor());
			jo.put("total_qt", book.getTotal_qt());
			jo.put("current_qt", book.getCurrent_qt());
			jo.put("reg_date", book.getReg_date());
			
			ja.add(jo);
		}
		returnData = new ResponseEntity<String>(
				ja.toJSONString(),
				header,
				HttpStatus.CREATED //강제로 결과를 만들어 넣어주는것
				);
		return returnData;
	}
	
	
/*	static class IDCompare<Object> implements Comparator<Object>{

		@Override
		public int compare(Object o1, Object o2) {
			Book b1 = (Book) o1;
			Book b2 = (Book) o2;
			return b1.getId().compareTo(b2.getId());
		}
		
		
	}*/

}



