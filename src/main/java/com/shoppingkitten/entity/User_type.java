package com.shoppingkitten.entity;


import java.io.Serializable;
import java.lang.String;

public class User_type implements Serializable{
	private int tid;
	private String type_name;
	private int integral_start;
	private int integral_end;
	private float menber_power;

	@Override
	public String toString() {
		return "User_type{" +
				"tid=" + tid +
				", type_name='" + type_name + '\'' +
				", integral_start=" + integral_start +
				", integral_end=" + integral_end +
				", menber_power=" + menber_power +
				'}';
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public int getIntegral_start() {
		return integral_start;
	}

	public void setIntegral_start(int integral_start) {
		this.integral_start = integral_start;
	}

	public int getIntegral_end() {
		return integral_end;
	}

	public void setIntegral_end(int integral_end) {
		this.integral_end = integral_end;
	}

	public float getMenber_power() {
		return menber_power;
	}

	public void setMenber_power(float menber_power) {
		this.menber_power = menber_power;
	}

	public User_type() {

	}

	public User_type(int tid, String type_name, int integral_start, int integral_end, float menber_power) {

		this.tid = tid;
		this.type_name = type_name;
		this.integral_start = integral_start;
		this.integral_end = integral_end;
		this.menber_power = menber_power;
	}

}