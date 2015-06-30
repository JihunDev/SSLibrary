package com.entity;

public class MessageLog {
	private int id;
	private String u_id;
	private int s_id;
	private String sender_id;
	private String text;
	private String read;
	private String send_date;
	private String read_date;

	public MessageLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageLog(int id) {
		this.id = id;
	}

	public MessageLog(String u_id) {
		super();
		this.u_id = u_id;
	}

	public MessageLog(int id, String read) {
		this.id = id;
		this.read = read;
	}

	public MessageLog(String u_id, int s_id, String sender_id, String text) {
		this.u_id = u_id;
		this.s_id = s_id;
		this.sender_id = sender_id;
		this.text = text;
	}

	public MessageLog(int id, String u_id, int s_id, String sender_id,
			String text, String read, String send_date, String read_date) {
		super();
		this.id = id;
		this.u_id = u_id;
		this.s_id = s_id;
		this.sender_id = sender_id;
		this.text = text;
		this.read = read;
		this.send_date = send_date;
		this.read_date = read_date;
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

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getRead_date() {
		return read_date;
	}

	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}

	@Override
	public String toString() {
		return "MessageLog [id=" + id + ", u_id=" + u_id + ", s_id=" + s_id
				+ ", sender_id=" + sender_id + ", text=" + text + ", read="
				+ read + ", send_date=" + send_date + ", read_date="
				+ read_date + "]";
	}

}
