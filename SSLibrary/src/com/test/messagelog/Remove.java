package com.test.messagelog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.MessageLog;
import com.frame.Biz;

public class Remove {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("messagelogbiz");
	      
	      MessageLog log = new MessageLog(6);
	      
	      try {
			biz.remove(log);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
