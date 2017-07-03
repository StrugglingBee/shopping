package com.shoppingkitten.entity;

public class Send_area_city {
    private int id;
    private String city;
    private int pid;

    @Override
    public String toString() {
        return "Send_area_city{" +
                "id=" + id +
                ", city='" + city + '\'' +
                ", pid=" + pid +
                '}';
    }

    public Send_area_city(int id, String city, int pid) {
        this.id = id;
        this.city = city;
        this.pid = pid;
    }

    public Send_area_city() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
