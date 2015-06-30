package com.frame;

import java.util.ArrayList;

public interface SearchDao {
	
//	userbook(u_id), board(u_id), userseat(s_id), seatlog(u_id)
	public ArrayList<Object> searchid(Object obj) throws Exception;
	
//	board
	public ArrayList<Object> searchtitle(Object obj) throws Exception;
	public ArrayList<Object> searchcontent(Object obj) throws Exception;
	
//	book, user
	public ArrayList<Object> searchname(Object obj) throws Exception;
	
//	book
	public ArrayList<Object> searchwriter(Object obj) throws Exception;

	// userbook, userseat
	public ArrayList<Object> searchexpired() throws Exception;

}
