package com.mybatis.mapper;

import java.util.ArrayList;

public interface UserBookMapper {
	public ArrayList<Object> selectuserbooks();
	public Object selectuserbook(Object obj);
	public int insertuserbook(Object obj);
	public int deleteuserbook(Object obj);
	public int updateuserbook(Object obj);
	public ArrayList<Object> selectiduserbooks(Object obj);
	public int updatereturnuserbook(Object obj);
	public ArrayList<Object> selectreturnuserbooks(Object obj); //반납이 y인 유저들의 정보
	public ArrayList<Object> selectoverduebooks(); //연체된 사람들 정지회원으로 만들기
	
	
}
