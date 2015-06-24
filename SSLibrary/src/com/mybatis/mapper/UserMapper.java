package com.mybatis.mapper;

import java.util.ArrayList;

public interface UserMapper {
	public int insertuser(Object obj);

	public int deleteuser(Object obj);

	public int updateuser(Object obj);

	public Object selectuser(Object obj);

	public ArrayList<Object> selectusers();
}
