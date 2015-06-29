package com.seat;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.frame.UpdateAndReturnBiz;
import com.frame.UpdateAndReturnDao;

@Service("seatlogbiz")
public class SeatLogBiz implements Biz, UpdateAndReturnBiz {

	@Resource(name="seatlogdao")
	private Dao dao;
	
	@Resource(name="seatlogdao")
	private UpdateAndReturnDao ur_dao;

	
	@Override
	public Object register(Object obj) throws Exception {
		Object result = dao.insert(obj);
		return result;
	}

	@Override
	public Object modify(Object obj) throws Exception {
		
		return null;
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

	@Override
	public Object logupdate(Object obj) throws Exception {
		Object result = ur_dao.logupdate(obj);
		return result;
	}

	@Override
	public Object logreturn(Object obj) throws Exception {
		Object result = ur_dao.logreturn(obj);
		return result;
	}

}
