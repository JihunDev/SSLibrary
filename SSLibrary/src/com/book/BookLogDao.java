package com.book;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.SearchDao;
import com.frame.UpdateAndReturnDao;
import com.mybatis.mapper.BookLogMapper;
@Repository("booklogdao")
public class BookLogDao implements Dao, SearchDao, UpdateAndReturnDao {
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

	@Override
	public ArrayList<Object> searchid(Object obj) throws Exception {
		return mapper.selectidlogbook(obj);
	}

	@Override
	public ArrayList<Object> searchtitle(Object obj) throws Exception {
		return mapper.selectbookidlogbooks(obj);
	}

	@Override
	public ArrayList<Object> searchcontent(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> searchname(Object obj) throws Exception {
		return mapper.selectuseridlogbooks(obj); //booklog에서 유저 아이디로 다 찾아오기
	}

	@Override
	public ArrayList<Object> searchwriter(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object logupdate(Object obj) throws Exception {
		return mapper.updateQtlogbook(obj);
	}

	@Override
	public Object logreturn(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> searchexpired() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getnum_reply(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}
