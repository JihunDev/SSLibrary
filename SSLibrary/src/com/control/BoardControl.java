package com.control;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.frame.Biz;

@Controller
public class BoardControl {
	
	@Resource(name="boardbiz")
	Biz biz;
	
	
}
