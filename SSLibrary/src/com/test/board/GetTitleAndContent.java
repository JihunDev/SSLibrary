package com.test.board;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Board;
import com.frame.SearchBiz;

public class GetTitleAndContent {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      SearchBiz biz = (SearchBiz)factory.getBean("boardbiz");
		
		ArrayList<Object> result= null;
		try {
		//	result = biz.gettitle("╬хЁГ");
			result = biz.getcontent("го");
			for(Object o : result){
				Board c = (Board) o;
				System.out.println(c);
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
	}

}
