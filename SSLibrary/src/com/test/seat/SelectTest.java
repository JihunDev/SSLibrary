package com.test.seat;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Seat;
import com.frame.Biz;

public class SelectTest {

	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext(
				"spring.xml");
		Biz biz = (Biz) factory.getBean("seatbiz");
		try {
			System.out
					.println("biz.get(new Seat(2)) : " + biz.get(new Seat(2)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			System.out.println("biz.get() : ");
			for (Object obj : biz.get()) {
				Seat s = (Seat) obj;
				System.out.println(s);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
