package com.shoppingkitten.entity;

public class Send_area_province {
    private int id;
    private String province;
    private int pid;

    @Override
    public String toString() {
        return "Send_area_province{" +
                "id=" + id +
                ", province='" + province + '\'' +
                ", pid=" + pid +
                '}';
    }

    public Send_area_province(int id, String province, int pid) {
        this.id = id;
        this.province = province;
        this.pid = pid;
    }

    public Send_area_province() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
