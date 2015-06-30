package com.mybatis.mapper;

import java.util.ArrayList;

public interface UserSeatMapper {
	public int insertuserseat(Object obj);
	public int updateuserseat(Object obj);
	public int deleteuserseat(Object obj);
	public Object selectuserseat(Object obj);
	public ArrayList<Object> selectuserseats();
	
	public ArrayList<Object> selectuserseatbys_id(Object obj);	
	public ArrayList<Object> selectexpiredseat();	
}
