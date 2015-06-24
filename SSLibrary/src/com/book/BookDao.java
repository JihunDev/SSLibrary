package com.book;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.SearchDao;
import com.mybatis.mapper.BookMapper;
@Repository("bookdao")
public class BookDao implements Dao, SearchDao {
	@Autowired
	BookMapper mapper;
	
	@Override
	public Object insert(Object obj) throws Exception {
		return mapper.insertbook(obj);
	}

	@Override
	public Object delete(Object obj) throws Exception {
		return mapper.deletebook(obj);
	}

	@Override
	public Object update(Object obj) throws Exception {
		return mapper.updatebook(obj);
	}

	@Override
	public Object select(Object obj) throws Exception {
		return mapper.selectbook(obj);
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		return mapper.selectbooks();
	}

	@Override
	public ArrayList<Object> searchname(Object obj) throws Exception {
		return mapper.selectnamebooks(obj);
	}

	@Override
	public ArrayList<Object> searchwriter(Object obj) throws Exception {
		return mapper.selectwriterbooks(obj);
	}
	
	@Override
	public ArrayList<Object> searchtitle(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> searchcontent(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	



}
