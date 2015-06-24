package com.test.book;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Book;
import com.frame.Biz;

public class update {
	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz)factory.getBean("bookbiz");
	
		Book book = new Book("E1","±¤¼ö»ý°¢111", "ÀÌ±¤¼ö","a.jpg","2Ãþ/3", 5, 3);
		
		
			try {
				biz.modify(book);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}

}
