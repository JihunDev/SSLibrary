package com.seat;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;

@Service("seatlogbiz")
public class SeatLogBiz implements Biz {

	@Resource(name="seatlogdao")
	private Dao dao;

	@Override
	public Object register(Object obj) throws Exception {
		Object result = dao.insert(obj);
		return result;
	}

	@Override
	public Object modify(Object obj) throws Exception {
		Object result = dao.update(obj);
		return result;
	}

	@Override
	public Object remove(Object obj) throws Exception {
		Object result = dao.delete(obj);
		return result;
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
