package com.test.book;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Book;
import com.frame.SearchBiz;

public class selectname {

	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		SearchBiz biz = (SearchBiz)factory.getBean("bookbiz");
		
		ArrayList<Object> result= null;
		try {
			/*result = biz.getname("È«");*/
			result = biz.getwriter("ÀÌ");
			for(Object o : result){
				Book c = (Book) o;
				System.out.println(c);
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
