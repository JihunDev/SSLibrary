package com.entity;

public class BookLog {
	private int id;
	private String b_id;
	private String u_id;
	private String start_date;
	private String end_date;
	private String real_date;
	private int renew_qt;
	public BookLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public BookLog(int id) {
		this.id = id;
	}


	public BookLog(String b_id, String u_id) {
		this.b_id = b_id;
		this.u_id = u_id;
	}


	public BookLog(int id, String b_id, String u_id, int renew_qt) {
		this.id = id;
		this.b_id = b_id;
		this.u_id = u_id;
		this.renew_qt = renew_qt;
	}
	


	public BookLog(int id, String b_id, String u_id, String end_date,
			int renew_qt) {
		super();
		this.id = id;
		this.b_id = b_id;
		this.u_id = u_id;
		this.end_date = end_date;
		this.renew_qt = renew_qt;
	}


	public BookLog(int id, String b_id, String u_id, String start_date,
			String end_date, String real_date, int renew_qt) {
		super();
		this.id = id;
		this.b_id = b_id;
		this.u_id = u_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.real_date = real_date;
		this.renew_qt = renew_qt;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
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
	public String getReal_date() {
		return real_date;
	}
	public void setReal_date(String real_date) {
		this.real_date = real_date;
	}
	public int getRenew_qt() {
		return renew_qt;
	}
	public void setRenew_qt(int renew_qt) {
		this.renew_qt = renew_qt;
	}
	@Override
	public String toString() {
		return "BookLog [id=" + id + ", b_id=" + b_id + ", u_id=" + u_id
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", real_date=" + real_date + ", renew_qt=" + renew_qt + "]";
	}
	
	
}
