package com.test.messagelog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.frame.Biz;

public class Get {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("messagelogbiz");
		
		try {
			System.out.println(biz.get(21));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
