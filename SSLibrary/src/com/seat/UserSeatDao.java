package com.seat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mybatis.mapper.UserSeatMapper;

@Repository("userseatdao")
public class UserSeatDao implements Dao {

	@Autowired
	UserSeatMapper mapper;
	
	@Override
	public Object insert(Object obj) throws Exception {
		int result = mapper.insertuserseat(obj);
		return result;
	}

	@Override
	public Object delete(Object obj) throws Exception {
		int result = mapper.deleteuserseat(obj);
		return result;
	}

	@Override
	public Object update(Object obj) throws Exception {
		int result = mapper.updateuserseat(obj);
		return result;
	}

	@Override
	public Object select(Object obj) throws Exception {
		Object result = mapper.selectuserseat(obj);
		return result;
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		ArrayList <Object> result = mapper.selectuserseats();
		return result;
	}

}
