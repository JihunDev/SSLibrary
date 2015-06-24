package com.test.board;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Board;
import com.frame.Biz;

public class Modify {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("boardbiz");
		    
	      Board log = new Board(2, "안녕", "내용", "공지", "a.jpg");  
		try {
			biz.modify(log);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
