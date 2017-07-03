package com.shoppingkitten.entity;


import java.io.Serializable;
import java.lang.String;

public class Send_address implements Serializable{
	private int id;
	private int uid;
	private String province;
	private String city;
	private String county;
	private String address;
	private String consignee_name;
	private String consignee_phone;
	private String code;
	private String logistics_name;
	private  int total;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Send_address{" +
				"id=" + id +
				", uid=" + uid +
				", province='" + province + '\'' +
				", city='" + city + '\'' +
				", county='" + county + '\'' +
				", address='" + address + '\'' +
				", consignee_name='" + consignee_name + '\'' +
				", consignee_phone='" + consignee_phone + '\'' +
				", code='" + code + '\'' +
				", logistics_name='" + logistics_name + '\'' +
				'}';
	}

	public Send_address(int id, int uid, String province, String city, String county, String address, String consignee_name, String consignee_phone, String code, String logistics_name) {
		this.id = id;
		this.uid = uid;
		this.province = province;
		this.city = city;
		this.county = county;
		this.address = address;
		this.consignee_name = consignee_name;
		this.consignee_phone = consignee_phone;
		this.code = code;
		this.logistics_name = logistics_name;
	}

	public Send_address() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConsignee_name() {
		return consignee_name;
	}

	public void setConsignee_name(String consignee_name) {
		this.consignee_name = consignee_name;
	}

	public String getConsignee_phone() {
		return consignee_phone;
	}

	public void setConsignee_phone(String consignee_phone) {
		this.consignee_phone = consignee_phone;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getLogistics_name() {
		return logistics_name;
	}

	public void setLogistics_name(String logistics_name) {
		this.logistics_name = logistics_name;
	}
}
