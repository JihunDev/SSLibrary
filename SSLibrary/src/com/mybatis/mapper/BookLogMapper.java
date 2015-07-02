package com.mybatis.mapper;

import java.util.ArrayList;

public interface BookLogMapper {
	public ArrayList<Object> selectlogbooks();

	public ArrayList<Object> selectnamelogbooks(Object obj);

	public Object selectlogbook(Object obj);

	public ArrayList<Object> selectidlogbook(Object obj);

	public int insertlogbook(Object obj);

	public int deletelogbook(Object obj);

	public int updatelogbook(Object obj);
	
	public int updateQtlogbook(Object obj);

	public ArrayList<Object> selectuseridlogbooks(Object obj);
	
	

}
