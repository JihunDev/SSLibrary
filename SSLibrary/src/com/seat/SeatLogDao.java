package com.seat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mybatis.mapper.SeatLogMapper;

@Repository("seatlogdao")
public class SeatLogDao implements Dao {

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
		int result = mapper.updateseatlog(obj);
		return result;
	}

	@Override
	public Object select(Object obj) throws Exception {
		Object result = mapper.selectseatlog(obj);
		return result;
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		ArrayList<Object> result = mapper.selectseatlogs();
		return result;
	}

}
