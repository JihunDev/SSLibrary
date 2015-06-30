package com.seat;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.frame.SearchBiz;
import com.frame.SearchDao;

@Service("userseatbiz")
public class UserSeatBiz implements Biz, SearchBiz{

	@Resource(name="userseatdao")
	private Dao dao;
	
	@Resource(name="userseatdao")
	private SearchDao s_dao;
	
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
		ArrayList<Object> result = s_dao.searchexpired();
		return result;
	}

	@Override
	public int getnum_reply(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
