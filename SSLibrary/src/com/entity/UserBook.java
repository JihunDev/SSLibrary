package com.entity;

public class UserBook {
	private String u_id;
	private String b_id;
	private String start_date;
	private String end_date;
	private int renew_qt;
	private String isreturn;
	
	public UserBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public UserBook(String u_id) {
		this.u_id = u_id;
	}


	public UserBook(String u_id, String b_id) {
		this.u_id = u_id;
		this.b_id = b_id;
	}
	
	

	public UserBook(String u_id, String b_id, String start_date,
			String end_date, int renew_qt) {
		this.u_id = u_id;
		this.b_id = b_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.renew_qt = renew_qt;
	}

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getRenew_qt() {
		return renew_qt;
	}
	public void setRenew_qt(int renew_qt) {
		this.renew_qt = renew_qt;
	}
	

	public String getIsreturn() {
		return isreturn;
	}



	public void setIsreturn(String isreturn) {
		this.isreturn = isreturn;
	}



	@Override
	public String toString() {
		return "UserBook [u_id=" + u_id + ", b_id=" + b_id + ", start_date="
				+ start_date + ", end_date=" + end_date + ", renew_qt="
				+ renew_qt + ", isreturn=" + isreturn + "]";
	}


	
}
