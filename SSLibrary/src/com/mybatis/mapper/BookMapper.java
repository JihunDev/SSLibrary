package com.mybatis.mapper;

import java.util.ArrayList;

public interface BookMapper {
	public ArrayList<Object> selectbooks();
	public ArrayList<Object> selectnamebooks(Object obj);
	public ArrayList<Object> selectwriterbooks(Object obj);
	public Object selectbook(Object obj);
	public int insertbook(Object obj);
	public int deletebook(Object obj);
	public int updatebook(Object obj);
	public int returnbook(Object obj);
	
	
}
