package com.test.seatlog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.SeatLog;
import com.frame.Biz;

public class UpdateTest {

	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz) factory.getBean("seatlogbiz");
		try {
			System.out.println("biz.modify(new SeatLog('id03')) : " + biz.modify(new SeatLog("id03")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
