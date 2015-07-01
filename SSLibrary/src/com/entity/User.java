package com.entity;

public class User {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String img;
	private String email;
	private String reg_date;
	private String stop_date;
	private String isadmin;

	public User() {
		super();

	}

	public User(String id) {
		this.id = id;
	}

	public User(String id, String isadmin) {
		super();
		this.id = id;
		this.isadmin = isadmin;
	}

	public User(String id, String name, String isadmin) {
		super();
		this.id = id;
		this.name = name;
		this.isadmin = isadmin;
	}

	public User(String id, String pwd, String name, String phone, String img,
			String email, String isadmin) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.img = img;
		this.email = email;
		this.isadmin = isadmin;
	}

	public User(String id, String pwd, String name, String phone, String img,
			String email, String reg_date, String isadmin) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.img = img;
		this.email = email;
		this.reg_date = reg_date;
		this.isadmin = isadmin;
	}

	public User(String id, String pwd, String name, String phone, String img,
			String email, String reg_date, String stop_date, String isadmin) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.img = img;
		this.email = email;
		this.reg_date = reg_date;
		this.stop_date = stop_date;
		this.isadmin = isadmin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}

	public String getStop_date() {
		return stop_date;
	}

	public void setStop_date(String stop_date) {
		this.stop_date = stop_date;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + ", name=" + name
				+ ", phone=" + phone + ", img=" + img + ", email=" + email
				+ ", reg_date=" + reg_date + ", stop_date=" + stop_date
				+ ", isadmin=" + isadmin + "]";
	}

}
