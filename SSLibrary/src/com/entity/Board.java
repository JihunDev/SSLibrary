package com.entity;

public class Board {
	private int id;
	private String u_id;
	private int counter;
	private String title;
	private String content;
	private String reg_date;
	private String sort;
	private String file_name;
	private int reg_number;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Board(int id) {
		super();
		this.id = id;
	}


	public Board(int id, String sort) {
		super();
		this.id = id;
		this.sort = sort;
	}


	public Board(String u_id, String content, String sort, int reg_number) {
		super();
		this.u_id = u_id;
		this.content = content;
		this.sort = sort;
		this.reg_number = reg_number;
	}

	public Board(String u_id, String title, String content, String sort,
			String file_name) {
		this.u_id = u_id;
		this.title = title;
		this.content = content;
		this.sort = sort;
		this.file_name = file_name;
	}

	public Board(String u_id, String title, String content, String sort,
			String file_name, int reg_number) {
		super();
		this.u_id = u_id;
		this.title = title;
		this.content = content;
		this.sort = sort;
		this.file_name = file_name;
		this.reg_number = reg_number;
	}

	public Board(int id, String title, String content, String sort,
			String file_name) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.sort = sort;
		this.file_name = file_name;
	}

	public Board(int id, String content, String sort) {
		super();
		this.id = id;
		this.content = content;
		this.sort = sort;
	}


	public Board(int id, String u_id, int counter, String title,
			String content, String reg_date, String sort, String file_name,
			int reg_number) {
		this.id = id;
		this.u_id = u_id;
		this.counter = counter;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.sort = sort;
		this.file_name = file_name;
		this.reg_number = reg_number;
	}
		
	@Override
	public String toString() {
		return "Board [id=" + id + ", u_id=" + u_id + ", title=" + title
				+ ", content=" + content + ", reg_date=" + reg_date + ", sort="
				+ sort + ", file_name=" + file_name + ", reg_number="
				+ reg_number + ", counter=" + counter + "]";
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getReg_number() {
		return reg_number;
	}

	public void setReg_number(int reg_number) {
		this.reg_number = reg_number;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

}
