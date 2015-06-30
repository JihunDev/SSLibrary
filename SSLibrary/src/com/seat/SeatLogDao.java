package com.seat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.SearchDao;
import com.frame.UpdateAndReturnDao;
import com.mybatis.mapper.SeatLogMapper;

@Repository("seatlogdao")
public class SeatLogDao implements Dao, UpdateAndReturnDao, SearchDao {

	@Autowired
	SeatLogMapper mapper;	
	
	@Override
	public Object insert(Object obj) throws Exception {
		int result = mapper.insertseatlog(obj);
		return result;
	}

	@Override
	public Object delete(Object obj) throws Exception {
		int result = mapper.deleteseatlog(obj);
		return result;
	}

	@Override
	public Object update(Object obj) throws Exception {
		return null;
	}

	@Override
	public Object select(Object obj) throws Exception {
		return null;
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		ArrayList<Object> result = mapper.selectseatlogs();
		return result;
	}

	@Override
	public Object logupdate(Object obj) throws Exception {
		Object result = mapper.updateseatlog_extend(obj);
		return result;
	}

	@Override
	public Object logreturn(Object obj) throws Exception {
		Object result = mapper.updateseatlog_return(obj);
		return result;
	}

	@Override
	public ArrayList<Object> searchid(Object obj) throws Exception {
		ArrayList<Object> result = mapper.selectseatlog(obj);		
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

	@Override
	public ArrayList<Object> searchexpired() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
