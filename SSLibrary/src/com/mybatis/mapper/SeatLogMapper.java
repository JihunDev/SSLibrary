package com.mybatis.mapper;

import java.util.ArrayList;

public interface SeatLogMapper {
	public int insertseatlog(Object obj);
	public int updateseatlog(Object obj);
	public int deleteseatlog(Object obj);
	public Object selectseatlog(Object obj);	
	public ArrayList<Object> selectseatlogs();
}
