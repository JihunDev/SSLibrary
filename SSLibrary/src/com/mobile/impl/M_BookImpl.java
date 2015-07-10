package com.mobile.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.BookLog;
import com.entity.User;
import com.entity.UserBook;
import com.frame.Biz;

@Service("bookimpl")
public class M_BookImpl {
	@Resource(name = "bookbiz")
	Biz bookbiz;
	@Resource(name = "userbookbiz")
	Biz userbookbiz;
	@Resource(name = "booklogbiz")
	Biz booklogbiz;
	
	@Transactional
	public void tr_m_userbookregister(String id, Object upbooknew, User user) {
		
		try {
			bookbiz.modify(upbooknew);
			UserBook book = new UserBook(user.getId(), id);
			
			userbookbiz.register(book); // userbook에 등록
			System.out.println("userbook 등록 : " + book);

			BookLog logbook = new BookLog(id, user.getId()); // booklog에 등록
			booklogbiz.register(logbook);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
