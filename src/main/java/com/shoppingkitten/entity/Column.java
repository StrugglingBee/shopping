package com.shoppingkitten.entity;


import java.io.Serializable;
import java.lang.String;

public class Column implements Serializable{
	private int id;
	private String name;
	private int pid;
	private int counts;
	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}
	public Column() {
	}

	public Column(int id, String name, int pid) {

		this.id = id;
		this.name = name;
		this.pid = pid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}



}