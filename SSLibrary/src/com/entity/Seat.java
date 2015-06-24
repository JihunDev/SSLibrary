package com.entity;

public class Seat {
	private int id;
	private String state;
	
	public Seat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Seat(int id, String state) {
		super();
		this.id = id;
		this.state = state;
	}
	
	
	public Seat(String state) {
		super();
		this.state = state;
	}
	
	// SELECT #{id}
	public Seat(int id) {
		super();
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Seat [id=" + id + ", state=" + state + "]";
	}
	
	
}
