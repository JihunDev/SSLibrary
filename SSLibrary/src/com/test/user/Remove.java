package com.test.user;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.User;
import com.frame.Biz;

public class Remove {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("userbiz");
	      
	      User user = new User("id06");
	      
	      try {
			biz.remove(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
