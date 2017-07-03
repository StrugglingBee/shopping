package com.shoppingkitten.entity;

public class Send_area_county {
    private int id;
    private String county;
    private int pid;

    @Override
    public String toString() {
        return "Send_area_county{" +
                "id=" + id +
                ", county='" + county + '\'' +
                ", pid=" + pid +
                '}';
    }

    public Send_area_county(int id, String county, int pid) {
        this.id = id;
        this.county = county;
        this.pid = pid;
    }

    public Send_area_county() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
