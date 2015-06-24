package com.test.seatlog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.SeatLog;
import com.frame.Biz;

public class SelectTest {

	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz) factory.getBean("seatlogbiz");
		
		try {
			System.out	.println("biz.get(new SeatLog('id03')) : " + biz.get(new SeatLog("id03")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			System.out.println("biz.get() : ");
			for (Object obj : biz.get()) {
				SeatLog s = (SeatLog) obj;
				System.out.println(s);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
