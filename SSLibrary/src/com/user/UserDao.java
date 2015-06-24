package com.user;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mybatis.mapper.UserMapper;
@Repository("userdao")
public class UserDao implements Dao {
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


}
