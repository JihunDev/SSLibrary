package com.frame;

import java.util.ArrayList;

public interface SearchBiz {
//	userbook(u_id), board(u_id)
	public ArrayList<Object> getid(Object obj) throws Exception;
	
//	board
	public ArrayList<Object> gettitle(Object obj) throws Exception;
	public ArrayList<Object> getcontent(Object obj) throws Exception;
	
//	book, user
	public ArrayList<Object> getname(Object obj) throws Exception;
	
//	book
	public ArrayList<Object> getwriter(Object obj) throws Exception;
	
	// userbook, userseat
	public ArrayList<Object> getexpired() throws Exception;

	public int getnum_reply(Object obj) throws Exception;

}
