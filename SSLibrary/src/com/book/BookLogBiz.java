package com.book;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
@Service("booklogbiz")
public class BookLogBiz implements Biz {
	@Resource(name="booklogdao")
	private Dao dao;
	
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

}
