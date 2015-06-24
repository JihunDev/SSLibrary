package com.entity;

public class UserSeat {
	private String u_id;
	private String s_id;
	private String start_time;
	private String end_time;
	private int renew_qt;
	
	public UserSeat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserSeat(String u_id, String s_id, String start_time,
			String end_time, int renew_qt) {
		super();
		this.u_id = u_id;
		this.s_id = s_id;
		this.start_time = start_time;
		this.end_time = end_time;
		this.renew_qt = renew_qt;
	}	
	// INSERT :  U_ID, S_ID
	public UserSeat(String u_id, String s_id) {
		super();
		this.u_id = u_id;
		this.s_id = s_id;
	}
	// SELECT, UPDATE  : U_ID
	public UserSeat(String u_id) {
		super();
		this.u_id = u_id;
	}	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getRenew_qt() {
		return renew_qt;
	}
	public void setRenew_qt(int renew_qt) {
		this.renew_qt = renew_qt;
	}
	@Override
	public String toString() {
		return "UserSeat [u_id=" + u_id + ", s_id=" + s_id + ", start_time="
				+ start_time + ", end_time=" + end_time + ", renew_qt="
				+ renew_qt + "]";
	}
	
	
	
}
