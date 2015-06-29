package com.frame;

import org.springframework.transaction.annotation.Transactional;


public interface UpdateAndReturnDao {

	@Transactional
	public Object logupdate(Object obj) throws Exception;

	@Transactional
	public Object logreturn(Object obj) throws Exception;
}
