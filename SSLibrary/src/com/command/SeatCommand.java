package com.command;

public class SeatCommand {
	private int id;
	private String state;
	
	public SeatCommand() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SeatCommand(int id, String state) {
		super();
		this.id = id;
		this.state = state;
	}
	
	
	public SeatCommand(String state) {
		super();
		this.state = state;
	}
	
	// SELECT #{id}
	public SeatCommand(int id) {
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
