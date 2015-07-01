package com.user;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.SearchDao;
import com.mybatis.mapper.UserMapper;
@Repository("userdao")
public class UserDao implements Dao, SearchDao {
	@Autowired
	UserMapper mapper;
	
	@Override
	public Object insert(Object obj) throws Exception {
		return mapper.insertuser(obj);
	}

	@Override
	public Object delete(Object obj) throws Exception {
		return mapper.deleteuser(obj);
	}

	@Override
	public Object update(Object obj) throws Exception {
		return mapper.updateuser(obj);
	}

	@Override
	public Object select(Object obj) throws Exception {
		return mapper.selectuser(obj);
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		return mapper.selectusers();
	}

	@Override
	public ArrayList<Object> searchid(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public ArrayList<Object> searchname(Object obj) throws Exception {
		return mapper.selectnameuser(obj);
	}

	@Override
	public ArrayList<Object> searchwriter(Object obj) throws Exception {
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
