package com.frame;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

public interface Dao {
	@Transactional
	public Object insert(Object obj) throws Exception;
	@Transactional
	public Object delete(Object obj) throws Exception;
	@Transactional
	public Object update(Object obj) throws Exception;
	public Object select(Object obj) throws Exception;
	public ArrayList<Object> select() throws Exception;
}
