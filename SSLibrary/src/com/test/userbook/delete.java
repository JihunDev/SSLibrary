package com.test.userbook;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.UserBook;
import com.frame.Biz;

public class delete {

	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz)factory.getBean("userbookbiz");
		
		UserBook book = new UserBook("id03","i5");
		
		try {
			biz.remove(book);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
