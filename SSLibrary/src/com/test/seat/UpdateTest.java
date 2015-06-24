package com.test.seat;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Seat;
import com.frame.Biz;

public class UpdateTest {

	public static void main(String[] args) {

		ApplicationContext factory = new ClassPathXmlApplicationContext(
				"spring.xml");
		Biz biz = (Biz) factory.getBean("seatbiz");
		   try {
			   System.out.println("Before modify:"+biz.get(new Seat(1)));
		    	 System.out.println("biz.modify(new Seat(1, 'n')) : " + biz.modify(new Seat(1, "n")));
				   System.out.println("After modify:"+biz.get(new Seat(1)));
		    	 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
