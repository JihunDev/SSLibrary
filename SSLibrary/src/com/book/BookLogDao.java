package com.book;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mybatis.mapper.BookLogMapper;
@Repository("booklogdao")
public class BookLogDao implements Dao {
	@Autowired
	BookLogMapper mapper;
	
	@Override
	public Object insert(Object obj) throws Exception {
		return mapper.insertlogbook(obj);
	}

	@Override
	public Object delete(Object obj) throws Exception {
		return mapper.deletelogbook(obj);
	}

	@Override
	public Object update(Object obj) throws Exception {
		return mapper.updatelogbook(obj);
	}

	@Override
	public Object select(Object obj) throws Exception {
		return mapper.selectlogbook(obj);
	}


	@Override
	public ArrayList<Object> select() throws Exception {
		return mapper.selectlogbooks();
	}

}
