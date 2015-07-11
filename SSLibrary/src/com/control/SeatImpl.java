package com.control;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.entity.User;
import com.entity.UserSeat;
import com.frame.Biz;

@SuppressWarnings({ "unchecked" })
@Service("seatimpl")
public class SeatImpl {
	@Resource(name = "userbiz")
	Biz user_biz;
	
	@Resource(name = "userseatbiz")
	Biz ubiz;
	
	public JSONObject getSetUserInfo(String u_id){
		JSONObject result = null;
		try {
				
				User user = (User) user_biz.get(u_id);
				UserSeat userseat = (UserSeat) ubiz.get(u_id); 
				result = new JSONObject();
				result.put("s_id", userseat.getS_id());
				result.put("u_id", userseat.getU_id());
				result.put("pwd", user.getPwd());
				result.put("name", user.getName());
				result.put("phone", user.getPhone());
				result.put("img", user.getImg());
				result.put("email", user.getEmail());
				result.put("start_time", userseat.getStart_time());
				result.put("end_time", userseat.getEnd_time());
				result.put("renew_qt", userseat.getRenew_qt());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return result;		
	}
}
