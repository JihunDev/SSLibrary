package com.book;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.frame.SearchBiz;
import com.frame.SearchDao;
import com.frame.UpdateAndReturnBiz;
import com.frame.UpdateAndReturnDao;
@Service("booklogbiz")
public class BookLogBiz implements Biz, SearchBiz, UpdateAndReturnBiz {
	@Resource(name="booklogdao")
	private Dao dao;
	@Resource(name="booklogdao")
	private SearchDao dao2;
	@Resource(name="booklogdao")
	private UpdateAndReturnDao dao3;
	@Override
	public Object register(Object obj) throws Exception {
		return dao.insert(obj);
	}

	@Override
	public Object modify(Object obj) throws Exception {
		return dao.update(obj);
	}

	@Override
	public Object remove(Object obj) throws Exception {
		return dao.delete(obj);
	}

	@Override
	public Object get(Object obj) throws Exception {
		return dao.select(obj);
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		return dao.select();
	}

	@Override
	public ArrayList<Object> getid(Object obj) throws Exception {
		return dao2.searchid(obj);
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
		return dao2.searchname(obj); //booklog에서 유저 아이디로 다 찾아오기
	}

	@Override
	public ArrayList<Object> getwriter(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object logupdate(Object obj) throws Exception {
		return dao3.logupdate(obj);
	}

	@Override
	public Object logreturn(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getexpired() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
