package com.test.userseat;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.UserSeat;
import com.frame.Biz;

public class SelectTest {
	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext(
				"spring.xml");
		Biz biz = (Biz) factory.getBean("userseatbiz");
		try {
			System.out
					.println("biz.get(new UserSeat('id04')) : " + biz.get(new UserSeat("id04")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			System.out.println("biz.get() : ");
			for (Object obj : biz.get()) {
				UserSeat s = (UserSeat) obj;
				System.out.println(s);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
