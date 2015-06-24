package com.mybatis.mapper;

import java.util.ArrayList;

public interface BoardMapper {
	public int insertboard(Object obj);

	public int delectboard(Object obj);

	public int updateboard(Object obj);

	public Object selectboard(Object obj);

	public ArrayList<Object> selectboards();
	
	public ArrayList<Object> selecttitleboards(Object obj);
	
	public ArrayList<Object> selectcontentboards(Object obj);
}
