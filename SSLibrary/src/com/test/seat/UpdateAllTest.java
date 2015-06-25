package com.test.seat;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Seat;
import com.frame.Biz;

public class UpdateAllTest {

	public static void main(String[] args) {

		ApplicationContext factory = new ClassPathXmlApplicationContext(
				"spring.xml");
		Biz biz = (Biz) factory.getBean("seatbiz");

		try {
			System.out.println("biz.updateAll() : ");
			for (Object obj : biz.get()) {
				Seat s = (Seat) obj;
				biz.modify(new Seat(s.getId(), "y"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
