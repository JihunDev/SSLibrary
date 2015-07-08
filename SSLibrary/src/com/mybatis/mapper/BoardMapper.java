package com.mybatis.mapper;

import java.util.ArrayList;

public interface BoardMapper {
	public int insertboard(Object obj);

	public int deleteboard(Object obj);

	public int updateboard(Object obj);

	public Object selectboard(Object obj);

	public ArrayList<Object> selectboards();

//	public ArrayList<Object> selecttitleboards(Object obj);
	
	public ArrayList<Object> selectsearchboards(Object obj);
	

//	public ArrayList<Object> selectcontentboards(Object obj);

	public ArrayList<Object> selectidboards(Object obj);

	// 리플 불러오는 용으로 사용 
	public ArrayList<Object> selectreplyboards(Object obj);

	public int selectreplynums(Object obj);

	public int updatecounterboard(Object obj);
}
