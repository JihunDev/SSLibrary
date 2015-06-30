package com.seat;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.frame.SearchBiz;
import com.frame.SearchDao;
import com.frame.UpdateAndReturnBiz;
import com.frame.UpdateAndReturnDao;

@Service("seatlogbiz")
public class SeatLogBiz implements Biz, UpdateAndReturnBiz, SearchBiz {

	@Resource(name="seatlogdao")
	private Dao dao;
	
	@Resource(name="seatlogdao")
	private SearchDao s_dao;
	
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
		return null;
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

	@Override
	public ArrayList<Object> getid(Object obj) throws Exception {
		ArrayList<Object> result = s_dao.searchid(obj);
		return result;
	}

	@Override
	public ArrayList<Object> gettitle(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getcontent(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getname(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getwriter(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getexpired() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getnum_reply(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
