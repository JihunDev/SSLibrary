package com.test.booklog;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.BookLog;
import com.frame.Biz;

public class selectall {

	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz)factory.getBean("booklogbiz");
		
		ArrayList<Object> result= null;
		try {
			result = biz.get();
			for(Object o : result){
				BookLog c = (BookLog) o;
				System.out.println(c);
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
