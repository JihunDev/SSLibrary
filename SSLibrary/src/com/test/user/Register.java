package com.test.user;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.User;
import com.frame.Biz;

public class Register {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("userbiz");

		User user = new User("id06", "pwd06", "ÀÌ±¤¼ö", "010-000-0000", "a.jps", "em@mil.com", "n");
		
		try {
			biz.register(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
