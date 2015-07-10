package com.seat;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.frame.Biz;
import com.frame.Dao;

@Service("seatbiz")
public class SeatBiz implements Biz {

	@Resource(name="seatdao")
	private Dao dao;
	
	@Override
	public Object register(Object obj) throws Exception {
		
		return null;
	}

	@Transactional
	@Override
	public Object modify(Object obj) throws Exception {
		Object result = dao.update(obj);
		return result;
	}

	@Override
	public Object remove(Object obj) throws Exception {
		//Object result = dao.delete(obj);
		return null;
	}

	@Override
	public Object get(Object obj) throws Exception {
		Object result = dao.select(obj);
		return result;
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		ArrayList<Object> result = dao.select();
		return result;
	}

}
