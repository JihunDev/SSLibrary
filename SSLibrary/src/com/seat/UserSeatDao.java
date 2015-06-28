package com.seat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.SearchDao;
import com.mybatis.mapper.UserSeatMapper;

@Repository("userseatdao")
public class UserSeatDao implements Dao, SearchDao{

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
	
	//Search by s_id
	@Override
	public ArrayList<Object> searchid(Object obj) throws Exception {
		ArrayList<Object> result = mapper.selectuserseatbys_id(obj);
		return result;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> searchwriter(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
