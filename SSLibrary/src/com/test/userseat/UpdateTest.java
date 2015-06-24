package com.test.userseat;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.UserSeat;
import com.frame.Biz;

public class UpdateTest {
	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext(
				"spring.xml");
		Biz biz = (Biz) factory.getBean("userseatbiz");
		
		try {
			System.out.println("biz.modify(new UserSeat('id03')) : " + biz.modify(new UserSeat("id03")));
			System.out	.println("biz.get(new UserSeat('id03')) : " + biz.get(new UserSeat("id03")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
