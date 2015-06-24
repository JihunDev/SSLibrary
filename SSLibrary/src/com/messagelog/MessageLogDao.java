package com.messagelog;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mybatis.mapper.MessageLogMapper;
@Repository("messagelogdao")
public class MessageLogDao implements Dao {
	
	@Autowired
	MessageLogMapper mapper;
	
	@Override
	public Object insert(Object obj) throws Exception {
		return mapper.insertmessagelog(obj);
	}

	@Override
	public Object delete(Object obj) throws Exception {
		return mapper.delectmessagelog(obj);
	}

	@Override
	public Object update(Object obj) throws Exception {
		return mapper.updatemessagelog(obj);
	}

	@Override
	public Object select(Object obj) throws Exception {
		return mapper.selectmessagelog(obj);
	}

	@Override
	public ArrayList<Object> select() throws Exception {
		return mapper.selectmessagelogs();
	}

}
