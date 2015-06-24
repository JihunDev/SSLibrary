package com.entity;

public class Book {
	private String id;
	private String name;
	private String writer;
	private String img;
	private String floor;
	private int total_qt;
	private int current_qt;
	private String reg_date;
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String id) {
		this.id = id;
	}


	public Book(String id, String name, String writer, String img,
			String floor, int total_qt, int current_qt) {
		this.id = id;
		this.name = name;
		this.writer = writer;
		this.img = img;
		this.floor = floor;
		this.total_qt = total_qt;
		this.current_qt = current_qt;
	}

	public Book(String id, String name, String writer, String img,
			String floor, int total_qt, int current_qt, String reg_date) {
		this.id = id;
		this.name = name;
		this.writer = writer;
		this.img = img;
		this.floor = floor;
		this.total_qt = total_qt;
		this.current_qt = current_qt;
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public int getTotal_qt() {
		return total_qt;
	}
	public void setTotal_qt(int total_qt) {
		this.total_qt = total_qt;
	}
	public int getCurrent_qt() {
		return current_qt;
	}
	public void setCurrent_qt(int current_qt) {
		this.current_qt = current_qt;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", writer=" + writer
				+ ", img=" + img + ", floor=" + floor + ", total_qt="
				+ total_qt + ", current_qt=" + current_qt + ", reg_date="
				+ reg_date + "]";
	}

	
	
}
