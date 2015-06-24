package com.frame;

import java.util.ArrayList;

public interface SearchDao {
	public ArrayList<Object> searchname(Object obj) throws Exception;
	public ArrayList<Object> searchtitle(Object obj) throws Exception;
	public ArrayList<Object> searchcontent(Object obj) throws Exception;
	public ArrayList<Object> searchwriter(Object obj) throws Exception;

}
