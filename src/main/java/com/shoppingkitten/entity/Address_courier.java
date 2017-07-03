package com.shoppingkitten.entity;

public class Address_courier {
    private int id;
    private String name;
    private String time;
    private int total;

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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Address_courier() {

    }

    public Address_courier(int id, String name, String time, int total) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.total = total;
    }
}