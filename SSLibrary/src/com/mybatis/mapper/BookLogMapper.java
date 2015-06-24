package com.mybatis.mapper;

import java.util.ArrayList;

public interface BookLogMapper {
	public ArrayList<Object> selectlogbooks();
	public ArrayList<Object> selectnamelogbooks();
	public Object selectlogbook(Object obj);
	public int insertlogbook(Object obj);
	public int deletelogbook(Object obj);
	public int updatelogbook(Object obj);
	
	
}
