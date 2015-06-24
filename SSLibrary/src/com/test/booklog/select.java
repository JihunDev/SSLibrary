package com.test.booklog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.BookLog;
import com.frame.Biz;

public class select {

	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz)factory.getBean("booklogbiz");
		
		
		BookLog book = new BookLog(2);
		
		try {
			System.out.println(biz.get(book));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
