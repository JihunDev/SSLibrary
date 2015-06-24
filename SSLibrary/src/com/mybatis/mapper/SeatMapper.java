package com.mybatis.mapper;

import java.util.ArrayList;

public interface SeatMapper {
	public int insertseat(Object obj);
	public int updateseat(Object obj);
	public int deleteseat(Object obj);
	public Object selectseat(Object obj);	
	public ArrayList<Object> selectseats();
}
