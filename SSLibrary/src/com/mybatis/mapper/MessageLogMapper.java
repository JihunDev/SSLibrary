package com.mybatis.mapper;

import java.util.ArrayList;

public interface MessageLogMapper {
	public int insertmessagelog(Object obj);

	public int delectmessagelog(Object obj);

	public int updatemessagelog(Object obj);

	public Object selectmessagelog(Object obj);

	public ArrayList<Object> selectmessagelogs();
	
	public ArrayList<Object> selectidmessagelogs(Object obj);
}
