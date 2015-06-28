package com.frame;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

public interface Biz {
	@Transactional
	public Object register(Object obj) throws Exception;
	@Transactional
	public Object modify(Object obj) throws Exception;
	@Transactional
	public Object remove(Object obj) throws Exception;
	public Object get(Object obj) throws Exception;
	public ArrayList<Object> get() throws Exception;
}
