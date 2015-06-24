package com.seat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mybatis.mapper.SeatMapper;


@Repository("seatdao")
public class SeatDao implements Dao {
	
	@Autowired
	SeatMapper mapper;
	
	@Override
	public Object insert(Object obj) throws Exception {
		//int result = mapper.insertseat(obj);
		return null;
	}

	@Override
	public Object delete(Object obj) throws Exception {
		//int result = mapper.deleteseat(obj);
		return null;
	}

	@Override
	public Object update(Object obj) throws Exception {
		int result = mapper.updateseat(obj);
		return result;
	}

	@Override
	public Object select(Object obj) throws Exception {
		Object result = mapper.selectseat(obj);
		return result;
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		ArrayList <Object> result = mapper.selectseats();
		return result;
	}

}
