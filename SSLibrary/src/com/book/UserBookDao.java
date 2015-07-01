package com.book;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.SearchDao;
import com.frame.UpdateAndReturnDao;
import com.mybatis.mapper.UserBookMapper;
@Repository("userbookdao")
public class UserBookDao implements Dao, SearchDao, UpdateAndReturnDao {
	@Autowired
	UserBookMapper mapper;
	@Override
	public Object insert(Object obj) throws Exception {
		return mapper.insertuserbook(obj);
	}

	@Override
	public Object delete(Object obj) throws Exception {
		return mapper.deleteuserbook(obj);
	}

	@Override
	public Object update(Object obj) throws Exception {
		return mapper.updateuserbook(obj);
	}

	@Override
	public Object select(Object obj) throws Exception {
		return mapper.selectuserbook(obj);
	}
	@Override
	public ArrayList<Object> select() throws Exception {
		return mapper.selectuserbooks();
	}

	@Override
	public ArrayList<Object> searchname(Object obj) throws Exception {
		return mapper.selectreturnuserbooks(obj); //반납이 y인 유저들의 정보 
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
	public ArrayList<Object> searchwriter(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> searchid(Object obj) throws Exception {
		return mapper.selectiduserbooks(obj);
		
	}

	@Override
	public Object logupdate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object logreturn(Object obj) throws Exception {
		return mapper.updatereturnuserbook(obj);
	}

	@Override
	public ArrayList<Object> searchexpired() throws Exception {
		return mapper.selectoverduebooks();
	}

	@Override
	public int getnum_reply(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
