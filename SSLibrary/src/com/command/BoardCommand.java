package com.command;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	private int id;
	private String u_id;
	private int counter;
	private String title;
	private String content;
	private String reg_date;
	private String sort;
	private MultipartFile file_name;
	private int reg_number;

	public BoardCommand() {
		super();
	}


	public BoardCommand(String u_id, String title, String content,
			String sort, MultipartFile file_name, int reg_number) {
		super();
		this.u_id = u_id;
		this.title = title;
		this.content = content;
		this.sort = sort;
		this.file_name = file_name;
		this.reg_number = reg_number;
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

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public MultipartFile getFile_name() {
		return file_name;
	}

	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}

	public int getReg_number() {
		return reg_number;
	}

	public void setReg_number(int reg_number) {
		this.reg_number = reg_number;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", u_id=" + u_id + ", counter=" + counter
				+ ", title=" + title + ", content=" + content + ", reg_date="
				+ reg_date + ", sort=" + sort + ", file_name=" + file_name
				+ ", reg_number=" + reg_number + "]";
	}
}
