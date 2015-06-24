package com.test.booklog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.BookLog;
import com.frame.Biz;

public class update {
	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz)factory.getBean("booklogbiz");
	
		BookLog book = new BookLog(4,"E1","id01", 1);
		
		
			try {
				biz.modify(book);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}

}
