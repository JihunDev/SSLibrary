package com.test.board;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.frame.Biz;

public class Get {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("boardbiz");
		
		try {
			System.out.println(biz.get(2));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
