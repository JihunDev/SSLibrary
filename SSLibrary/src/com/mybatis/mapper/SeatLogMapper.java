package com.mybatis.mapper;

import java.util.ArrayList;

public interface SeatLogMapper {
	public int insertseatlog(Object obj);
	public int updateseatlog_return(Object obj);
	public int updateseatlog_extend(Object obj);
	public int deleteseatlog(Object obj);
	public ArrayList<Object> selectseatlog(Object obj);
	public ArrayList<Object> selectseatlogs();
}
