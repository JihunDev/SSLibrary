package com.command;

import org.springframework.web.multipart.MultipartFile;

public class BookUploadCommand {
	private String id;
	private String name;
	private String writer;
	private MultipartFile img;
	private String floor;
	private int total_qt;
	private int current_qt;
	private String reg_date;
	
	
	public BookUploadCommand() {
		super();
	}


	public BookUploadCommand(String id, String name, String writer,
			MultipartFile img, String floor, int total_qt, int current_qt,
			String reg_date) {
		super();
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public MultipartFile getImg() {
		return img;
	}


	public void setImg(MultipartFile img) {
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


	@Override
	public String toString() {
		return "BookUploadCommand [id=" + id + ", name=" + name + ", writer="
				+ writer + ", img=" + img + ", floor=" + floor + ", total_qt="
				+ total_qt + ", current_qt=" + current_qt + ", reg_date="
				+ reg_date + "]";
	}
	
	
	
	
}
