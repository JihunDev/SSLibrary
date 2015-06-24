package com.entity;

public class SeatLog {
	private int id;
	private String u_id;
	private int s_id;
	private String start_date;
	private String end_date;
	private String real_date;
	private int renew_qt;
	public SeatLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SeatLog(int id, String u_id, int s_id, String start_date,
			String end_date, String real_date, int renew_qt) {
		super();
		this.id = id;
		this.u_id = u_id;
		this.s_id = s_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.real_date = real_date;
		this.renew_qt = renew_qt;
	}
	
	// INSERT : U_ID, S_ID
	public SeatLog(String u_id, int s_id) {
		super();
		this.u_id = u_id;
		this.s_id = s_id;
	}
	
	// UPDATE(¿¬Àå, ¹İ³³): U_ID
	public SeatLog(String u_id) {
		super();
		this.u_id = u_id;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
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
		return "SeatLog [id=" + id + ", u_id=" + u_id + ", s_id=" + s_id
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", real_date=" + real_date + ", renew_qt=" + renew_qt + "]";
	}

}
