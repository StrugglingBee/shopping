package com.shoppingkitten.entity;

import java.util.HashSet;
import java.util.Set;

public class Address_area {
    private int id;
    private String name;
    private int pid;
    private int lable;
    private int bank;

    public int getBank() {
        return bank;
    }

    public void setBank(int bank) {
        this.bank = bank;
    }

    public Address_area() {
        super();
    }

    @Override
    public String toString() {
        return "Address_area{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pid=" + pid +
                ", lable=" + lable +
                '}';
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

    public int getLable() {
        return lable;
    }

    public void setLable(int lable) {
        this.lable = lable;
    }

    public Address_area(int id, String name, int pid, int lable) {
        this.id = id;
        this.name = name;
        this.pid = pid;
        this.lable = lable;
    }

    private Set<Address_area> children=new HashSet<>();

    public Set<Address_area> getChildren() {
        return children;
    }

    public void setChildren(Set<Address_area> children) {
        this.children = children;
    }


}
